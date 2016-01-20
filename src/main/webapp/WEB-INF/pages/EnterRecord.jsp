<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Enter Data | Get Me Progress Report</title>
    
    <!-- core CSS -->

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

    <script type="text/javascript">
/*
      $(function() {

              var $form = $('form');

              var startItems = convertSerializedArrayToHash($form.serializeArray()); 

              $('form').submit( {
                var currentItems = convertSerializedArrayToHash($form.serializeArray());
                var itemsToSubmit = hashDiff( startItems, currentItems);

                $.post($form.attr('action'), itemsToSubmit;
              });
        });

                function hashDiff(h1, h2) {
                  var d = {};
                  for (k in h2) {
                    if (h1[k] !== h2[k]) d[k] = h2[k];
                  }
                  return d;
                }

            function convertSerializedArrayToHash(a) { 
                  var r = {}; 
                  for (var i = 0;i<a.length;i++) { 
                    r[a[i].name] = a[i].value;
                  }
                  return r;
            }*/

    </script>
</head><!--/head-->

<body>

    
<header id="header">
         <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                     
                    </div>
                    <div class="col-sm-6 col-xs-8">
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
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getStudentProfile">Student Profile</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getProgressReport">Progress Report</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getAttendenceReport">Attendence Report</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getNotifications">Notifications<span class="badge">10</span></a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getContactUs">Contact Us</a></li>                   
                     
                    </ul>
                </div>
            </div>
        </nav>
        
    </header>




    <section id="feature" class="transparent-bg">
        <div class="container">
            <div class="center wow fadeInDown">
                <h2>Update Profile Data</h2>
            </div>
            <div class="wow fadeInDown"> 
              
               <form method="post" action="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getDataToUpdate">
                    <div class="form-group">
                        <label for="studentid"><font color="green">Student ID :</font></label>
                        <input type="text" class="form-control" id="studentid" placeholder=${studentprofile._id} disabled>
                      </div>

                      <!-- <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" placeholder="Password">
                    </div> -->

                    <div class="form-group">
                       <!--  <span class="label label-success"><label for="name"><b>Student Name</b></label></span> -->
                        <label for="name"><font color="green">Student Name :</font></label> 
                            <div class="row"> 
                                <div class="col-sm-4 col-xs-4">
                                    <label for="firstname">First Name</label>
                                    <input type="text" class="form-control" id="firstname" name="firstname" placeholder=${studentprofile.studentName.firstName}>
                                </div>
                                <div class="col-sm-4 col-xs-4">
                                    <label for="middleName">Middle Name</label>
                                    <input type="text" class="form-control" id="middlename" name="middlename" placeholder=${studentprofile.studentName.middleName}>
                                </div>
                                 <div class="col-sm-4 col-xs-4">
                                    <label for="lastName">Last Name</label>
                                    <input type="text" class="form-control" id="lastname" name="lastname" placeholder=${studentprofile.studentName.lastName}>
                                </div>
                            </div>
                    </div>

                    <div class="form-group">
                         <label for="name"><font color="green">School Details : </font></label>
                            <div class="row"> 
                                <div class="col-sm-4 col-xs-4">
                                    <label for="schoolid">School Id</label>
                                    <input type="text" class="form-control" id="schoolid" name="schoolid" placeholder=${studentprofile.schoolDetails.schoolID} disabled>
                                </div>
                                 <div class="col-sm-8 col-xs-4">
                                    <label for="schoolName">School Name</label>
                                    <input type="text" class="form-control" id="schoolname" name="schoolname" placeholder=${studentprofile.schoolDetails.schoolName}>
                                </div>
                            </div>
                    </div>
                    <div class="form-group">
                             <label for="name"><font color="green">School Address :</font></label>
                            
                                 <div class="form-group">
                                    <label for="firstline">First Line</label>
                                    <input type="text" class="form-control" id="firstline" name="firstline" placeholder=${studentprofile.schoolDetails.address.firstLine}>
                                </div>
                                <div class="form-group">
                                    <label for="secondline">Second Line</label>
                                    <input type="text" class="form-control" id="second line" name="secondline" placeholder=${studentprofile.schoolDetails.address.secondLine}>
                                </div>
                                <div class="form-group">
                                    <div class="row"> 
                                        <div class="col-sm-6 col-xs-4">
                                            <label for="city">City</label>
                                             <input type="text" class="form-control" id="city" name="city" placeholder=${studentprofile.schoolDetails.address.city}>
                                        </div>
                                         <div class="col-sm-6 col-xs-4">
                                            <label for="state">State</label>
                                             <input type="text" class="form-control" id="State" name="state" placeholder=${studentprofile.schoolDetails.address.state}>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row"> 
                                        <div class="col-sm-6 col-xs-4">
                                            <label for="country">Country</label>
                                             <input type="text" class="form-control" id="contry" name="country" placeholder=${studentprofile.schoolDetails.address.country}>
                                        </div>
                                         <div class="col-sm-6 col-xs-4">
                                            <label for="pincode">Pin Code</label>
                                             <input type="text" class="form-control" id="pincode" name="pincode" placeholder=${studentprofile.schoolDetails.address.pinCode}>
                                        </div>
                                    </div>
                                </div>
                    </div>

                    <div class="form-group">
                          <label for="name"><font color="green">Class Details : </font></label>
                            <div class="row"> 
                                <div class="col-sm-4 col-xs-4">
                                    <label for="standard">Standard</label>
                                    <input type="text" class="form-control" id="std_class" name="std_class" placeholder=${studentprofile.std_class}>
                                </div>
                                <div class="col-sm-4 col-xs-4">
                                    <label for="division">Division</label>
                                    <input type="text" class="form-control" id="division" name="division" placeholder=${studentprofile.division}>
                                </div>
                                 <div class="col-sm-4 col-xs-4">
                                    <label for="rollnoo">Roll No</label>
                                    <input type="text" class="form-control" id="rollno" name="rollno" placeholder=${studentprofile.rollNo}>
                                </div>
                            </div>
                    </div>

                    <div class="form-group">
                             <label for="name"><font color="green">Parent's Contact Details : </font></label>
                                    <div class="row"> 
                                        <div class="col-sm-6 col-xs-4">
                                            <label for="contactno">Contact No.</label>
                                             <input type="text" class="form-control" id="contactno" name="contactno" placeholder=${studentprofile.contactDetails}>
                                        </div>
                                         <div class="col-sm-6 col-xs-4">
                                            <label for="emailid">Email Id</label>
                                             <input type="email" class="form-control" id="email" name="email" placeholder=${studentprofile.parentEmail}>
                                        </div>
                                    </div>
                     </div>
                     <div class="center wow fadeInDown">
                           <!--  <button type="submit" class="btn btn-default">Submit</button> -->
                              <div class="row"> 
                                        
                                        <div class="col-sm-6 col-xs-4">
                                              <button type="submit" class="btn btn-primary">Update Data</button>
                                        </div>
                                        <div class="col-sm-6 col-xs-4">
                                            <a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getStudentProfile">
                                              <button type="button" class="btn btn-primary" >Cancel Update</button> </a>
                                        </div>
                                        
                               </div>
                     </div>

                     <!-- <div class="form-group" id="adexamid">
                             <label for="name">Examinations Details</label>
                                    <div class="row"> 
                                        
                                        <div class="col-sm-4 col-xs-4">
                                              <button type="button" class="btn btn-default" onclick="addExam()">Add Examination</button>
                                        </div>
                                         
                                    </div>

                                   

                                       
                     </div> -->
                  




                       
                </form>
                </div>
        </div><!--/.container-->
    </section><!--/#feature-->




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