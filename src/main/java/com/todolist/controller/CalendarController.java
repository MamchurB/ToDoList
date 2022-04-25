package com.todolist.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.todolist.model.Event;
import com.todolist.repository.EventJpaRepository;
import com.todolist.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @GetMapping ("/calendar")
    public String calendar(Model model) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        //Set pretty printing of json
        objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
        model.addAttribute("events", objectMapper.writeValueAsString(taskService.findAll()));
        return "calendar/calendar";
    }

    @RequestMapping(value="/eventlist", method=RequestMethod.GET)
    public String events(HttpServletRequest request, Model model) {
        List<Event> listEven = eventRepository.findAll();
        System.out.println("Всі події");
        for (Event e: listEven) {
            System.out.println(e.getDescription());
        }
        model.addAttribute("events", eventRepository.findAll());
        return "events";
    }
}