package com.pst.smms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pst.smms.bo.MarksBo;
import com.pst.smms.dto.MarksDto;

public class MarksDao {

	private static final String ADD_MARKS_QUERRY = "insert into student_marks(exam_type, exam_year, sub1, sub2, sub3, sub4, sub5, sub6, total_marks, percentage, grade, result, roll_number) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STUDENT_MARKS = "select sm.id, st.roll_number, st.full_name, sm.exam_type, sm.exam_year, sm.sub1, sm.sub2, sm.sub3, sm.sub4, sm.sub5, sm.sub6,sm.total_marks,sm.percentage,sm.grade,sm.result from student st INNER JOIN student_marks sm ON st.roll_number = sm.roll_number;";
	private static final String GET_MARKS_BY_ROLLNUMBER_AND_TYPE = " select sm.id, st.roll_number, st.full_name, st.gender, st.dob, st.email, sm.exam_type, sm.exam_year, sm.sub1, sm.sub2, sm.sub3, sm.sub4,sm.sub5,sm.sub6,sm.total_marks, sm.percentage,sm.grade,sm.result from student st INNER JOIN student_marks sm ON st.roll_number = sm.roll_number where st.roll_number = ? and sm.exam_type= ?;";
	private static final String UPDATE_STUDENT_MARKS = "update student_marks set exam_type = ?, exam_year = ?, sub1 = ?, sub2 = ?, sub3 = ?, sub4 = ?, sub5 = ?, sub6 = ?, total_marks = ?, percentage = ?, grade = ?, result = ? where id = ?";
	private static final String DELETE_MARKS = "delete from student_marks where roll_number = ? and exam_type = ?";
	
	
	public int updateMarksData(int id,MarksBo bo) throws ClassNotFoundException,SQLException{

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smms", "root", "mysql");
		PreparedStatement ps = con.prepareStatement(UPDATE_STUDENT_MARKS);
		ps.setString(1, bo.getExamType());
		ps.setInt(2, bo.getYear());
		ps.setInt(3, bo.getSub1());
		ps.setInt(4, bo.getSub2());
		ps.setInt(5, bo.getSub3());
		ps.setInt(6, bo.getSub4());
		ps.setInt(7, bo.getSub5());
		ps.setInt(8, bo.getSub6());
		ps.setInt(9, bo.getTotalMarks());
		ps.setDouble(10, bo.getPercentage());
		ps.setString(11, bo.getGrade());
		ps.setString(12, bo.getResult());
		ps.setInt(13, id);

		int i = ps.executeUpdate();
		return i;
		
	}
	public int addMarksData(MarksBo bo) throws ClassNotFoundException,SQLException{

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smms", "root", "mysql");
		PreparedStatement ps = con.prepareStatement(ADD_MARKS_QUERRY);
		ps.setString(1, bo.getExamType());
		ps.setInt(2, bo.getYear());
		ps.setInt(3, bo.getSub1());
		ps.setInt(4, bo.getSub2());
		ps.setInt(5, bo.getSub3());
		ps.setInt(6, bo.getSub4());
		ps.setInt(7, bo.getSub5());
		ps.setInt(8, bo.getSub6());
		ps.setInt(9, bo.getTotalMarks());
		ps.setDouble(10, bo.getPercentage());
		ps.setString(11, bo.getGrade());
		ps.setString(12, bo.getResult());
		ps.setInt(13, bo.getRollNumber());

		int i = ps.executeUpdate();
		return i;
		
	}
	public List<MarksDto> getAllStudentMarks() throws ClassNotFoundException,SQLException {
		
		List<MarksDto> marksList = new ArrayList<MarksDto>();
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smms", "root", "mysql");
		PreparedStatement ps = con.prepareStatement(GET_ALL_STUDENT_MARKS);
		ResultSet rs = ps.executeQuery();				
		while(rs.next()) {
			MarksDto dto = new MarksDto();	
			dto.setRollNumber(rs.getInt(1));
			dto.setRollNumber(rs.getInt(2));
			dto.setFullName(rs.getString(3));
			dto.setExamType(rs.getString(4));
			dto.setExamYear(rs.getInt(5));
			dto.setSub1(rs.getInt(6));
			dto.setSub2(rs.getInt(7));
			dto.setSub3(rs.getInt(8));
			dto.setSub4(rs.getInt(9));
			dto.setSub5(rs.getInt(10));
			dto.setSub6(rs.getInt(11));
			dto.setTotalMarks(rs.getInt(12));
			dto.setPercentage(rs.getDouble(13));
			dto.setGrade(rs.getString(14));
			dto.setResult(rs.getString(15));	
			marksList.add(dto);
			
		}
		
		return marksList;
	}
	
	public MarksDto getMarksByRollNumberAndExamType(int rollNumber, String examType) throws ClassNotFoundException,SQLException {
		
		MarksDto dto = null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smms", "root", "mysql");
		PreparedStatement ps = con.prepareStatement(GET_MARKS_BY_ROLLNUMBER_AND_TYPE);
		ps.setInt(1, rollNumber);
		ps.setString(2,examType);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			dto = new MarksDto(
					rs.getInt(1),
					rs.getInt(2),
					rs.getString(3),
					rs.getString(4),
					rs.getDate(5).toString(),
					rs.getString(6),
					rs.getString(7),
					rs.getInt(8),
					rs.getInt(9),
					rs.getInt(10),
					rs.getInt(11),
					rs.getInt(12),
					rs.getInt(13),
					rs.getInt(14),
					rs.getInt(15),
					rs.getDouble(16),
					rs.getString(17),
					rs.getString(18)
					);
			
		}
		return dto;
	}
	
	public int deleteMarksByRollNumberAndExamType(int rollNumber, String examType) throws ClassNotFoundException,SQLException{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smms", "root", "mysql");
		PreparedStatement ps = con.prepareStatement(DELETE_MARKS);
		ps.setInt(1, rollNumber);
		ps.setString(2, examType);
		int i = ps.executeUpdate();
		return i;
	}
	
}
