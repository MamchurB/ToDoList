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

    @GetMapping("/form")
    public String taskForm(Model model) {
        model.addAttribute("isNew", true);
        model.addAttribute("taskForm", new Task());
        return "task/form";
    }

    @GetMapping(value = "/delete/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String taskDelete(@PathVariable Long id) {
        return taskService.deleteTask(id);
    }

    @GetMapping(value = "/executed/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String taskExecuted(@PathVariable Long id)  {
       return taskService.taskExecuted(id);
    }

    @GetMapping(value = "/fillTaskForm/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String taskFill(@PathVariable Long id, Model model)  {
        model.addAttribute("taskForm", taskService.findOne(editTaskId));
        JSONObject jsonObject = new JSONObject();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();

        try {

            jsonObject.put("status", "success");
            jsonObject.put("title", "Updated" +" Confirmation");
            jsonObject.put("message", "Updated"+" successfully.");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }
    @GetMapping("/edit/{id}")
    public String taskOne(@PathVariable Long id, Model model) {
        System.out.println("Edit Data");
        model.addAttribute("isNew", false);
        model.addAttribute("taskForm", taskService.findOne(id));
        return "task/form";
    }

    @PostMapping(value="/edit", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
    public String taskEdit(@RequestBody Task task, BindingResult result) {
        System.out.println("taskEdit Зайшло");

        System.out.println(task.getTaskExecuted());
        System.out.println(task.getTaskId());

        return taskService.addTask(task);
    }

//    @GetMapping (value = "/edit/{id}")
//    public @ResponseBody String taskEditId(@PathVariable Long id, Model model) {
//        System.out.println("TaskOne Зайшло");
//        model.addAttribute("taskForm", taskService.findOne(id));
//        editTaskId = id;
//
//        JSONObject jsonObject = new JSONObject();
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        String currentPrincipalName = authentication.getName();
//
//        try {
//
//            jsonObject.put("status", "success");
//            jsonObject.put("title", "Updated" +" Confirmation");
//            jsonObject.put("message", "Updated"+" successfully.");
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }
//        return jsonObject.toString();
//    }
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