<%@page import="com.pst.smms.dto.StudentDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Student Home</title>
</head>
<body>

	<%
	
		List<StudentDto> list = (List<StudentDto>)request.getAttribute("studentList");	
	
	%>



	<!-- including header template  -->
	<%@ include file="header.html"%>

	<!-- Navigation Bar template -->
	<%@ include file="admin-navigation-menu.html"%>


	<div class="container text-center">

		

		<h4 style="color: darkred;">Admin Student Home</h4>
		
		<div class="text-end mb-4">
			<a class="btn btn-warning" href="./new-student.jsp"> Add New Student </a>		
		</div>

		<div class="tableContainer mb-4">

			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">ROLL NUMBER</th>
						<th scope="col">FULL NAME</th>
						<th scope="col">GENDER</th>
						<th scope="col">DATE OF BIRTH</th>
						<th scope="col">MOBILE</th>
						<th scope="col">EMAIL </th>
						<th scope="col">ACTIONS</th>
					</tr>
				</thead>
				<tbody>

					<%
						for(StudentDto dto : list) { 								
					%>
					<tr>
						<th scope="row"><%=dto.getRollNumber() %></th>
						<td><%=dto.getFullName() %></td>
						<td><%=dto.getGender() %></td>
						<td><%=dto.getDateOfBirth() %></td>
						<td><%=dto.getMobileNumber() %></td>
						<td><%=dto.getEmail() %></td>
						<td>
							<div>
								<i class="bi bi-file-earmark-medical"></i> <i
									class="bi bi-pencil-square"></i> <i class="bi bi-trash3"></i>
							</div>
						</td>
					</tr>
					<%} %>					
				</tbody>
			</table>

		</div>





		<!-- including footer template -->
		<%@ include file="footer.html"%>

</body>
</html>