package com.pst.smms.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.pst.smms.common.SMMSConstants;
import com.pst.smms.service.MarksService;
import com.pst.smms.vo.MarksVo;

/**
 * Servlet implementation class UpdateAndDeleteStudentMarksController
 */
public class UpdateAndDeleteStudentMarksController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			MarksService service = null;
			int i = 0;
			String message = "";
			String messageClass = "";
			int rollNumber = Integer.parseInt(req.getParameter("rollNumber"));
			String examType = req.getParameter("examType");
		
			service = new MarksService();
			try {
				i = service.deleteStudentMarks(rollNumber, examType);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(i > 0) {
				messageClass = "successMessage";
				message = SMMSConstants.DELETE_MARKS_SUCCESS_MESSAGE;
			} else {
				messageClass = "errorMessage";
				message = SMMSConstants.DELETE_MARKS_FAILURE_MESSAGE;
			}
			resp.sendRedirect("./ViewAllMarksController?msg="+message+"&messageClass="+messageClass);
		}
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MarksService service = null;
		int i = 0; 
		String message = "";
		String messageClass = "";
		
		int rollNumber = Integer.parseInt(request.getParameter("rollNumber"));
		int id = Integer.parseInt(request.getParameter("marksId"));

		String examType = request.getParameter("examType");
		
		int year = Integer.parseInt(request.getParameter("year"));

		// -- marks --
		int sub1 = Integer.parseInt(request.getParameter("sub1"));
		int sub2 = Integer.parseInt(request.getParameter("sub2"));
		int sub3 = Integer.parseInt(request.getParameter("sub3"));
		int sub4 = Integer.parseInt(request.getParameter("sub4"));
		int sub5 = Integer.parseInt(request.getParameter("sub5"));
		int sub6 = Integer.parseInt(request.getParameter("sub6"));
		
		// setting data to marksvo object

				MarksVo vo = new MarksVo();
				vo.setRollNumber(rollNumber);
				vo.setExamType(examType);
				vo.setYear(year);
				vo.setSub1(sub1);
				vo.setSub2(sub2);
				vo.setSub3(sub3);
				vo.setSub4(sub4);
				vo.setSub5(sub5);
				vo.setSub6(sub6);
		
				service = new MarksService();
				
				try {
					i = service.updateStudent(id,vo);
				} catch (ClassNotFoundException e) {
					System.out.println("Driver class not available in class path,Error: "+e.getMessage());
					e.printStackTrace();
				} catch (SQLException e) {
					System.out.println("Error occured in database,Error: "+e.getMessage());
					e.printStackTrace();
				} catch (Exception e) {
					System.out.println("Internal server Error.... Error Message: "+e.getMessage());
					e.printStackTrace();
				}
				if(i > 0) {
					messageClass = "successMessage";
					message = SMMSConstants.UPDATE_MARKS_SUCCESS_MESSAGE;
				} else {
					messageClass = "errorMessage";
					message = SMMSConstants.UPDATE_MARKS_FAILURE_MESSAGE;
				}
				
			//	request.setAttribute("message", message);
			//	request.setAttribute("messageClass",messageClass);
			
				
				//RequestDispatcher dispatcher = request.getRequestDispatcher("./ViewAllMarksController");
				//dispatcher.forward(request, response);
				response.sendRedirect("./ViewAllMarksController?msg="+message+"&messageClass="+messageClass);
	}

}
