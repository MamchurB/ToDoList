package com.todolist.service.impl;

import com.todolist.model.Event;
import com.todolist.model.Menu;
import com.todolist.repository.EventJpaRepository;
import com.todolist.repository.MenuRepository;
import com.todolist.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventServiceImpl implements EventService {

    @Autowired
    private EventJpaRepository eventRepository;

    @Override
    public List<Event> findAll() {
        return  eventRepository.findAll();
    }
}