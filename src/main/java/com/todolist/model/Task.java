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
    @Column(name = "user_name")
    private String userName;

    @NotNull
    @Column(name = "is_executed")
    private Boolean isExecuted;

    @NotNull
    @Column(name = "dedline")
    private Date email;

    @NotNull
    @Column(name = "description")
    private String description;

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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Boolean getExecuted() {
        return isExecuted;
    }

    public void setExecuted(Boolean executed) {
        isExecuted = executed;
    }

    public Date getEmail() {
        return email;
    }

    public void setEmail(Date email) {
        this.email = email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}