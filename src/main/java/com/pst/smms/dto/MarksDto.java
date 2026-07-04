package com.pst.smms.dto;

import java.sql.Date;

public class MarksDto {
	
	private int id;
	private int rollNumber;
    private String fullName;
    private String gender;
    private String dob;
    private String email;
    private String examType;
    private int examYear;
    private int sub1;
    private int sub2;
    private int sub3;
    private int sub4;
    private int sub5;
    private int sub6;
    private int totalMarks;
    private double percentage;
    private String grade;
    private String result;
    
    public MarksDto() {}
    
    public MarksDto(int id,int rollNumber, String fullName, String examType, int examYear, int sub1, int sub2, int sub3,
			int sub4, int sub5, int sub6, int totalMarks, double percentage, String grade, String result) {
		
    	this.id = id;
		this.rollNumber = rollNumber;
		this.fullName = fullName;
		this.examType = examType;
		this.examYear = examYear;
		this.sub1 = sub1;
		this.sub2 = sub2;
		this.sub3 = sub3;
		this.sub4 = sub4;
		this.sub5 = sub5;
		this.sub6 = sub6;
		this.totalMarks = totalMarks;
		this.percentage = percentage;
		this.grade = grade;
		this.result = result;
	}
    
    
    

	public MarksDto(int id,int rollNumber, String fullName, String gender, String dob, String email, String examType,
			int examYear, int sub1, int sub2, int sub3, int sub4, int sub5, int sub6, int totalMarks, double percentage,
			String grade, String result) {
		
		this.id = id;
		this.rollNumber = rollNumber;
		this.fullName = fullName;
		this.gender = gender;
		this.dob = dob;
		this.email = email;
		this.examType = examType;
		this.examYear = examYear;
		this.sub1 = sub1;
		this.sub2 = sub2;
		this.sub3 = sub3;
		this.sub4 = sub4;
		this.sub5 = sub5;
		this.sub6 = sub6;
		this.totalMarks = totalMarks;
		this.percentage = percentage;
		this.grade = grade;
		this.result = result;
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
	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
	public int getExamYear() {
		return examYear;
	}
	public void setExamYear(int examYear) {
		this.examYear = examYear;
	}
	public int getSub1() {
		return sub1;
	}
	public void setSub1(int sub1) {
		this.sub1 = sub1;
	}
	public int getSub2() {
		return sub2;
	}
	public void setSub2(int sub2) {
		this.sub2 = sub2;
	}
	public int getSub3() {
		return sub3;
	}
	public void setSub3(int sub3) {
		this.sub3 = sub3;
	}
	public int getSub4() {
		return sub4;
	}
	public void setSub4(int sub4) {
		this.sub4 = sub4;
	}
	public int getSub5() {
		return sub5;
	}
	public void setSub5(int sub5) {
		this.sub5 = sub5;
	}
	public int getSub6() {
		return sub6;
	}
	public void setSub6(int sub6) {
		this.sub6 = sub6;
	}
	public int getTotalMarks() {
		return totalMarks;
	}
	public void setTotalMarks(int totalMarks) {
		this.totalMarks = totalMarks;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
			
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "MarksDto [rollNumber=" + rollNumber + ", fullName=" + fullName + ", examType=" + examType
				+ ", examYear=" + examYear + ", sub1=" + sub1 + ", sub2=" + sub2 + ", sub3=" + sub3 + ", sub4=" + sub4
				+ ", sub5=" + sub5 + ", sub6=" + sub6 + ", totalMarks=" + totalMarks + ", percentage=" + percentage
				+ ", grade=" + grade + ", result=" + result + "]";
	}
	
	
}
