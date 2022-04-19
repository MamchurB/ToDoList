package com.todolist.repository;


import com.todolist.model.Task;
import com.todolist.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {

    @Query("FROM Task")
    List<Task> taskList();

    Page<Task> findTaskByUserId(Long userId, Pageable pageable);
}
