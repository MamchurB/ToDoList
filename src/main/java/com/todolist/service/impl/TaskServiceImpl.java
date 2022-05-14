package com.todolist.service.impl;

import com.todolist.model.Task;
import com.todolist.model.User;
import com.todolist.repository.MenuRepository;
import com.todolist.repository.TaskRepository;
import com.todolist.repository.UserRepository;
import com.todolist.service.TaskService;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<Task> taskList() {
        return taskRepository.taskList();
    }

    @Override
    public Page<Task> findTaskByUserId(Pageable pageable, String nameUser) {
        return taskRepository.findTaskByUserId(userRepository.findByUsername(nameUser).getUserId(), new PageRequest(pageable.getPageNumber() - 1, 5));
    }

    @Override
    public Page<Task> findAll(Pageable pageable) {
        return taskRepository.findAll(new PageRequest(pageable.getPageNumber() - 1, 5));
    }

    @Override
    public List<Task> findTasksByStart(String date, Long userId) {
        return taskRepository.findTasksByStart(date, userId);
    }

    @Override
    public List<Task> findAll() {
        return taskRepository.findAll();
    }

    @Override
    public Task findOne(Long id) {
        return taskRepository.findOne(id);
    }

    @Override
    public String taskExecuted(Long id) {
        Task task = taskRepository.findOne(id);
        System.out.println("taskExecuted");
        if(task.getTaskExecuted().equals(0)){
            task.setTaskExecuted(1);
            System.out.println(task.getTaskExecuted());
        }
        else
            task.setTaskExecuted(0);
        taskRepository.save(task);


        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("message", "Task changed successfully.");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @Override
    public HashMap<String, Object> getBestCategory() {
        Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
        String username = loggedInUser.getName();

        HashMap<String, Object> bestProductMap = new HashMap<>();

        List<Task> BestCategoryList = taskRepository.findAll();

        List<String> label = new ArrayList<>();
        List<String> percent = new ArrayList<>();
        label.add("Completed");
        label.add("Uncompleted");
        int executedCount = taskRepository.findTasksByTaskExecutedAndUserId(0, userRepository.findByUsername(username).getUserId()).size();
        int unactedCount = 100 - executedCount;
        Integer sumExecutedUnacted = executedCount + unactedCount;

        if(!sumExecutedUnacted.equals(0)){
            percent.add(String.valueOf(executedCount * 100 / sumExecutedUnacted));
            percent.add(String.valueOf(unactedCount * 100 / sumExecutedUnacted));
        }else{
            percent.add(String.valueOf(50));
            percent.add(String.valueOf(50));
        }

        bestProductMap.put("bcLabels", label.toString());
        bestProductMap.put("bcPercents", percent.toString());
        return bestProductMap;
    }

    @Override
    public List<Task> findTaskByTaskTypeAndUserId(String taskType, Long id) {
        return taskRepository.findTaskByTaskTypeAndUserId(taskType, id);
    }

    @Override
    public List<Task> findTasksByParentTaskId(Integer taskId) {
        return  taskRepository.findTasksByParentTaskId(taskId);
    }

    @Override
    public String addTask(Task task) {
        String message = null;
        JSONObject jsonObject = new JSONObject();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();

        task.setUserId(userRepository.findByUsername(currentPrincipalName).getUserId());
        if(task.getTaskExecuted() == null)
            task.setTaskExecuted(0);
        try {
            if(task.getTaskId() == null) {
                message = "Added";
            } else {
                message = "Updated";
            }
            jsonObject.put("status", "success");
            jsonObject.put("title", message+" Confirmation");
            jsonObject.put("message", taskRepository.save(task).getTitle()+" "+message+" successfully.");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }


    @Override
    public String deleteTask(Long id) {
        JSONObject jsonObject = new JSONObject();
        try {
            taskRepository.delete(id);
            jsonObject.put("message", "Task Deleted Successfully.");
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return jsonObject.toString();
    }

    @Override
    public List<Task> findTasksByUserId(Long userId) {
        return taskRepository.findTasksByUserId(userId);
    }
}