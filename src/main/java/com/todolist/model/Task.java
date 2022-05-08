package com.todolist.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.todolist.utils.ConstantUtils;
import com.todolist.validator.Validate;
import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.util.ClassUtils;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "task")
public class Task {

    @NotNull
    @Column(name = "title")
    private String title;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "id_task")
    private Long taskId;

    @Column(name = "is_executed")
    private Integer taskExecuted;

    @Column(name = "start")
    @JsonFormat(pattern="yyyy-MM-dd")
    private String start;

    @Column( name = "end")
    @JsonFormat(pattern="yyyy-MM-dd")
    private String end;

    @Column(name = "description")
    private String description;

    @NotNull
    @Column(name = "task_type")
    private String taskType;

    @NotNull
    @Column(name = "user_id")
    private Long userId;

    @Column(name = "owner")
    private String owner;



    @OneToMany(targetEntity = User.class, mappedBy = "task", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<User> user;

    @Override
    public String toString() {
        return String.format("Entity of type %s with id: %s", this.getClass().getName(), this.getTaskId());
    }
    @Override
    public boolean equals(Object obj) {
        if (null == obj) {
            return false;
        } else if (this == obj) {
            return true;
        } else if (!this.getClass().equals(ClassUtils.getUserClass(obj))) {
            return false;
        } else {
            AbstractPersistable<?> that = (AbstractPersistable)obj;
            return null == this.getTaskId() ? false : this.getTaskId().equals(that.getId());
        }
    }

    @Override
    public int hashCode() {
        int hashCode = 17;
        hashCode = hashCode + (null == this.getTaskId() ? 0 : this.getTaskId().hashCode() * 31);
        return hashCode;
    }
    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    public String getTitle() {
        return title;
    }


    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    public Integer getTaskExecuted() {
        return taskExecuted;
    }

    public void setTaskExecuted(Integer taskExecuted) {
        this.taskExecuted = taskExecuted;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}