package com.todolist.repository;

import com.todolist.model.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface MenuRepository extends JpaRepository<Menu, Long> {

//    @Query("select menu.nameMenu from Menu menu")
//    List<String> findAllNameMenu();

}
