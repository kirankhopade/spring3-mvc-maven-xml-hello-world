<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Progress Report | Get Me Progress Report</title>
    
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>

    <script>
    
         // Load the Visualization API and the piechart package.
              google.load('visualization', '1.0', {'packages':['corechart']});
         // Function to draw a graph for selected subject accross academic year

         function drawChartForSubject(jsonData,selectedvalue) {
      
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Examination');
            data.addColumn('number', 'Marks');
            
            for(var i=0;i<jsonData.length;i++){
               data.addRow([jsonData[i].subjectName , jsonData[i].marks]);
              }
          

        // Set chart options
        var options = {'title':'Progress Report for '+selectedvalue+' throughout academic year',
                       'width':800,
                       'height':600};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }   
         // Function to draw a graph for selected exam
           
      function drawChartForExam(jsonData,selectedvalue) {
        //    alert("From DRAW CHARTS"+jsonData[2].examName);
        
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Subject');
            data.addColumn('number', 'Marks');
            
            for(var i=0;i<jsonData.length-2;i++){
               data.addRow([jsonData[i].subjectName , jsonData[i].marks]);
              }
           var obtainedtotal=jsonData[jsonData.length-2].marks;
        //  alert(obtainedtotal);
          var total = jsonData[jsonData.length-1].marks

        // Set chart options
        var options = {'title':'Progress Report for '+selectedvalue +'.   Total Obtained Marks : '+obtainedtotal+'/'+total+' ('+(obtainedtotal/total)*100+')%',
                       'width':1000,
                       'height':600};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }

        // Get Data to draw a graph

        function getGraph(datatype,selectid){

            var value = document.getElementById(selectid).value;
         //   alert(datatype);
            //alert(x);

            madeAjaxCallForGeaphData(datatype,value);

        }

        // show Select Exam dropdown list and hide Select Subject dropdown if it is visible.

        function showexamwisereportDiv() {
            document.getElementById('subjectwisereport').style.display = "none";
            document.getElementById('examwisereport').style.display = "block";
            madeAjaxCallForSelect("http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getSelectDropDownList","#sel1","exam");
                // Clear the content of #sel1
                selectbox=document.getElementById("sel1");
                for(var i=selectbox.options.length-1;i>=0;i--)
                {
                    selectbox.remove(i);
                }
        } // EOF showexamwisereportDiv()

        // show Select Subjec dropdown list and hide Select Exam dropdown if it is visible

   	    function showsubjectwisereportDiv() {
            document.getElementById('examwisereport').style.display = "none";
            document.getElementById('subjectwisereport').style.display = "block";
            madeAjaxCallForSelect("http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getSelectDropDownList","#sel2","subject");
             // Clear the content of #sel2
                selectbox=document.getElementById("sel2");
                for(var i=selectbox.options.length-1;i>=0;i--)
                {
                    selectbox.remove(i);
                }

        } // EOF showsubjectwisereportDiv()

        // AJAX call function to load graph data

        function madeAjaxCallForGeaphData(listtype,selectedvalue){
            $.ajax({
                    type: "get",
                    url: "http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getGraphData",
                    cache: false,               
                    data:{type:listtype,value:selectedvalue} ,
                        success: function(response){
                           // $('#result').html("");
                   
                          //  $('#result').html("First Name:- " + response[0].subjectName);
                            
                            if(listtype==="exam")
                              google.setOnLoadCallback(drawChartForExam(response,selectedvalue));

                            if(listtype==="subject")
                              google.setOnLoadCallback(drawChartForSubject(response,selectedvalue));
     
                    
                    },
                    error: function(){                      
                        alert('Error while request..');
                    }
                });
        }
         
         // AJAX call function to load exam and subject lists ffrom database

        function madeAjaxCallForSelect(reqURL,selectid,listType){
        		$.ajax({
        			type: "get",
        			url: reqURL,
        			cache: false,				
        			data:{type:listType} ,
        				success: function(response){
        			     //	$('#result').html("");
        		
        			     //	$('#result').html("First Name:- " + response);
        				                                    				
        				    for(i=0; i<response.length; i++){
        				        $(selectid).append("<option>" + response[i] + "</option>");
        				    }        
        			
        			},
        			error: function(){						
        				alert('Error while request..');
        			}
        		});
        	} // EOF madeAjaxCallForSelect()
        
    </script>
</head><!--/head-->

<body>

   
    <header id="header">
         <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                      <!--   <div class="top-number"><p><i class="fa fa-phone-square"></i>  +0123 456 70 90</p></div> -->
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
                        <li   class="active"><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getProgressReport">Progress Report</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getAttendenceReport">Attendence Report</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getNotifications">Notifications</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getContactUs">Contact Us</a></li>                   
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->

    <section id="feature" class="transparent-bg">
        <div class="container">
           <div class="center wow fadeInDown">
                <h2>Progress Reports</h2>
                <p class="lead">We provide different analysis reports. Please select desired on and get your report on screen. <br> </p>
            </div>

            <div class="row">
                <div class="features">
                    <div class="col-md-6 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                             <a href="#" onclick="return showexamwisereportDiv();"> 
                            <i class="fa fa-bullhorn"></i>
                            <h2>Exam wise Progress Report</h2>
                            <h3>This report will contain all details of selected examination of current academic year</h3></a>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-6 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <a href="#" onClick="showsubjectwisereportDiv();" >
                            <i class="fa fa-comments" ></i>
                            <h2>Subject wise Progress Report </h2>
                            <h3>This report will contain details of particular subject for the current academic year</h3></a>
                        </div>
                    </div>
                </div><!--/.services-->
            </div><!--/.row--> 

         </div><!--/.container-->
    </section><!--/#feature-->


   <section id="feature" class="transparent-bg">
        <div class="container">
           <div id="examwisereport" class="center wow fadeInDown" style="display:none;">
            <p><h3>Please Select the examination from the following drop down list.</h3></p>
                <form>
                        <div class="form-group">
                          <label for="sel1">Select Examination:</label>
                          <select  class="input-large" id="sel1" >
                           <!--  <option>Examination 1</option>
                            <option>Examination 2</option>
                            <option>Examination 3</option>
                            <option>Examination 4</option> -->
                          </select>
                      </div>
                      
                      <button type="button" name="submit" class="btn btn-primary btn-lg" required="required" onClick="getGraph('exam','sel1');">Get Me Report
                      </button>
                </form>
              
                 
           </div>

           <div id="subjectwisereport" class="center wow fadeInDown" style="display:none;">

             <p><h3>Please Select the examination from the following drop down list.</h3></p>
                 <form>
                        <div class="form-group">
                          <label for="sel1">Select Subject:</label>
                          <select  class="input-large" id="sel2" >
                            <!-- <option>Marathi</option>
                            <option>Hindi </option>
                            <option>English</option>
                            <option>Geography</option>
                            <option>History</option>
                            <option>Mathematics</option> -->
                          </select>
                      </div>
                      
                      <button type="button" name="submit" class="btn btn-primary btn-lg" required="required" onClick="getGraph('subject','sel2');">Get Me Report
                      </button>
                </form>
       
    </section>

    <section>
        <div class="container" >
                <!--Div that will hold the pie chart-->
                   <div id="chart_div" class="center wow fadeInDown"></div>
               
        </div>
    </section>



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