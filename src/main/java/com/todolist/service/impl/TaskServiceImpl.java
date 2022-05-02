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
    public HashMap<String, Object> getBestCategory() {
        HashMap<String, Object> bestProductMap = new HashMap<>();

        List<Task> BestCategoryList = taskRepository.findAll();

        List<String> label = new ArrayList<>();
        List<String> percent = new ArrayList<>();
        label.add("Completed");
        label.add("Uncompleted");
        int executedCount = taskRepository.findTasksByTaskExecuted(0).size();
        int unactedCount = taskRepository.findTasksByTaskExecuted(1).size();

        percent.add(String.valueOf(executedCount * 100 / (executedCount + unactedCount)));
        percent.add(String.valueOf(unactedCount * 100 / (executedCount + unactedCount)));

        System.out.println(String.valueOf(executedCount * 100 / (executedCount + unactedCount)));
        System.out.println(String.valueOf(unactedCount * 100 / (executedCount + unactedCount)));

        bestProductMap.put("bcLabels", label.toString());
        bestProductMap.put("bcPercents", percent.toString());
        return bestProductMap;
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
}