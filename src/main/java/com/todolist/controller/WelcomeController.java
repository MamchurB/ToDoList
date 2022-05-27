package com.todolist.controller;


import com.todolist.repository.RoleRepository;
import com.todolist.service.UserService;
import com.todolist.utils.MethodUtils;
import com.todolist.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

@Controller
public class WelcomeController {
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
