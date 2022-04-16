package com.todolist.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.todolist.model.Role;
import com.todolist.model.User;
import com.todolist.repository.RoleRepository;
import com.todolist.repository.UserRepository;

@Service
public class BootstrapDataService implements ApplicationListener<ContextRefreshedEvent> {
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private UserRepository userRepository;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent arg0) {
		insertRoles();
		insertUser();
	}

	private void insertRoles() {
		if(roleRepository.findAll().size() == 0) {
			List<Role> roles = new ArrayList<Role>();
			Role roleAdmin = new Role();
			roleAdmin.setName("admin");
			roles.add(roleAdmin);
			
			Role roleUser = new Role();
			roleUser.setName("user");
			roles.add(roleUser);
			
			roleRepository.save(roles);
		}
	}
	
	private void insertUser() {
		if(userRepository.userList().size() == 0) {
			User user = new User();
			user.setEmail("mamchur@gmail.com");
			user.setFullName("Mamchur Bohdan");
			user.setMobile("9876543210");
			user.setPassword(new BCryptPasswordEncoder().encode("password"));
			user.setUserId(1L);
			user.setUserName("bohdan");
			user.setRole(roleRepository.findOne(1L));
			
			userRepository.save(user);
		}
	}
}
