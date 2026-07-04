<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Add New Student</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style>
    body {
      background: linear-gradient(to right, #74ebd5, #acb6e5);
      color: #1a237e;
    }

    .split-wrapper {
      display: flex;
      flex-wrap: wrap;
      background: #ffffff;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
      margin: 60px auto;
      max-width: 1000px;
    }

    .split-left {
      background: #3f51b5;
      color: #ffffff;
      padding: 40px 30px;
      flex: 1 1 300px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      text-align: center;
    }

    .split-left h2 {
      font-weight: 700;
      font-size: 2rem;
    }

    .split-left p {
      margin-top: 15px;
      font-size: 1rem;
    }

    .split-right {
      flex: 1 1 600px;
      padding: 40px;
      background: #ffffff;
    }

    .form-label i {
      color: #3f51b5;
      margin-right: 6px;
    }

    .form-control {
      border: 1px solid #c5cae9;
    }

    .form-control:focus {
      border-color: #3f51b5;
      box-shadow: 0 0 0 0.1rem rgba(63,81,181,0.25);
    }

    .btn-primary {
      background-color: #3949ab;
      border: none;
    }

    .btn-primary:hover {
      background-color: #303f9f;
    }

    .alert {
      margin-bottom: 25px;
    }

    @media (max-width: 768px) {
      .split-left {
        text-align: center;
        padding: 30px 20px;
      }
    }
  </style>
</head>
<body>
  <%@ include file="header.html" %>
  <%@ include file="admin-navigation-menu.html" %>

  <%
    String message = request.getAttribute("message") == null ? "" : (String) request.getAttribute("message");
    String colorClass = "";

    if (!message.isEmpty()) {
      if (message.toLowerCase().contains("success")) {
        colorClass = "alert alert-success";
      } else if (message.toLowerCase().contains("fail") || message.toLowerCase().contains("error")) {
        colorClass = "alert alert-danger";
      } else {
        colorClass = "alert alert-info";
      }
    }
  %>

  <div class="container">
    <div class="split-wrapper">
      <div class="split-left">
        <h2><i class="bi bi-person-plus-fill"></i> Student Portal</h2>
        <p>Fill the form to add a new student. Please double-check all details before submitting.</p>
      </div>
      <div class="split-right">
        <% if (!message.isEmpty()) { %>
          <div class="<%=colorClass%>" role="alert"><%=message%></div>
        <% } %>

        <form action="./AdminStudentHomeController" method="post" novalidate>
          <div class="mb-3">
            <label for="rollNumber" class="form-label"><i class="bi bi-hash"></i> Roll Number</label>
            <input type="text" class="form-control" id="rollNumber" name="rollNumber" required>
          </div>
          <div class="mb-3">
            <label for="fullName" class="form-label"><i class="bi bi-person-fill"></i> Full Name</label>
            <input type="text" class="form-control" id="fullName" name="fullName" required>
          </div>
          <div class="mb-3">
            <label class="form-label"><i class="bi bi-gender-ambiguous"></i> Gender</label><br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="genderMale" value="male" required>
              <label class="form-check-label" for="genderMale">Male</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="female">
              <label class="form-check-label" for="genderFemale">Female</label>
            </div>
          </div>
          <div class="mb-3">
            <label for="dob" class="form-label"><i class="bi bi-calendar-event"></i> Date of Birth</label>
            <input type="date" class="form-control" id="dob" name="dob" required>
          </div>
          <div class="mb-3">
            <label for="mobile" class="form-label"><i class="bi bi-telephone-fill"></i> Mobile Number</label>
            <input type="tel" class="form-control" id="mobile" name="mobile" pattern="[0-9]{10}" required>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label"><i class="bi bi-envelope-fill"></i> Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label"><i class="bi bi-lock-fill"></i> Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>
          <div class="d-grid">
            <button type="submit" class="btn btn-primary btn-lg"><i class="bi bi-plus-circle-fill"></i> Add Student</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <%@ include file="footer.html" %>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
