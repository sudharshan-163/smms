<%@page import="com.pst.smms.dto.MarksDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view all marks</title>
<link rel="stylesheet" href="styles/smms_styles.css">

<style>

	.tableContainer{
		background-color: beige;
		box-shadow: 1px 1px 1px 1px;
	}
	.marksTable{
		width:100%;
		border-collapse: collapse;
	}
	th{
		background-color:black;
		color:white;
		font-weight: bolder; 
	}
	
	
</style>

</head>
<body>
	
	
	<%
	
	List<MarksDto> list =(List<MarksDto>)request.getAttribute("marksList");
		
	%>

	<div class="container"> 
	
		<div class="tableContainer">
		
			<table class="marksTable" border="1px solid black">
			
				<tr>
				
					<th>ROLL NUMBER</th>	
					<th>FULL NAME</th>
					<th>TYPE</th>
					<th>YEAR</th>
					<th>SUB1</th>
					<th>SUB2</th>
					<th>SUB3</th>
					<th>SUB4</th>
					<th>SUB5</th>
					<th>SUB6</th>
					<th>TOTAL</th>
					<th>PER</th>
					<th>GRADE</th>
					<th>RESULT</th>	
				</tr>
				<tr>
				<%
					for(MarksDto dto : list){
				%>
				
					<td><%=dto.getRollNumber() %></td>
					<td><%=dto.getFullName() %></td>
					<td><%=dto.getExamType() %></td>
					<td><%=dto.getExamYear() %></td>
					<td><%=dto.getSub1() %></td>
					<td><%=dto.getSub2() %></td>
					<td><%=dto.getSub3() %></td>
					<td><%=dto.getSub4() %></td>
					<td><%=dto.getSub5() %></td>
					<td><%=dto.getSub6() %></td>
					<td><%=dto.getTotalMarks() %></td>
					<td><%=dto.getPercentage() %></td>
					<td><%=dto.getGrade() %></td>
					<td><%=dto.getResult() %></td>
				</tr>
				<% }%>
				
			
			</table>
				
		</div>
			
	</div>

</body>
</html>