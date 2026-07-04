<%@page import="com.pst.smms.dto.MarksDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Student Marks Sheet</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    :root {
      --bg-color: #f3f4f6;
      --text-color: #212529;
      --card-bg: #ffffff;
      --blur: 0px;
      --bg-animation: none;
      --shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
      --border: none;
    }

    body {
      background: var(--bg-color);
      color: var(--text-color);
      font-family: 'Segoe UI', sans-serif;
      animation: var(--bg-animation);
      background-size: cover;
    }

    .marksheet {
      background: var(--card-bg);
      border-radius: 15px;
      box-shadow: var(--shadow);
      padding: 30px;
      max-width: 900px;
      margin: 40px auto;
      backdrop-filter: blur(var(--blur));
      -webkit-backdrop-filter: blur(var(--blur));
      border: var(--border);
    }

    h2.title {
      text-align: center;
      font-weight: bold;
      margin-bottom: 30px;
    }

    .info-label {
      font-weight: 500;
    }

    .btn-download {
      display: block;
      margin: 20px auto;
      padding: 10px 30px;
    }

    .no-print {
      display: block;
    }

    .theme-selector {
      max-width: 250px;
      margin: 10px auto;
    }

    .theme-classic {
      --bg-color: #f3f4f6;
      --text-color: #212529;
      --card-bg: #ffffff;
      --blur: 0px;
      --shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
      --border: none;
    }

    @keyframes gradientWaves {
      0% {background-position: 0% 0%;}
      50% {background-position: 100% 100%;}
      100% {background-position: 0% 0%;}
    }

    .theme-waves {
      --bg-color: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
      --card-bg: rgba(255, 255, 255, 0.9);
      --text-color: #333;
      --blur: 6px;
      --bg-animation: gradientWaves 8s ease infinite;
    }
  </style>
</head>

<body class="theme-classic">
<%
    MarksDto dto = (MarksDto) request.getAttribute("marksDto");
    if (dto == null) {
%>
    <div class="alert alert-danger text-center m-5">
      No student data available to display.
    </div>
<%
    } else {
%>

<%@ include file="header.html" %>
<%@ include file="admin-navigation-menu.html" %>

<div class="theme-selector no-print text-center">
  <label for="themeSelect" class="form-label fw-bold">Select Theme:</label>
  <select class="form-select" id="themeSelect" onchange="changeTheme(this.value)">
    <option value="theme-classic">Classic</option>
    <option value="theme-waves">Gradient Waves</option>
  </select>
</div>

<div class="container marksheet" id="marksheetContent">
  <h2 class="title" style="color: darkblue;">Student Marks Sheet</h2>

  <div class="row mb-3">
    <div class="col-md-4"><span class="info-label">Full Name:</span> <%= dto.getFullName() %></div>
    <div class="col-md-4"><span class="info-label">Gender:</span> <%= dto.getGender() %></div>
    <div class="col-md-4"><span class="info-label">Date of Birth:</span> <%= dto.getDob() %></div>
  </div>
  <div class="row mb-3">
    <div class="col-md-4"><span class="info-label">Email:</span> <%= dto.getEmail() %></div>
    <div class="col-md-4"><span class="info-label">Exam Type:</span> <%= dto.getExamType() %></div>
    <div class="col-md-4"><span class="info-label">Exam Year:</span> <%= dto.getExamYear() %></div>
  </div>
  <div class="row mb-3">
    <div class="col-md-4"><span class="info-label">Roll Number:</span> <%= dto.getRollNumber() %></div>
  </div>

  <table class="table table-bordered text-center mt-4">
    <thead class="table-dark">
      <tr>
        <th>Subject</th>
        <th>Marks</th>
      </tr>
    </thead>
    <tbody>
      <tr><td>Subject 1</td><td><%= dto.getSub1() %></td></tr>
      <tr><td>Subject 2</td><td><%= dto.getSub2() %></td></tr>
      <tr><td>Subject 3</td><td><%= dto.getSub3() %></td></tr>
      <tr><td>Subject 4</td><td><%= dto.getSub4() %></td></tr>
      <tr><td>Subject 5</td><td><%= dto.getSub5() %></td></tr>
      <tr><td>Subject 6</td><td><%= dto.getSub6() %></td></tr>
    </tbody>
    <tfoot>
      <tr class="table-success"><td><strong>Total Marks</strong></td><td><%= dto.getTotalMarks() %></td></tr>
      <tr class="table-info"><td><strong>Percentage</strong></td><td><%= dto.getPercentage() %>%</td></tr>
      <tr class="table-warning"><td><strong>Grade</strong></td><td><%= dto.getGrade() %></td></tr>
      <tr class="table-primary"><td><strong>Result</strong></td><td><%= dto.getResult() %></td></tr>
    </tfoot>
  </table>

  <button class="btn btn-primary btn-download no-print" onclick="downloadPDF()">Download as PDF</button>
</div>

<%
    } // end of null check
%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script>
  async function downloadPDF() {
    const { jsPDF } = window.jspdf;
    const content = document.getElementById("marksheetContent");

    document.querySelectorAll(".no-print").forEach(el => el.style.display = "none");

    const canvas = await html2canvas(content, { scale: 2 });
    const imgData = canvas.toDataURL("image/png");
    const pdf = new jsPDF('p', 'mm', 'a4');
    const pdfWidth = pdf.internal.pageSize.getWidth();
    const pdfHeight = (canvas.height * pdfWidth) / canvas.width;

    pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
    pdf.save("Student_Marksheet.pdf");

    document.querySelectorAll(".no-print").forEach(el => el.style.display = "block");
  }

  function changeTheme(theme) {
    document.body.className = theme;
  }
</script>

<%@ include file="footer.html"%>
</body>
</html>
