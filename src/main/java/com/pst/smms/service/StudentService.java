package com.pst.smms.service;

import java.util.List;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.pst.smms.bo.StudentBo;
import com.pst.smms.dao.StudentDao;
import com.pst.smms.dto.StudentDto;
import com.pst.smms.vo.StudentVo;



public class StudentService {
	
	private StudentDao dao;
	
	public List<StudentDto> retriveAllStudents(){
		dao = new StudentDao();
		return dao.getAllStudents();
	}
	
	public int saveStudent(StudentVo vo) throws ClassNotFoundException, SQLException {				
		StudentBo bo = null;
		Date dob = convertToSqlDate(vo.getDob());
		bo = new StudentBo(
				vo.getRollNumber(),
				vo.getFullName(),
				vo.getGender(),
				dob,
				vo.getMobile(),
				vo.getEmail(),
				vo.getPassword()				
				);
		dao = new StudentDao();
		int i = dao.createNewStudent(bo);
		return i;
		
	}
	
	private Date convertToSqlDate(String date) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-DD");
		Date sqlDate = null;
		try {
			java.util.Date utilDate = dateFormat.parse(date);
			sqlDate = new Date(utilDate.getTime());
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return sqlDate;
		
	}
	
	
}
