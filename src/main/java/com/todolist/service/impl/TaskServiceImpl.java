package com.todolist.service.impl;

import com.todolist.model.Task;
import com.todolist.model.User;
import com.todolist.repository.TaskRepository;
import com.todolist.service.TaskService;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository taskRepository;


    @Override
    public List<Task> userList() {
        return taskRepository.taskList();
    }

    @Override
    public Page<Task> findAll(Pageable pageable) {
        return taskRepository.findAll(new PageRequest(pageable.getPageNumber() - 1, 5));
    }

    @Override
    public Task findOne(Long id) {
        return taskRepository.findOne(id);
    }

    @Override
    public String addTask(Task task) {
        String message = null;
        JSONObject jsonObject = new JSONObject();
        try {
            if(task.getTaskId() == null) {
                message = "Added";
            } else {
                message = "Updated";
            }
            jsonObject.put("status", "success");
            jsonObject.put("title", message+" Confirmation");
            jsonObject.put("message", taskRepository.save(task).getTaskName()+" "+message+" successfully.");
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