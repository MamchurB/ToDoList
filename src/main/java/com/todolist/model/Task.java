package com.todolist.model;

import com.todolist.utils.ConstantUtils;
import com.todolist.validator.Validate;
import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.util.ClassUtils;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "task")
public class Task {

    @NotNull
    @Column(name = "name_task")
    private String taskName;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_task")
    private Long taskId;


    @NotNull
    @Column(name = "is_executed")
    private Integer taskExecuted;

    @NotNull
    @Column(name = "dedline")
    private Date dedline;

    @NotNull
    @Column(name = "description")
    private String description;

    @NotNull
    @Column(name = "task_type")
    private String taskType;

    @NotNull
    @Column(name = "user_id")
    private Long userId;


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

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
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

    public Date getDedline() {
        return dedline;
    }

    public void setDedline(Date dedline) {
        this.dedline = dedline;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}