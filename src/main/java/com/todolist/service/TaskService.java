package com.todolist.service;

import com.todolist.model.Role;
import com.todolist.model.Task;
import com.todolist.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface TaskService {

    List<Task> taskList();

    List<Task> findTasksByStart(String date, Long userId);

    Page<Task> findTaskByUserId(Pageable pageable, String nameUser);
    HashMap<String, Object> getBestCategory();


    //List<Task> findTasksByTaskExecuted(Integer executed);
    List<Task> findTaskByTaskType(String taskType);

    List<Task> findTasksByParentTaskId(Integer taskId);

    Page<Task> findAll(Pageable pageable);

    List<Task> findAll();

    Task findOne(Long id);

    String taskExecuted(Long id);

    String addTask(Task user);

    String deleteTask(Long id);

}