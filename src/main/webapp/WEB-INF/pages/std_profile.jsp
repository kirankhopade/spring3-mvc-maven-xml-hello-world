<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Student Profile | Get Me Progress Report</title>

    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/animate.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/prettyPhoto.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/responsive.css" />" rel="stylesheet">
	<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->
<body>

    
    <header id="header">
         <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-8">
                       <c:if test="${not empty success}">
                             <div class="alert alert-success fade in">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <h4><strong> Alert!!!  </strong>  ${success}</h4>
                            </div>
                        </c:if>
                     </div>
                    <!-- <div class="col-sm-6 col-xs-4">
                        <div class="top-number"><p><i class="fa fa-phone-square"></i>  +0123 456 70 90</p></div>
                    </div> -->
                    <div class="col-sm-6 col-xs-4">
                       <div class="social">
                            <ul class="social-share">
                                 <div class="top-number"><p><i class="glyphicon glyphicon-user"></i>  <b>Login</b></p></div>
                            </ul>
                            
                       </div>
                    </div>
                </div>
            </div>
        </div>


        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                     <a class="navbar-brand" href="index.html"><img src="<c:url value="/resources/images/logo.png" />" alt="logo"></a>
                </div>
                
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                         <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/getIndex">Home</a></li>
                        <li  class="active"><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getStudentProfile">Student Profile</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getProgressReport">Progress Report</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getAttendenceReport">Attendence Report</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getNotifications">Notifications</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getContactUs">Contact Us</a></li>                        
                                      
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->

    <section id="error" class="container text-center wow fadeInDown">
       <div class="table-responsive">

             <div class="center wow fadeInDown">
                <h2>Student Details</h2>
            </div>

            <table class="table table-hover table table-condensed">
      
                <tr>
                   <td><h3>Studdent Name</h3></td>
                   <td><h3>${studentprofile.studentName.fullName} </h3></td>
                </tr>
                <tr>
                    <td><h3>School Name</h3></td>
                    <td><h3> ${studentprofile.schoolDetails.schoolName}</h3></td>
                </tr>
                <tr>
                    <td><h3>Class</h3></td>
                   <td><h3>${studentprofile.std_class}</h3></td>
                </tr>
                <tr>
                    <td><h3>Division</h3></td>
                   <td><h3> ${studentprofile.division}</h3></td>
                </tr>
                <tr>
                    <td><h3>Roll No</h3></td>
                   <td><h3>${studentprofile.rollNo}</h3></td>
                </tr>
                
                <tr>
                    <td><h3>Parent's Email ID</h3></td>
                   <td><h3>${studentprofile.parentEmail}</h3></td>
                </tr>
                <tr>
                    <td><h3>Parent's Mobile No</h3></td>
                   <td><h3>${studentprofile.contactDetails}</h3></td>
                </tr>


            </table>
        </div>
     
        <p>If you find above information is incorrect, then please make a update request by clicking on "Raise Update Request" button. We will verify and update the particular information as early as possible.</p>
        <a class="btn btn-primary" href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getProfileToUpdate">Raise Update Request</a>
    </section><!--/#error-->

    <section id="bottom">
        <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Company</h3>
                        <ul>
                            <li><a href="#">About us</a></li>
                            <li><a href="#">We are hiring</a></li>
                            <li><a href="#">Meet the team</a></li>
                            <li><a href="#">Copyright</a></li>
                            <li><a href="#">Terms of use</a></li>
                            <li><a href="#">Privacy policy</a></li>
                            <li><a href="#">Contact us</a></li>
                        </ul>
                    </div>    
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Support</h3>
                        <ul>
                            <li><a href="#">Faq</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Forum</a></li>
                            <li><a href="#">Documentation</a></li>
                            <li><a href="#">Refund policy</a></li>
                            <li><a href="#">Ticket system</a></li>
                            <li><a href="#">Billing system</a></li>
                        </ul>
                    </div>    
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Developers</h3>
                        <ul>
                            <li><a href="#">Web Development</a></li>
                            <li><a href="#">SEO Marketing</a></li>
                            <li><a href="#">Theme</a></li>
                            <li><a href="#">Development</a></li>
                            <li><a href="#">Email Marketing</a></li>
                            <li><a href="#">Plugin Development</a></li>
                            <li><a href="#">Article Writing</a></li>
                        </ul>
                    </div>    
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h3>Our Partners</h3>
                        <ul>
                            <li><a href="#">Adipisicing Elit</a></li>
                            <li><a href="#">Eiusmod</a></li>
                            <li><a href="#">Tempor</a></li>
                            <li><a href="#">Veniam</a></li>
                            <li><a href="#">Exercitation</a></li>
                            <li><a href="#">Ullamco</a></li>
                            <li><a href="#">Laboris</a></li>
                        </ul>
                    </div>    
                </div><!--/.col-md-3-->
            </div>
        </div>
    </section><!--/#bottom-->

    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2013 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates">ShapeBootstrap</a>. All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Faq</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer><!--/#footer-->


    <script src="<c:url value="/resources/js/jquery.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.prettyPhoto.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.isotope.min.js" />"></script>
    <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/js/wow.min.js" />"></script>

</body>
</html>