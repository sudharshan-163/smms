<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SMMS Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: linear-gradient(135deg, #2193b0, #6dd5ed);
	height: 100vh;
	margin: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.navbar {
	width: 100%;
}

.card {
	padding: 30px;
	border-radius: 1rem;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
	max-width: 400px;
	width: 100%;
	margin-top: 50px;
}
</style>
</head>
<body>
	
	<nav class="navbar navbar-dark" style="background-color: #2193b0;">
		<div class="container-fluid justify-content-center"
			style="padding: 40px;">
			<span class="navbar-brand mb-0 h1" style="">STUDENTS MARKS
				MANAGEMENT SYSTEM</span>
		</div>
	</nav>


	<div class="card text-center" style="margin: 90px;">
		<form>

			<h3
				style="text-align: -webkit-center; padding: 5px; background-color: whitesmoke; font-family: emoji;">
				Login Form</h3>
			<div class="form-floating mb-3">
				<input type="email" class="form-control" id="email"
					placeholder="Email"> <label for="email">Email</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="password"
					placeholder="Password"> <label for="password">Password</label>
			</div>
			<div class="d-grid gap-2">
				<input type="submit" class="btn btn-primary" value="Login">
				<input type="reset" class="btn btn-outline-secondary" value="Clear">
			</div>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
	
</body>
</html>
