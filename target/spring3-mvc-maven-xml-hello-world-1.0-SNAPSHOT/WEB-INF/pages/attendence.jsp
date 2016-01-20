<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Attendence Report | Get Me Progress Report</title>
    
    <!-- core CSS -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/animate.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/prettyPhoto.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/responsive.css" />" rel="stylesheet">
     

    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">  
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>

<style>
* {
    margin: 0 auto;
    padding: 0;
}

/*body {
    background-color: #F2F2F2;
}

.container {
    margin: 0 auto;
    width: 920px;
    padding: 50px 20px;
    background-color: #fff;
}

h3 {
    text-align: center;
}
*/
#calendar {
    margin-top: 40px;
}
    
.event a {
    background-color: #42B373 !important;
    background-image :none !important;
    color: #ffffff !important;
}

.event_purple a {
    background-color: #800080 !important;
    background-image :none !important;
    color: #ffffff !important;
}


.events a {
    background-color: #FF0000 !important;
    background-image :none !important;
    color: #ffffff !important;
}

div.ui-datepicker{
 font-size:30px;
}
</style>


    <script type="text/javascript">

        function fullyearattendencereportDiv() {
           // alert("kkkk");
            document.getElementById('monthwiseattendence').style.display = "none";
            document.getElementById('fullyearattendence').style.display = "block";
        }

         function monthwiseattendencereportDiv() {
            //alert("reportdiv");
            document.getElementById('fullyearattendence').style.display = "none";
            document.getElementById('monthwiseattendence').style.display = "block";

                selectbox=document.getElementById("sel1");
                for(var i=selectbox.options.length-1;i>=0;i--)
                {
                    selectbox.remove(i);
                }
                madeAjaxCallForSelect("http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getSelectDropDownList","#sel1","exam");

        }


        function madeAjaxCallForSelect(reqURL,selectid,listType){
                $.ajax({
                    type: "get",
                    url: reqURL,
                    cache: false,               
                    data:{type:listType} ,
                        success: function(response){
                          
                            for(i=0; i<response.length; i++){
                                $(selectid).append("<option>" + response[i] + "</option>");
                            }        
                    
                    },
                    error: function(){                      
                        alert('Error while request..');
                    }
                });
            } // EOF madeAjaxCallForSelect()


        jQuery(document).ready(function() {        
               // alert("hhhh");
               
        var datesArray=['16/8/2015','24/8/2015','9/4/2015','10/9/2015','28/9/2015']
        var datesArray_yellow=['17/8/2015','25/8/2015','10/4/2015','11/9/2015','29/9/2015']
        var datesArray_purple=['18/8/2015','26/8/2015','11/4/2015','12/9/2015','30/9/2015']       

            $('#calendar').datepicker({
              //  callbacks.fired("ttt");
                inline: true,
                beforeShowDay: function (date) {

                     /* changeMonth: false,
                      changeYear: false,
                      dateFormat: 'dd/mm/yy',
                      duration: 'fast',
                      stepMonths: 0,*/

                  
            var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
            for (i = 0; i < datesArray_yellow.length; i++) {
                    if($.inArray(d + '/' + (m+1) + '/' + y,datesArray_yellow) != -1) {
                        //return [false];
                        return [true, 'events', ''];
                    }

                }

            for (j = 0; j < datesArray.length; j++) {
                    if($.inArray(d + '/' + (m+1) + '/' + y,datesArray) != -1) {
                        //return [false];
                        return [true, 'event', ''];
                    }

                }

            for (k = 0; k < datesArray_purple.length; k++) {
                    if($.inArray(d + '/' + (m+1) + '/' + y,datesArray_purple) != -1) {
                        //return [false];
                        return [true, 'event_purple', ''];
                    }
                }

                return [true];
            }
                
        });

$("#calendar").hide({});


    });

       
       function drawAttendenceData(selectid){


        var value = document.getElementById(selectid).value;
                alert(value);
                $("#calendar    ").show({});
       // document.getElementById('#calendar').style.display = "none";
       } 





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
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getProgressReport">Progress Report</a></li>
                        <li  class="active"><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getAttendenceReport">Attendence Report</a></li>
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
                <h2>Attendence Report</h2>
                <p class="lead">We provide different analysis reports. Please select desired on end get your report on screen. <br> </p>
            </div>

            <div class="row">
                <div class="features">
                     <div class="col-md-6 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <a href="#" onclick="return fullyearattendencereportDiv();">
                            <i class="fa fa-bullhorn"></i>
                            <h2>Attendence Report for Entire Academic Year</h2>
                            <h3>This report will contain attendence record of each month for the current academic year</h3></a>
                        </div>
                    </div> <!--/.col-md-4-->

                    <div class="col-md-6 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <a href="#" onclick="return monthwiseattendencereportDiv();">
                            <i class="fa fa-comments" ></i>
                            <h2>Attendence Report for a Particular Month </h2>
                            <h3>This report will contain attendence report of a particular month for the current academic year</h3></a>
                        </div>
                    </div> <!--/.col-md-4-->

                </div><!--/.services-->
            </div><!--/.row--> 


        </div><!--/.container-->
    </section><!--/#feature-->


<section id="feature" class="transparent-bg">
        <div class="container">
           <div id="fullyearattendence" class="center wow fadeInDown" style="display:none;">
            <p><h3>Please click on the following button to get attendence report for the current academic year.</h3></p>
                <form>
                     
                      <button type="button" name="submit" class="btn btn-primary btn-lg" required="required" >Get Me Report
                      </button>
                </form>
                 
           </div>

           <div id="monthwiseattendence" class="center wow fadeInDown" style="display:none;">

             <p><h3>Please Select the month to get attendence report.</h3></p>
                 <form>
                        <div class="form-group">
                          <label for="sel1">Select Month:</label>
                          <select  class="input-large" id="sel1" >
                            <!-- <option>January</option>
                            <option>February</option>
                            <option>March</option>
                            <option>April</option>
                            <option>May</option>
                            <option>June</option>
                            <option>July</option>
                            <option>August</option>
                            <option>September</option>
                            <option>October</option>
                            <option>November</option>
                            <option>December</option> -->
                          </select>
                      </div>
                      
                      <button type="button" name="submit" class="btn btn-primary btn-lg" required="required" onClick=" drawAttendenceData('sel1');">Get Me Report
                      </button>
                </form>
           </div>
        </div>

    </section>


    <section>
       <div class="container">
         <h3> Highlight Particular Dates in JQuery UI Datepicker </h3>
        
        <div id="calendar" > </div>
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

 
   <!--  <script src="<c:url value="/resources/js/jquery.js" />"></script> -->
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.prettyPhoto.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.isotope.min.js" />"></script> 
     <script src="<c:url value="/resources/js/main.js" />"></script>
    <script src="<c:url value="/resources/js/wow.min.js" />"></script>
    
</body>
</html>