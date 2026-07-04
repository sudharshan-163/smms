package com.pst.smms.bo;

import java.sql.Date;

public class StudentBo {

	private int rollNumber;
	private String fullName;
	private String gender;
	private Date dob;
	private String mobile;
	private String email;
	private String password;
	
	public StudentBo() {}
	
	public StudentBo(int rollNumber, String fullName, String gender, Date dob, String mobile, String email,
			String password) {
		super();
		this.rollNumber = rollNumber;
		this.fullName = fullName;
		this.gender = gender;
		this.dob = dob;
		this.mobile = mobile;
		this.email = email;
		this.password = password;
	}
	public int getRollNumber() {
		return rollNumber;
	}
	public void setRollNumber(int rollNumber) {
		this.rollNumber = rollNumber;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
