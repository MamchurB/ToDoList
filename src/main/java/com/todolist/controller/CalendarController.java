package com.todolist.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.todolist.model.Event;
import com.todolist.repository.EventJpaRepository;
import com.todolist.service.TaskService;
import com.todolist.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
class CalendarController {

    @Autowired
    private EventJpaRepository eventRepository;

    @Autowired
    private TaskService taskService;

    @Autowired
    private UserService userService;

    @GetMapping ("/calendar")
    public String calendar(Model model) throws JsonProcessingException {
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username = loggedInUser.getName();
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
        model.addAttribute("events", objectMapper.writeValueAsString(taskService.findTasksByUserId(userService.findByUsernam(username).getUserId())));
        return "calendar";
    }

}