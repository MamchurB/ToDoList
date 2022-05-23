package com.todolist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.todolist.model.ConfirmationToken;
import com.todolist.repository.ConfirmationTokenRepository;
import com.todolist.repository.RoleRepository;
import com.todolist.service.impl.EmailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.todolist.model.User;
import com.todolist.service.UserService;
import com.todolist.utils.MethodUtils;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
	private UserService userService;

	@Autowired
	private ConfirmationTokenRepository confirmationTokenRepository;

	@Autowired
	private EmailSenderService emailSenderService;

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
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();
		model.addAttribute("lang", userService.findByUsernam(username).getLang());
		model.addAttribute("theme", userService.findByUsernam(username).getTheme());
		return "about-us";
	}

	@PostMapping("/registration")
	public String addUser(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {

		User user = userService.findByUsernam(userForm.getUserName());

	    userForm.setRole(roleRepository.findOne(2L));
		userForm.setRoleId(2L);

		if( user !=null && (user.getUserName() == null || user.getUserName().equals(userForm.getUserName()) || userForm.getUserName().length() == 0)){
			model.addAttribute("userError", "This name already exists");
			return "registration";
		}
		if (userForm.getFullName().length() < 5 || userForm.getFullName().length() > 30){
			model.addAttribute("userFullNameError", "Please enter between 5-30 characters and no digits");
			return "registration";
		}
		if (userForm.getEmail().length() < 10 || userForm.getEmail().length() > 100){
			model.addAttribute("userEmailError", "Please enter between 10-100 characters and valid input");
			return "registration";
		}
		if ( userForm.getMobile().length() != 10){
			model.addAttribute("userMobileError", "Please enter atleast 10 digits");
			return "registration";
		}
		if (!userForm.getPassword().equals(userForm.getPasswordConfirm())  || userForm.getPassword().length() == 0){
			model.addAttribute("passwordError", "Password not equals");
			return "registration";
		}
		if (bindingResult.hasErrors()) {
			return "registration";
		}
		    userForm.setPassword(new BCryptPasswordEncoder().encode(userForm.getPassword()));
 			userService.addUser(userForm);
			ConfirmationToken confirmationToken = new ConfirmationToken(userForm);
			confirmationToken.setUser(userService.findByUsernam(userForm.getUserName()));
			confirmationTokenRepository.save(confirmationToken);
			System.out.println(userForm.getEmail());
			SimpleMailMessage mailMessage = new SimpleMailMessage();
			mailMessage.setTo(userForm.getEmail());
			mailMessage.setSubject("Complete Registration!");
			mailMessage.setFrom("chand312902@gmail.com");
			mailMessage.setText("To confirm your account, please click here : "
					+ "http://localhost:8080/todolist/user/confirm-account?token=" + confirmationToken.getConfirmationToken());

			emailSenderService.sendEmail(mailMessage);

			model.addAttribute("email", userForm.getEmail());

			return "email-confirm";
	}

	@RequestMapping(value="/confirm-account", method= {RequestMethod.GET, RequestMethod.POST})
	public String confirmUserAccount(Model model, @RequestParam("token")String confirmationToken)
	{
		ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);

		if(token != null)
		{
			User user = userService.findByEmailIgnoreCase(token.getUser().getEmail());
			System.out.println(user.getUserName());
			System.out.println(user.getEmail());
			System.out.println(user.getUserId());
//			userService.addUser(user);
		}
		else
		{
			return "email-error";
		}

		return "email-success";
	}
	@GetMapping("/language")
	public String langes(Model model) {
		System.out.println("Language");
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();
		User user = userService.findByUsernam(username);
		if(user.getLang().equals("en")){
			user.setLang("uk");
		}
		else{
			user.setLang("en");
		}
		userService.addUser(user);
		model.addAttribute("lang", userService.findByUsernam(username).getLang());
		model.addAttribute("theme", user.getTheme());
		System.out.println( user.getTheme());
		return "redirect:/";

	}
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth != null){
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/user/login";
	}
	@GetMapping("/theme")
	public String theme(Model model) {
		MethodUtils.taskEditPage = "welcome";
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();
		User user = userService.findByUsernam(username);
		if (user.getTheme().equals("/todolist/css/theme-1.css")) {
			 user.setTheme("/todolist/css/theme-2.css");
			System.out.println("theme2");
		}
		else if (user.getTheme().equals("/todolist/css/theme-2.css")) {
			user.setTheme("/todolist/css/theme-3.css");
			System.out.println("theme3");
		}
		else if (user.getTheme().equals(("/todolist/css/theme-3.css"))) {
			user.setTheme("/todolist/css/theme-4.css");
			System.out.println("theme4");
		}
		else if (user.getTheme().equals("/todolist/css/theme-4.css")) {
			user.setTheme("/todolist/css/theme-5.css");
			System.out.println("theme5");
		}
		else {
			user.setTheme("/todolist/css/theme-1.css");
			System.out.println("theme1");
		}
		model.addAttribute("lang", userService.findByUsernam(username).getLang());
		model.addAttribute("theme", user.getTheme());
		System.out.println( user.getTheme());
		userService.addUser(user);
		return "redirect:/";
	}


	@GetMapping("/form")
	public String userForm(Model model) {
		model.addAttribute("isNew", true);
		model.addAttribute("userForm", new User());
		model.addAttribute("roles", userService.roleList());
		return "user/form";
	}
	
	@GetMapping("/edit/{id}")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String userOne(@PathVariable Long id, Model model) {
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();

		System.out.println("Edit User Зайшло");
		model.addAttribute("isNew", false);
		model.addAttribute("userForm", userService.findOne(id));
		model.addAttribute("lang", userService.findByUsernam(username).getLang());
		model.addAttribute("theme", userService.findByUsernam(username).getTheme());
		model.addAttribute("roles", userService.roleList());
		return "/userForm";
	}
	
	@GetMapping(value = "/delete/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public @ResponseBody String userDelete(@PathVariable Long id) {
		return userService.deleteUser(id);
	}

	@PostMapping(value="/edit", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String taskEdit(@RequestBody User user, BindingResult result) {
		return userService.addUser(user);
	}

	@PostMapping(value="/add")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String userAdd(@RequestBody User user, Model model) {
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();
		userService.addUser(user);

		model.addAttribute("lang", userService.findByUsernam(username).getLang());
		model.addAttribute("theme", userService.findByUsernam(username).getTheme());
		model.addAttribute("users", userService.userList());
		return "/user";
	}
	
	@GetMapping("/list/{id}")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public User findOne(@PathVariable Long id) {
		return userService.findOne(id);
	}
	
	@GetMapping("/list")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String userList(Model model) {
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();

		List<User> user = userService.userList();
		model.addAttribute("users", user);
		model.addAttribute("lang", userService.findByUsernam(username).getLang());
		model.addAttribute("theme", userService.findByUsernam(username).getTheme());
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
