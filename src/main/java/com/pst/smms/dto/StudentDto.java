package com.pst.smms.dto;

import java.util.Date;

public class StudentDto {

	private int rollNumber;
	private String fullName;
	private String gender;
	private Date dateOfBirth;
	private String mobileNumber;
	private String email;
	private String password;
	
	
	public StudentDto() {
		
	}
	
	
	public StudentDto(int rollNumber, String fullName, String gender, Date dateOfBirth, String mobileNumber,
			String email, String password) {
		
		this.rollNumber = rollNumber;
		this.fullName = fullName;
		this.gender = gender;
		this.dateOfBirth = dateOfBirth;
		this.mobileNumber = mobileNumber;
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
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
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
	@Override
	public String toString() {
		return "StudentDto [rollNumber=" + rollNumber + ", fullName=" + fullName + ", gender=" + gender
				+ ", dateOfBirth=" + dateOfBirth + ", mobileNumber=" + mobileNumber + ", email=" + email + ", password="
				+ password + "]";
	}
	
	
	
}
