<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="styles/smms_styles.css">
<title>Add Marks</title>



</head>
<body>

	<%
		
		String msg =  request.getAttribute("message") == null ? "" :(String)request.getAttribute("message");
		String msgClass = request.getAttribute("messageClass") == null ? "" : (String)request.getAttribute("messageClass");
		
	%>

	<!-- including header template  -->
	<%@ include file="header.html"%>

	<!-- Navigation Bar template -->
	<%@ include file="admin-navigation-menu.html"%>
	
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container my-5 mb-4">

  <h3 class="pageTitle text-center mb-4">Add Student Marks</h3>
  <h4 class="text-center <%=msgClass%>"><%=msg %></h4>

  <form action="./MarksController" method="post" class="border p-4 shadow rounded bg-light">

    <!-- Roll Number Check -->
    <div class="mb-4 row align-items-end">
      <div class="col-md-6">
        <label class="form-label">Enter Roll Number:</label>
        <input type="text" name="rollNumber" class="form-control">
      </div>
      <div class="col-md-4">
        <button type="button" class="btn btn-primary">Check Student</button>
      </div>
    </div>

    <!-- Student Details -->
    <div class="mb-4 row">
      <div class="col-md-6">
        <label class="form-label">Student Name</label>
        <input type="text" name="studentName" class="form-control" disabled value="Testing">
      </div>
      <div class="col-md-6">
        <label class="form-label">Student Course</label>
        <input type="text" name="course" class="form-control" disabled value="CSC">
      </div>
    </div>

    <!-- Exam Info -->
    <h3 class="pageTitle mb-3">Student Marks</h3>

    <div class="mb-4 row">
      <div class="col-md-6">
        <label class="form-label">Enter Exam Type</label>
        <select name="examType" class="form-select">
          <option value="">--select--</option>
          <option value="semister1">SEMESTER-1</option>
          <option value="semister2">SEMESTER-2</option>
          <option value="semister3">SEMESTER-3</option>
          <option value="semister4">SEMESTER-4</option>
        </select>
      </div>
      <div class="col-md-6">
        <label class="form-label">Enter Year</label>
        <input type="number" name="year" class="form-control">
      </div>
    </div>

    <!-- Subject Marks -->
    <div class="mb-4 row">
      <div class="col-md-6">
        <label class="form-label">Enter Subject 1 Marks</label>
        <input type="text" name="sub1" class="form-control">
      </div>
      <div class="col-md-6">
        <label class="form-label">Enter Subject 2 Marks</label>
        <input type="text" name="sub2" class="form-control">
      </div>
    </div>

    <div class="mb-4 row">
      <div class="col-md-6">
        <label class="form-label">Enter Subject 3 Marks</label>
        <input type="text" name="sub3" class="form-control">
      </div>
      <div class="col-md-6">
        <label class="form-label">Enter Subject 4 Marks</label>
        <input type="text" name="sub4" class="form-control">
      </div>
    </div>

    <div class="mb-4 row">
      <div class="col-md-6">
        <label class="form-label">Enter Subject 5 Marks</label>
        <input type="text" name="sub5" class="form-control">
      </div>
      <div class="col-md-6">
        <label class="form-label">Enter Subject 6 Marks</label>
        <input type="text" name="sub6" class="form-control">
      </div>
    </div>

    <!-- Submit Buttons -->
    <div class="text-center mt-4">
      <button type="submit" class="btn btn-success me-2">Add Marks</button>
      <button type="reset" class="btn btn-secondary">Clear</button>
    </div>

  </form>
</div>

	<!-- including footer template -->
		<%@ include file="footer.html"%>

</body>
</html>