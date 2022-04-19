package com.todolist.service.impl;

import com.todolist.model.Menu;
import com.todolist.repository.MenuRepository;
import com.todolist.repository.UserRepository;
import com.todolist.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuRepository menuRepository;

    @Override
    public List<Menu> findAll() {
        return menuRepository.findAll();
    }

}