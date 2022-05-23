package com.todolist.controller;

import com.todolist.model.Task;
import com.todolist.service.TaskService;
import com.todolist.service.UserService;
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

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/task")
public class TaskController {

    private UserService userService;
    private TaskService taskService;

    public TaskController(@Autowired TaskService taskService, @Autowired UserService userService) {
        this.taskService = taskService;
        this.userService = userService;
    }

    private Long addingTaskId;

    @GetMapping("/notes")
    public String notesList(Model model) {
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username = loggedInUser.getName();
        List<Task> tasks = taskService.findTaskByTaskTypeAndUserId("notes", userService.findByUsernam(username).getUserId());
        model.addAttribute("theme", userService.findByUsernam(username).getTheme());
        model.addAttribute("lang", userService.findByUsernam(username).getLang());
        model.addAttribute("tasks",
                taskService.findTaskByTaskTypeAndUserId("notes", userService.findByUsernam(username).getUserId()));
        MethodUtils.taskEditPage = "notes";
        return "notes";
    }

    @GetMapping("/simple")
    public String simpleList(Model model) {
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username = loggedInUser.getName();
        model.addAttribute("lang", userService.findByUsernam(username).getLang());
        model.addAttribute("theme", userService.findByUsernam(username).getTheme());
        model.addAttribute("tasks",
                taskService.findTaskByTaskTypeAndUserId("simple", userService.findByUsernam(username).getUserId()));
        MethodUtils.taskEditPage = "simple";
        return "simple";
    }

    @GetMapping("/someday_maybe")
    public String somedayMaybeList(Model model) {
         Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
         String username = loggedInUser.getName();
        model.addAttribute("lang", userService.findByUsernam(username).getLang());
        model.addAttribute("theme", userService.findByUsernam(username).getTheme());
        model.addAttribute("tasks",
                taskService.findTaskByTaskTypeAndUserId("someday-maybe", userService.findByUsernam(username).getUserId()));
        MethodUtils.taskEditPage = "someday_maybe";
        return "someday-maybe";
    }
    @GetMapping("/waiting_for")
    public String waitingForList(Model model) {
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username = loggedInUser.getName();
        model.addAttribute("lang", userService.findByUsernam(username).getLang());
        model.addAttribute("theme", userService.findByUsernam(username).getTheme());
        model.addAttribute("lang", userService.findByUsernam(username).getLang());
        model.addAttribute("tasks",
                taskService.findTaskByTaskTypeAndUserId("waiting-for", userService.findByUsernam(username).getUserId()));
        MethodUtils.taskEditPage = "waiting_for";
        return "waiting-for";
    }

    @GetMapping("/project")
    public String projectList(Model model) {
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username = loggedInUser.getName();
        model.addAttribute("lang", userService.findByUsernam(username).getLang());
        model.addAttribute("theme", userService.findByUsernam(username).getTheme());
        model.addAttribute("tasks",
                taskService.findTaskByTaskTypeAndUserId("project",
                        userService.findByUsernam(username).getUserId()));
        MethodUtils.taskEditPage = "project";
        return "project";
    }

    @GetMapping("/form")
    public String taskForm(Model model) {
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username = loggedInUser.getName();
        model.addAttribute("lang", userService.findByUsernam(username).getLang());
        model.addAttribute("theme", userService.findByUsernam(username).getTheme());
        model.addAttribute("isNew", true);
        model.addAttribute("taskForm", new Task());
        return "form";
    }

    @GetMapping(value = "/delete/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String taskDelete(@PathVariable Long id) {
        System.out.println("Delete " + id);
        return taskService.deleteTask(id);
    }

    @GetMapping(value = "/executed/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String taskExecuted(@PathVariable Long id)  {
        String message = taskService.taskExecuted(id);
        Task task = taskService.findOne(id);
        if(task.getTaskType().equals("project")){
            if(task.getParentTaskId() == null){
                List<Task> tasks = taskService.findTasksByParentTaskId((int)(long)id);
                if(task.getTaskExecuted().equals(1)){
                    for (Task subTask: tasks) {
                        if(subTask.getTaskExecuted().equals(0)){
                            taskService.taskExecuted(subTask.getTaskId());
                        }

                    }
                }
                else if(task.getTaskExecuted().equals(0)){
                    for (Task subTask: tasks) {
                        if(subTask.getTaskExecuted().equals(1))
                            taskService.taskExecuted(subTask.getTaskId());
                    }
                }
            }
            else{
                List<Task> tasks = taskService.findTasksByParentTaskId(task.getParentTaskId());
                Task taskParent = taskService.findOne((long)(int)task.getParentTaskId());
                boolean isExecutedChild = true;
                for (Task subTask:tasks) {
                    System.out.println(subTask.getTaskExecuted().equals(0));
                    if(subTask.getTaskExecuted().equals(0)){
                        isExecutedChild = false;
                    }
                }
                if(!isExecutedChild && taskParent.getTaskExecuted().equals(1)){
                    taskService.taskExecuted((long)(int)task.getParentTaskId());
                }
                else if(isExecutedChild && taskParent.getTaskExecuted().equals(0)){
                    taskService.taskExecuted((long)(int)task.getParentTaskId());
                }
            }
        }
       return message;
    }

    @GetMapping("/edit/{id}")
    public String taskOne(@PathVariable Long id, Model model) {
        model.addAttribute("isNew", false);
        Task task = taskService.findOne(id);
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username = loggedInUser.getName();
        model.addAttribute("lang", userService.findByUsernam(username).getLang());
        model.addAttribute("theme", userService.findByUsernam(username).getTheme());
        model.addAttribute("taskForm", task);
        return "form";
    }

    @PostMapping(value="/edit")
    public String taskEdit( Task task, HttpServletRequest request) {
         taskService.addTask(task);
        if(MethodUtils.taskEditPage.equals("welcome"))
            return "redirect:/";
        return ("redirect:/task/"+ MethodUtils.taskEditPage);
    }

    @PostMapping(value="/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String taskAdd(@Valid @RequestBody Task task, BindingResult result) throws ParseException {
        if(task.getStart() == null){
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            formatter.format(new Date(System.currentTimeMillis()));
            task.setStart(formatter.format(new Date(System.currentTimeMillis())));
        }
        return taskService.addTask(task);
    }

    @PostMapping(value="/adding_sub_task")
    public String taskAddForm( Task task, Model model ) {
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username = loggedInUser.getName();

        System.out.println("Task Add" + addingTaskId);
        task.setParentTaskId((int)(long)addingTaskId);
         taskService.addTask(task);
        model.addAttribute("tasks",
                taskService.findTaskByTaskTypeAndUserId("project", userService.findByUsernam(username).getUserId()));

         return "redirect:/task/project";
    }

    @GetMapping(value="/adding_sub_task/{id}")
    public String taskAddId(@PathVariable Long id) {
        System.out.println("Sub Task Add" + id);
        addingTaskId = id;
        System.out.println(id);
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("message", "Sub Task Add Successfully.");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
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
}