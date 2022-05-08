package com.todolist.controller;

import com.todolist.model.Task;
import com.todolist.service.TaskService;
import com.todolist.utils.MethodUtils;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequestMapping("/task")
public class TaskController {

    private TaskService taskService;

    @Autowired
    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    private Long editTaskId;

    @GetMapping("/waiting_for")
    public String waitingForList(Model model) {

        model.addAttribute("tasks", taskService.findTaskByTaskType("waiting-for"));
        return "waiting-for";
    }
    @GetMapping("/form")
    public String taskForm(Model model) {
        model.addAttribute("isNew", true);
        model.addAttribute("taskForm", new Task());
        return "form";
    }

    @GetMapping(value = "/delete/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String taskDelete(@PathVariable Long id) {
        return taskService.deleteTask(id);
    }

    @GetMapping(value = "/executed/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String taskExecuted(@PathVariable Long id)  {
        System.out.println("TaskExecuted");
       return taskService.taskExecuted(id);
    }

    @GetMapping("/edit/{id}")
    public String taskOne(@PathVariable Long id, Model model) {
        model.addAttribute("isNew", false);
        Task task = taskService.findOne(id);
        task.setStart(task.getStart().substring(0, 10) + "T" + task.getStart().substring(11, 16));
        task.setEnd(task.getEnd().substring(0, 10) + "T" + task.getStart().substring(11, 16));
        System.out.println(task.getStart());
        model.addAttribute("taskForm", task);
        return "form";
    }

    @PostMapping(value="/edit", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
    public String taskEdit(@RequestBody Task task, BindingResult result) {
         return taskService.addTask(task);
    }

    @PostMapping(value="/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String taskAdd(@Valid @RequestBody Task task, BindingResult result) {
        return taskService.addTask(task);
    }

    @GetMapping("/list/{id}")
    public Task findOne(@PathVariable Long id) {
        return taskService.findOne(id);
    }

    @GetMapping("/list")
    public String taskList(Model model, Pageable pageable, Principal principal) {
        Page<Task> pages = taskService.findTaskByUserId(pageable, principal.getName());
        model.addAttribute("tasks", pages.getContent());
        MethodUtils.pageModel(model, pages);
        return "/task/list";
    }

    @GetMapping("/refresh")
    public String refreshCache(Model model, Pageable pageable) {
        Page<Task> pages = taskService.findAll(pageable);
        model.addAttribute("tasks", pages.getContent());
        MethodUtils.pageModel(model, pages);
        return "/task/list";
    }
}