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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/task")
public class TaskController {

    private TaskService taskService;

    @Autowired
    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    private Long editTaskId;

    @GetMapping("/someday_maybe")
    public String somedayMaybeList(Model model) {
        model.addAttribute("tasks", taskService.findTaskByTaskType("someday-maybe"));
        return "someday-maybe";
    }
    @GetMapping("/waiting_for")
    public String waitingForList(Model model) {
        model.addAttribute("tasks", taskService.findTaskByTaskType("waiting-for"));
        return "waiting-for";
    }

    @GetMapping("/project")
    public String projectList(Model model) {
        model.addAttribute("tasks", taskService.findTaskByTaskType("project"));
        return "project";
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
        Task task = taskService.findOne(id);
        if(task.getTaskType().equals("project")){
            if(task.getParentTaskId() == null){
                List<Task> tasks = taskService.findTasksByParentTaskId( (int)(long) id);
                for (Task subTask: tasks) {
                    System.out.println(subTask.getTitle());
                    taskService.taskExecuted(subTask.getTaskId());
//                    subTask.setTaskExecuted(1);
                }
            }
        }
       return taskService.taskExecuted(id);
    }

    @GetMapping("/edit/{id}")
    public String taskOne(@PathVariable Long id, Model model) {
        model.addAttribute("isNew", false);
        Task task = taskService.findOne(id);
        if(task.getStart() != null && task.getEnd() != null) {
            task.setStart(task.getStart().substring(0, 10) + "T" + task.getStart().substring(11, 16));
            task.setEnd(task.getEnd().substring(0, 10) + "T" + task.getStart().substring(11, 16));
        }
        model.addAttribute("taskForm", task);

        if(task.getTaskType().equals("waiting-for"))
            model.addAttribute("forms", Arrays.asList("owner", "start", "end"));
        else if(task.getTaskType().equals("project"))
            model.addAttribute("forms", Arrays.asList("start", "end"));
        else if(task.getTaskType().equals("someday-maybe") || task.getTaskType().equals("notes"))
            model.addAttribute("forms", Collections.emptyList());
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
    @PostMapping(value="/add/id", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String taskAddId(@PathVariable Long id, @Valid @RequestBody Task task) {
        task.setParentTaskId((int)(long)id);
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