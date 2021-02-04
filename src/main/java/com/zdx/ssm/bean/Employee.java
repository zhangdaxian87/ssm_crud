package com.zdx.ssm.bean;

import javax.validation.constraints.Pattern;

public class Employee {
	private Integer id;

	@Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})", message = "用户名必需由2-5位中文或者6-16位英文和数字的组合")
	private String lastName;

	@Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$", message = "Email不合法")
	private String email;

	private String gender;

	private Integer departmentId;

	private Department department;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName == null ? null : lastName.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender == null ? null : gender.trim();
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", lastName=" + lastName + ", email=" + email + ", gender=" + gender + ", departmentId="
				+ departmentId + ", getId()=" + getId() + ", getLastName()=" + getLastName() + ", getEmail()=" + getEmail()
				+ ", getGender()=" + getGender() + ", getDepartmentId()=" + getDepartmentId() + ", getDepartment()="
				+ getDepartment() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}

	public Employee() {
		super();
	}

	public Employee(Integer id, String lastName, String email, String gender, Integer departmentId) {
		super();
		this.id = id;
		this.lastName = lastName;
		this.email = email;
		this.gender = gender;
		this.departmentId = departmentId;
	}

}