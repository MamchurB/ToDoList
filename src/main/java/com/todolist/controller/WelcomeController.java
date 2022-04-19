package com.todolist.controller;

import com.todolist.model.Menu;
import com.todolist.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class WelcomeController {

	@Autowired
	private MenuService menuService;

	@RequestMapping("/")
	public String welcome(Model model) {

		model.addAttribute("heading", "What is Lorem Ipsum?");
		model.addAttribute("description", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");

		model.addAttribute("listMenu", menuService.findAll());

		return "welcome";
	}
}
