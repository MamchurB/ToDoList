package com.todolist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import com.todolist.model.Role;
import com.todolist.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.todolist.model.User;
import com.todolist.service.UserService;
import com.todolist.utils.ErrorUtils;
import com.todolist.utils.MethodUtils;

@Controller
@RequestMapping("/user")
public class UserController {
	private UserService userService;

	@Autowired
     private RoleRepository roleRepository;

	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("/login")
	public String login(Model model, String error, String logout) {
		if (error != null){
			model.addAttribute("error", "Your username or password is invalid.");
		}
		if (logout != null){
			model.addAttribute("message", "You have been logged out successfully.");
		}

		return "login";
	}

	@GetMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());

		return "registration";
	}
	@GetMapping("/about-us")
	public String aboutUs(Model model) {
		return "about-us";
	}

	@PostMapping("/registration")
	public String addUser(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
		userForm.setRole(roleRepository.findOne(2L));
		userForm.setRoleId(2L);
		if (!userForm.getPassword().equals(userForm.getPasswordConfirm())){
			model.addAttribute("passwordError", "Password not equals"
					+ userForm.getPassword() + " має бути " + userForm.getPasswordConfirm());
			return "registration";
		}
		if (bindingResult.hasErrors()) {
			return "registration";
		}

		userService.addUser(userForm);

		return "login";
	}
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login"; //You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}


	@GetMapping("/form")
	public String userForm(Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("userForm", new User());
		model.addAttribute("roles", userService.roleList());
		return "user/form";
	}
	
	@GetMapping("/edit/{id}")
	public String userOne(@PathVariable Long id, Model model) {
		model.addAttribute("isNew", false);
		model.addAttribute("userForm", userService.findOne(id));
		model.addAttribute("roles", userService.roleList());
		return "user/form";
	}
	
	@GetMapping(value = "/delete/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody String userDelete(@PathVariable Long id) {
		return userService.deleteUser(id);
	}
	
	@PostMapping(value="/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody String userAdd(@Valid @RequestBody User user, BindingResult result) {
		if(result.hasErrors()) {
			return ErrorUtils.customErrors(result.getAllErrors());
		} else {
			return userService.addUser(user);
		}
	}
	
	@GetMapping("/list/{id}")
	public User findOne(@PathVariable Long id) {
		return userService.findOne(id);
	}
	
	@GetMapping("/list")
	@PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
	public String userList(Model model, Pageable pageable) {
		Page<User> pages = userService.findAll(pageable);
		model.addAttribute("users", pages.getContent());
		MethodUtils.pageModel(model, pages);
		return "/user";
	}
	
	@GetMapping("/refresh")
	public String refreshCache(Model model, Pageable pageable) {
		userService.refreshCache();
		Page<User> pages = userService.findAll(pageable);
		model.addAttribute("users", pages.getContent());
		MethodUtils.pageModel(model, pages);
		return "/user/list";
	}
}
