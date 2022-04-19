package com.todolist.service;

import com.todolist.model.Menu;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MenuService {

    List<Menu> findAll();
}
