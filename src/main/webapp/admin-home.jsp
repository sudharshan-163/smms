<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    
    <!-- including header template  -->
	<%@ include file="header.html"%>

	<!-- Navigation Bar template -->
	<%@ include file="admin-navigation-menu.html"%>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts (Poppins) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Custom CSS for theme styling -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa; /* Light gray background */
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .main-content {
            flex: 1;
        }

        /* --- Header Placeholder --- */
        /* You can place your header.html content styling here */
        .app-header {
            background-color: #ffffff;
            border-bottom: 1px solid #dee2e6;
            padding: 1rem 0;
            text-align: center;
            font-size: 1.5rem;
            font-weight: 600;
            color: #343a40;
        }

        /* --- Navigation Bar Styling --- */
        .navbar {
            box-shadow: 0 2px 4px rgba(0,0,0,.05);
        }
        .navbar-brand {
            font-weight: 600;
        }

        /* --- Main Dashboard Card Styling --- */
        .dashboard-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            text-decoration: none;
            color: inherit;
            display: block; /* Makes the whole card clickable */
        }

        .dashboard-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(0, 123, 255, 0.15);
            color: inherit;
        }

        .dashboard-card .card-body {
            padding: 2rem;
            text-align: center;
        }

        .dashboard-card .icon {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            background: linear-gradient(45deg, #007bff, #0056b3);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-fill-color: transparent;
        }

        .dashboard-card .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .dashboard-card .card-text {
            color: #6c757d;
        }

        /* --- Footer Styling --- */
        .footer {
            background-color: #343a40;
            color: #f8f9fa;
            padding: 2rem 0;
            margin-top: auto; /* Pushes footer to the bottom */
        }
        .footer a {
            color: #0d6efd;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <!-- ================================================== -->
    <!-- START: header.html content would go here           -->
    <!-- ================================================== -->
    
    <!-- ================================================== -->
    <!-- END: header.html content                           -->
    <!-- ================================================== -->


    <!-- ================================================== -->
    <!-- START: admin-navigation-menu.html content          -->
    <!-- ================================================== -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-user-shield me-2"></i>Admin Panel
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>
    <!-- ================================================== -->
    <!-- END: admin-navigation-menu.html content            -->
    <!-- ================================================== -->


    <!-- Main Content Area -->
    <main class="main-content py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h1 class="display-5 fw-bold">Welcome, Admin!</h1>
                <p class="lead text-muted">Select an action below to get started.</p>
            </div>

            <div class="row g-4 justify-content-center">
                
                <!-- Card 1: Add Student Marks -->
                <div class="col-lg-4 col-md-6">
                    <a href="add-marks.jsp" class="dashboard-card">
                        <div class="card-body">
                            <div class="icon">
                                <i class="fas fa-plus-circle"></i>
                            </div>
                            <h5 class="card-title">Add Student Marks</h5>
                            <p class="card-text">Enter new grades and marks for a student.</p>
                        </div>
                    </a>
                </div>

                <!-- Card 2: View All Student Marks -->
                <div class="col-lg-4 col-md-6">
                    <a href="./ViewAllMarksController" class="dashboard-card">
                        <div class="card-body">
                            <div class="icon">
                                <i class="fas fa-clipboard-list"></i>
                            </div>
                            <h5 class="card-title">View All Marks</h5>
                            <p class="card-text">Browse and manage all existing student records.</p>
                        </div>
                    </a>
                </div>

            </div>
        </div>
    </main>


    <!-- ================================================== -->
    <!-- START: footer.html content would go here           -->
    <!-- ================================================== -->
    
    <!-- ================================================== -->
    <!-- END: footer.html content                           -->
    <!-- ================================================== -->


    <!-- Bootstrap JS Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- including footer template -->
		<%@ include file="footer.html"%>
</body>
</html>
