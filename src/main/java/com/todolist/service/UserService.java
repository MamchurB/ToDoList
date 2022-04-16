package com.todolist.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.todolist.model.Role;
import com.todolist.model.User;

public interface UserService {
	List<User> userList();
	
	Page<User> findAll(Pageable pageable);
	
	User findOne(Long id);
	
	String addUser(User user);
	
	String deleteUser(Long id);
	
	List<Role> roleList();
	
	void refreshCache();
}
