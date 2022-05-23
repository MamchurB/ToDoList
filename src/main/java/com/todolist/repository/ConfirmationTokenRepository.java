package com.todolist.repository;

import com.todolist.model.ConfirmationToken;
import com.todolist.model.Task;
import com.todolist.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface ConfirmationTokenRepository extends JpaRepository<ConfirmationToken, Long> {
    ConfirmationToken findByConfirmationToken(String confirmationToken);

    void deleteConfirmationTokenByUser(User user);
}