package com.todolist.repository;

import com.todolist.model.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface EventJpaRepository extends JpaRepository<Event, Long> {
    /* This one uses a JPQL */
    public List<Event> findByStartGreaterThanEqualAndFinishLessThanEqual(LocalDateTime start, LocalDateTime end);


    /* This one uses an @Query */
    @Query("select b from Event b where b.start >= :start and b.finish <= :end")
    public List<Event> findByDateBetween(@Param("start")LocalDateTime start,@Param("end") LocalDateTime end);

}
