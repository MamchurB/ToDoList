package com.todolist.controller;

import com.todolist.model.Task;
import com.todolist.model.User;
import com.todolist.repository.RoleRepository;
import com.todolist.service.MenuService;
import com.todolist.service.TaskService;
import com.todolist.service.UserService;
import com.todolist.utils.ErrorUtils;
import com.todolist.utils.MethodUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/task")
public class TaskController {

    private TaskService taskService;

    @Autowired
    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping("/edit/{id}")
    public String taskOne(@PathVariable Long id, Model model) {
        model.addAttribute("isNew", false);
        model.addAttribute("taskForm", taskService.findOne(id));
        return "task/form";
    }
    @GetMapping("/form")
    public String taskForm(Model model) {
        model.addAttribute("isNew", true);
        model.addAttribute("taskForm", new Task());
        return "task/form";
    }

    @GetMapping(value = "/delete/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public @ResponseBody String taskDelete(@PathVariable Long id) {
        return taskService.deleteTask(id);
    }

    @PostMapping(value="/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public @ResponseBody String taskAdd(@Valid @RequestBody Task task, BindingResult result) {

        return taskService.addTask(task);

    }

    @GetMapping("/list/{id}")
    public Task findOne(@PathVariable Long id) {
        return taskService.findOne(id);
    }

    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
    public String taskList(Model model, Pageable pageable, Principal principal) {
        System.out.println("Поточний юзер " + principal.getName());

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