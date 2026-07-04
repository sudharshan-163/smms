<%@ page import="com.pst.smms.dto.MarksDto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Admin Student Home</title>
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

	<!-- including header template  -->
	<%@ include file="header.html"%>

	<!-- Navigation Bar template -->
	<%@ include file="admin-navigation-menu.html"%>

<%
  List<MarksDto> marksList = (List<MarksDto>) request.getAttribute("marksList");
  String msg = (String) request.getAttribute("msg");
  String msgClass = (String) request.getAttribute("msgClass");
%>

<!-- Toast Message -->
<% if (msg != null && !msg.trim().isEmpty()) { %>
<div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 1055;">
  <div id="liveToast" class="toast show" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header bg-primary text-white">
      <strong class="me-auto">Notification</strong>
      <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body <%= msgClass %>">
      <%= msg %>
    </div>
  </div>
</div>
<% } %>

<!-- Page Content -->
<div class="container mt-4">
  <h4 class="text-center text-danger mb-4">Student Marks</h4>

  <div class="text-end mb-3">
    <a class="btn btn-warning" href="./add-marks.jsp">Add Marks</a>
  </div>

  <div class="table-responsive">
    <table class="table table-striped table-bordered align-middle">
      <thead class="table-dark">
        <tr>
          <th>ROLL NUMBER</th>
          <th>NAME</th>
          <th>TYPE</th>
          <th>YEAR</th>
          <th>TOTAL</th>
          <th>RESULT</th>
          <th>ACTIONS</th>
        </tr>
      </thead>
      <tbody>
        <% if (marksList != null && !marksList.isEmpty()) {
            for (MarksDto dto : marksList) { %>
              <tr>
                <td><%= dto.getRollNumber() %></td>
                <td><%= dto.getFullName() %></td>
                <td><%= dto.getExamType() %></td>
                <td><%= dto.getExamYear() %></td>
                <td><%= dto.getTotalMarks() %></td>
                <td><%= dto.getResult() %></td>
                <td>
                  <a href="./MarksController?rollNumber=<%=dto.getRollNumber()%>&examType=<%=dto.getExamType()%>&action=view" class="text-info me-2"><i class="bi bi-file-earmark-medical"></i></a>
                  <a href="./MarksController?rollNumber=<%=dto.getRollNumber()%>&examType=<%=dto.getExamType()%>&action=update" class="text-success me-2"><i class="bi bi-pencil-square"></i></a>
                  <a href="./UpdateAndDeleteStudentMarksController?rollNumber=<%=dto.getRollNumber()%>&examType=<%=dto.getExamType()%>" class="text-danger"><i class="bi bi-trash3"></i></a>
                </td>
              </tr>
        <%   } 
           } else { %>
              <tr>
                <td colspan="7" class="text-center text-muted">No student marks available to display.</td>
              </tr>
        <% } %>
      </tbody>
    </table>
  </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

<!-- Auto-show Toast -->
<script>
  window.addEventListener('load', () => {
    const toastEl = document.getElementById('liveToast');
    if (toastEl) {
      const toast = new bootstrap.Toast(toastEl);
      toast.show();
    }
  });
</script>
<!-- including footer template -->
		<%@ include file="footer.html"%>

</body>
</html>
