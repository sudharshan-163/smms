package com.pst.smms.service;

import java.sql.SQLException;
import java.util.List;

import com.pst.smms.bo.MarksBo;
import com.pst.smms.dao.MarksDao;
import com.pst.smms.dto.MarksDto;
import com.pst.smms.vo.MarksVo;

public class MarksService {

	private MarksDao dao;

	public int addStudentMarks(MarksVo vo) throws ClassNotFoundException, SQLException {
		MarksBo bo;
		int total;
		double percentage;
		String grade;
		String result;
		int i;
		// creating BO object

		bo = new MarksBo();
		bo.setExamType(vo.getExamType());
		bo.setYear(vo.getYear());
		bo.setSub1(vo.getSub1());
		bo.setSub2(vo.getSub2());
		bo.setSub3(vo.getSub3());
		bo.setSub4(vo.getSub4());
		bo.setSub5(vo.getSub5());
		bo.setSub6(vo.getSub6());
		

		total = calculateTotalMarks(vo);
		percentage = calculatePercentage(total);
		grade = calculateGrade(percentage);
		result = calculateResult(vo);

		bo.setTotalMarks(total);
		bo.setPercentage(percentage);
		bo.setGrade(grade);
		bo.setResult(result);
		bo.setRollNumber(vo.getRollNumber());

		dao = new MarksDao();
		i = dao.addMarksData(bo);
		return i;

	}
	
	public int updateStudent(int id, MarksVo vo ) throws ClassNotFoundException, SQLException {
		dao = new MarksDao();
		MarksBo bo = null;
		int total;
		double percentage;
		String grade;
		String result;
		int i;
		
		// creating BO object
		
		bo = new MarksBo();
		bo.setExamType(vo.getExamType());
		bo.setYear(vo.getYear());
		bo.setSub1(vo.getSub1());
		bo.setSub2(vo.getSub2());
		bo.setSub3(vo.getSub3());
		bo.setSub4(vo.getSub4());
		bo.setSub5(vo.getSub5());
		bo.setSub6(vo.getSub6());
		
		total = calculateTotalMarks(vo);
		percentage = calculatePercentage(total);
		grade = calculateGrade(percentage);
		result = calculateResult(vo);

		bo.setTotalMarks(total);
		bo.setPercentage(percentage);
		bo.setGrade(grade);
		bo.setResult(result);
		bo.setRollNumber(vo.getRollNumber());
		
		
		return dao.updateMarksData(id, bo);
	}

	public List<MarksDto> getAllMarks() throws ClassNotFoundException, SQLException {
		dao = new MarksDao();
		List<MarksDto> marksList = dao.getAllStudentMarks();
		return marksList;
	}
	
	public MarksDto getStudentMarks(int rollNumber,String examType) throws ClassNotFoundException, SQLException {
		dao = new MarksDao();
		return dao.getMarksByRollNumberAndExamType(rollNumber, examType);
	}
	
	public int deleteStudentMarks(int rollNumber, String examType) throws ClassNotFoundException, SQLException {
		dao = new MarksDao();
		return dao.deleteMarksByRollNumberAndExamType(rollNumber, examType);
	}
	
	
	// Method to calculate Result
	private String calculateResult(MarksVo vo) {
		String result = "Fail";

		if (vo.getSub1() >= 35 && vo.getSub2() >= 35 && vo.getSub3() >= 35 && vo.getSub4() >= 35 && vo.getSub5() >= 35
				&& vo.getSub6() >= 35) {
			result = "Pass";
		}
		return result;
	}

	// method to calculate totalmarks
	private int calculateTotalMarks(MarksVo vo) {
		int total = vo.getSub1() + vo.getSub2() + vo.getSub3() + vo.getSub5() + vo.getSub6();
		return total;
	}

	// method to calculate percentage
	private double calculatePercentage(int totalMarks) {
		double percentage = ((double) totalMarks / 600) * 100;
		return percentage;
	}

	// method to calculate grade
	private String calculateGrade(double percentage) {

		String grade = "";
		if (percentage >= 75) {
			grade = "A - Grade";
		} else if (percentage >= 65 && percentage < 75) {
			grade = "B - Grade";
		} else if (percentage >= 35 && percentage < 65) {
			grade = "C - Grade";
		} else {
			grade = "Fail";
		}
		return grade;
	}

}
