package com.todolist.controller;

import com.todolist.model.Task;
import com.todolist.model.User;
import com.todolist.repository.RoleRepository;
import com.todolist.service.TaskService;
import com.todolist.service.UserService;
import com.todolist.utils.ErrorUtils;
import com.todolist.utils.MethodUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/task")
public class TaskController {

    private TaskService taskService;

    @Autowired
    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }


    @GetMapping("/edit/{id}")
    public String userOne(@PathVariable Long id, Model model) {
        model.addAttribute("isNew", false);
        model.addAttribute("userForm", taskService.findOne(id));
        return "user/form";
    }

    @GetMapping(value = "/delete/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public @ResponseBody String userDelete(@PathVariable Long id) {
        return taskService.deleteTask(id);
    }

    @PostMapping(value="/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public @ResponseBody String userAdd(@Valid @RequestBody Task task, BindingResult result) {
        if(result.hasErrors()) {
            return ErrorUtils.customErrors(result.getAllErrors());
        } else {
            return taskService.addTask(task);
        }
    }

    @GetMapping("/list/{id}")
    public Task findOne(@PathVariable Long id) {
        return taskService.findOne(id);
    }

    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
    public String userList(Model model, Pageable pageable) {
        Page<Task> pages = taskService.findAll(pageable);
        model.addAttribute("users", pages.getContent());
        MethodUtils.pageModel(model, pages);
        return "/user/list";
    }


}