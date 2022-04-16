package com.todolist.model;

import java.util.Set;

import javax.persistence.*;

import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.util.ClassUtils;

@Entity
@Table(name = "roles")
public class Role {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "role_id")
	private Long roleId;

	@Column(name = "name")
	private String name;

	@OneToMany(targetEntity = User.class, mappedBy = "role", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<User> users;

	@Override
	public String toString() {
		return String.format("Entity of type %s with id: %s", this.getClass().getName(), this.getId());
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
			return null == this.getId() ? false : this.getId().equals(that.getId());
		}
	}
	@Override
	public int hashCode() {
		int hashCode = 17;
		hashCode = hashCode + (null == this.getId() ? 0 : this.getId().hashCode() * 31);
		return hashCode;
	}
	public Long getId() {
		return roleId;
	}

	public void setId(Long id) {
		this.roleId = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
