package com.todolist.service;

import com.todolist.model.Event;
import com.todolist.model.Task;

import java.util.List;

public interface EventService {

    List<Event> findAll();
}