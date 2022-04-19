package com.todolist.model;

import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.util.ClassUtils;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "menu")
public class Menu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_menu")
    private Long menuId;

    @Column(name = "menu_name")
    private String nameMenu;

    @Column(name = "path")
    private String path;

    @Override
    public String toString() {
        return String.format("Entity of type %s with id: %s", this.getClass().getName(), this.getMenuId());
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
            return null == this.getMenuId() ? false : this.getMenuId().equals(that.getId());
        }
    }
    @Override
    public int hashCode() {
        int hashCode = 17;
        hashCode = hashCode + (null == this.getMenuId() ? 0 : this.getMenuId().hashCode() * 31);
        return hashCode;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }

    public String getNameMenu() {
        return nameMenu;
    }

    public void setNameMenu(String nameMenu) {
        this.nameMenu = nameMenu;
    }
}