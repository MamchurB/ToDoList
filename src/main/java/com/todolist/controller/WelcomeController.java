package com.todolist.controller;

import com.todolist.model.Menu;
import com.todolist.model.Role;
import com.todolist.model.Task;
import com.todolist.model.User;
import com.todolist.repository.RoleRepository;
import com.todolist.service.UserService;
import com.todolist.utils.MethodUtils;
import com.todolist.service.MenuService;
import com.todolist.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
public class WelcomeController {

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private TaskService taskService;

	@Autowired
	private UserService userService;
	@RequestMapping("/")
	public String welcome(Model model) {

		LocalDate dateObj = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String pattern = "EEEE, MMMM dd'" + MethodUtils.getDayNumberSuffix(dateObj.getDayOfMonth()) + "' yyyy";
		DateTimeFormatter formatterForNowDate = DateTimeFormatter.ofPattern(pattern, Locale.ENGLISH);

		String date = dateObj.format(formatter);
		String dateNow = dateObj.format(formatterForNowDate);

		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();

		MethodUtils.taskEditPage = "welcome";

		model.addAttribute("lang", userService.findByUsernam(username).getLang());
		model.addAttribute("theme", userService.findByUsernam(username).getTheme());
		model.addAttribute("taskToday", taskService.findTasksByStart(date, userService.findByUsernam(username).getUserId()));
		model.addAttribute("today", dateNow);

		model.addAttribute("bc",taskService.getBestCategory());
		return "welcome";
	}
}
