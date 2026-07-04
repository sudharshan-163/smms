package com.pst.smms.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.pst.smms.dto.StudentDto;
import com.pst.smms.service.StudentService;
import com.pst.smms.vo.StudentVo;

/**
 * Servlet implementation class AdminStudentHomeController
 */
public class AdminStudentHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentService studentService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		studentService = new StudentService();
		List<StudentDto> studentList = studentService.retriveAllStudents();
		request.setAttribute("studentList", studentList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./admin-student-home.jsp");
		dispatcher.forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudentVo vo = null;
		String message = "";
		String colorClass = "";
		int i = 0;
		
		RequestDispatcher dispatcher;
		
		int rollNumber = Integer.parseInt(req.getParameter("rollNumber"));
		String fullName = req.getParameter("fullName");
		String gender = req.getParameter("gender");
		String dob = req.getParameter("dob");
		String mobile = req.getParameter("mobile");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		vo = new StudentVo(rollNumber, fullName, gender, dob, mobile, email, password);
		
		studentService = new StudentService();
		
		
		try {
			i = studentService.saveStudent(vo);
		} catch (ClassNotFoundException e) {		
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(i > 0) {
			message = "Student Added successfully";
			colorClass = "successMessage";
			
			
		} else {
			message = "Student Failed to add";
			colorClass = "errorMessage";			
		}
		req.setAttribute("message",message);
		req.setAttribute("colorClass", colorClass);
		dispatcher = req.getRequestDispatcher("./new-student.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
