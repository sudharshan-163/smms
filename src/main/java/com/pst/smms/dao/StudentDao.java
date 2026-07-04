package com.pst.smms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pst.smms.bo.StudentBo;
import com.pst.smms.dto.StudentDto;

public class StudentDao {

	private static final String SELECT_ALL_STUDENTS = "select*from student";
	private static final String ADD_NEW_STUDENT ="insert into student values(?,?,?,?,?,?,?)";
	
	
		
		
	public List<StudentDto> getAllStudents() {
		List<StudentDto>  studentList = new ArrayList<StudentDto>();
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smms", "root", "mysql");
			PreparedStatement ps = con.prepareStatement(SELECT_ALL_STUDENTS);
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()) {
				StudentDto dto = new StudentDto(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getDate(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)						
						);
				studentList.add(dto);
			}
			
		} catch(Exception e) {e.printStackTrace();}
		return studentList;
	}
	
	public int createNewStudent(StudentBo bo) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smms", "root", "mysql");
		PreparedStatement ps = con.prepareStatement(ADD_NEW_STUDENT);
		ps.setInt(1,bo.getRollNumber());
		ps.setString(2,bo.getFullName());
		ps.setString(3,bo.getGender());
		ps.setDate(4,bo.getDob());
		ps.setString(5,bo.getMobile());
		ps.setString(6,bo.getEmail());
		ps.setString(7,bo.getPassword());
		int i = ps.executeUpdate();
		return i;
	}
	
}
