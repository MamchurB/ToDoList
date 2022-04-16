package com.todolist.model;

import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import org.springframework.data.jpa.domain.AbstractPersistable;

import com.todolist.utils.ConstantUtils;
import com.todolist.validator.Validate;
import org.springframework.util.ClassUtils;

@Entity
@Table(name = "user")
public class User {
	@NotNull
	@Validate(min=5, max=30, regexp=ConstantUtils.CHAR_PATTERN, message="Please enter between {min}-{max} characters and no digits")
	@Column(name = "full_name")
	private String fullName;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private Long userId;

	@NotNull
	@Column(name = "user_name")
	private String userName;

	@NotNull
	@Column(name = "password")
	private String password;

	@Transient
	private String passwordConfirm;

	@NotNull
	@Validate(min=10, max=100, regexp=ConstantUtils.EMAIL_PATTERN, message="Please enter between {min}-{max} characters and valid input")
	@Column(name = "email")
	private String email;

	@NotNull
	@Validate(min=10, max=10, regexp=ConstantUtils.MOBILE_PATTERN, message="Please enter atleast {min} digits and no characters")
	@Column(name = "mobile")
	private String mobile;
	private transient Long roleId;

	@ManyToOne
	@JoinColumn(name = "role_id")
	private Role role;




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
		return userId;
	}

	public void setId(Long id) {
		this.userId = id;
	}
	
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	
}
