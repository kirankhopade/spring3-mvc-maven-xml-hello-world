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
              google.load("visualization", "1.1", {'packages':["bar"]});
           
         // Function to draw a graph for selected subject accross academic year

         function drawChartForSubject(jsonData) {

            var columnData = new google.visualization.DataTable();
            columnData.addColumn('string', 'Examination Name');
            columnData.addColumn('number', 'Average Marks');
                       
            for(var i=0;i<jsonData.recordList.length;i++){
               columnData.addRow([jsonData.recordList[i].examname , (jsonData.recordList[i].totalobtained/jsonData.recordList[i].totaloutoff)*100]);
            
              }
          
           var pieData1 = new google.visualization.DataTable();
           pieData1.addColumn('string', 'Examination Name');
           pieData1.addColumn('number', 'result');

          for(var i=0;i<jsonData.recordList.length;i++){
                 pieData1.addRow([jsonData.recordList[i].examname+' '+(jsonData.recordList[i].studentspassed/jsonData.recordList[i].studentsappeared)*100+'%' ,jsonData.recordList[i].studentspassed]);
              
                }



           var pieData2 = new google.visualization.DataTable();
           pieData2.addColumn('string', 'Examination Name');
           pieData2.addColumn('number', 'result');

          for(var i=0;i<jsonData.recordList.length;i++){
                 pieData2.addRow([jsonData.recordList[i].examname+' '+(jsonData.recordList[i].studentfailed/jsonData.recordList[i].studentsappeared)*100+'%' ,jsonData.recordList[i].studentfailed]);
              
                }


                var pieOptions1 = {
                         
                          title: 'Passing result per examination for '+jsonData.recordList[0].subject,
                          is3D: true,
                          pieSliceText: 'label',
                          'width':1000,
                          'height':800,
                             };
               
                var pieOptions2 = {
                         
                          title: 'Failing result per subject for '+jsonData.recordList[0].subject,
                          is3D: true,
                          pieSliceText: 'label',
                          'width':1000,
                          'height':800,
                             };

                var columnOptions = {
        
                        'title':'School : '+jsonData.schoolname +', Class : '+jsonData.className+', Division : '+jsonData.division+', Subject : '+jsonData.recordList[0].subject,
                       'width':1000,
                       'height':600,
                       vAxis: {title: 'Subject Average Marks',titleTextStyle:{color: 'green'}},
                       hAxis: {title: 'Examination',titleTextStyle:{color: 'green'}}
                 
                   };

        // Instantiate and draw our chart, passing in some options.
        var columnChart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        var piechart1 = new google.visualization.PieChart(document.getElementById('piechart_div1'));
        var piechart2 = new google.visualization.PieChart(document.getElementById('piechart_div2'));
        
        columnChart.draw(columnData, columnOptions);
        piechart1.draw(pieData1, pieOptions1);
        piechart2.draw(pieData2, pieOptions2);
      }   
         // Function to draw a graph for selected exam
           
      function drawChartForExam(jsonData) {
                
       // var obtainedtotal=jsonData.recordList[1].subject + (jsonData.recordList[1].totalobtained/jsonData.recordList[1].totaloutoff)*100+jsonData.recordList[1].studentsappeared+jsonData.recordList[1].studentspassed;
       //   alert(obtainedtotal);

            var columnData = new google.visualization.DataTable();
            columnData.addColumn('string', 'Subject');
            columnData.addColumn('number', 'Average Marks');
                       
            for(var i=1;i<jsonData.recordList.length;i++){
               columnData.addRow([jsonData.recordList[i].subject , (jsonData.recordList[i].totalobtained/jsonData.recordList[i].totaloutoff)*100]);
            
              }
          
           var pieData1 = new google.visualization.DataTable();
           pieData1.addColumn('string', 'Subject');
           pieData1.addColumn('number', 'result');

          for(var i=1;i<jsonData.recordList.length;i++){
                 pieData1.addRow([jsonData.recordList[i].subject+' '+(jsonData.recordList[i].studentspassed/jsonData.recordList[i].studentsappeared)*100+'%' ,jsonData.recordList[i].studentspassed]);
              
                }



           var pieData2 = new google.visualization.DataTable();
           pieData2.addColumn('string', 'Subject');
           pieData2.addColumn('number', 'result');

          for(var i=1;i<jsonData.recordList.length;i++){
                 pieData2.addRow([jsonData.recordList[i].subject+' '+(jsonData.recordList[i].studentfailed/jsonData.recordList[i].studentsappeared)*100+'%' ,jsonData.recordList[i].studentfailed]);
              
                }


                var pieOptions1 = {
                         
                          title: 'Passing result per subject for '+jsonData.examination,
                          is3D: true,
                          pieSliceText: 'label',
                          'width':1000,
                          'height':800,
                             };
               
                var pieOptions2 = {
                         
                          title: 'Failing result per subject for '+jsonData.examination,
                          is3D: true,
                          pieSliceText: 'label',
                          'width':1000,
                          'height':800,
                             };

                var columnOptions = {
        
                        'title':'School : '+jsonData.schoolname +', Class : '+jsonData.className+', Division : '+jsonData.division+', Examination : '+jsonData.examination,
                       'width':1000,
                       'height':600,
                       vAxis: {title: 'Subject Average Marks',titleTextStyle:{color: 'green'}},
                       hAxis: {title: 'Subject',titleTextStyle:{color: 'green'}}
                 
                   };

        // Instantiate and draw our chart, passing in some options.
        var columnChart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        var piechart1 = new google.visualization.PieChart(document.getElementById('piechart_div1'));
        var piechart2 = new google.visualization.PieChart(document.getElementById('piechart_div2'));
        
        columnChart.draw(columnData, columnOptions);
        piechart1.draw(pieData1, pieOptions1);
        piechart2.draw(pieData2, pieOptions2);
        
      }





      function drawChartForAllExam(jsonData) {
                
       // var obtainedtotal=jsonData.recordList[1].subject + (jsonData.recordList[1].totalobtained/jsonData.recordList[1].totaloutoff)*100+jsonData.recordList[1].studentsappeared+jsonData.recordList[1].studentspassed;
       //   alert(obtainedtotal);

            var columnData = new google.visualization.DataTable();
            columnData.addColumn('string', 'Examination Name');
            columnData.addColumn('number', 'Class Average Percentage(%)');
                       
            for(var i=1;i<jsonData.recordList.length;i++){
               columnData.addRow([jsonData.recordList[i].examname , (jsonData.recordList[i].totalobtained/jsonData.recordList[i].totaloutoff)*100]);
            
              }
          
           var pieData1 = new google.visualization.DataTable();
           pieData1.addColumn('string', 'Examination Name');
           pieData1.addColumn('number', 'result');

          for(var i=1;i<jsonData.recordList.length;i++){
                 pieData1.addRow([jsonData.recordList[i].examname+' '+(jsonData.recordList[i].studentspassed/jsonData.recordList[i].studentsappeared)*100+'%' ,jsonData.recordList[i].studentspassed]);
              
                }



           var pieData2 = new google.visualization.DataTable();
           pieData2.addColumn('string', 'Subject');
           pieData2.addColumn('number', 'Examination Name');

          for(var i=1;i<jsonData.recordList.length;i++){
                 pieData2.addRow([jsonData.recordList[i].examname+' '+(jsonData.recordList[i].studentfailed/jsonData.recordList[i].studentsappeared)*100+'%' ,jsonData.recordList[i].studentfailed]);
              
                }


                var pieOptions1 = {
                         
                          title: 'Passing result per Examination',
                          is3D: true,
                          pieSliceText: 'label',
                          'width':1000,
                          'height':800,
                             };
               
                var pieOptions2 = {
                         
                          title: 'Failing result per Examination',
                          is3D: true,
                          pieSliceText: 'label',
                          'width':1000,
                          'height':800,
                             };

                var columnOptions = {
        
                        'title':'School : '+jsonData.schoolname +', Class : '+jsonData.className+', Division : '+jsonData.division,
                       'width':1000,
                       'height':600,
                       vAxis: {title: 'Class Average Percentage(%)',titleTextStyle:{color: 'green'}},
                       hAxis: {title: 'Examination',titleTextStyle:{color: 'green'}}
                 
                   };

        // Instantiate and draw our chart, passing in some options.
        var columnChart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        var piechart1 = new google.visualization.PieChart(document.getElementById('piechart_div1'));
        var piechart2 = new google.visualization.PieChart(document.getElementById('piechart_div2'));
        
        columnChart.draw(columnData, columnOptions);
        piechart1.draw(pieData1, pieOptions1);
        piechart2.draw(pieData2, pieOptions2);
        
      }

        // Get Data to draw a graph

        function getGraph(reporttype,sel11,sel12,sel13,sel14){

            var schoolid = document.getElementById(sel11).value;
            var classname = document.getElementById(sel12).value;
            var division = document.getElementById(sel13).value;
            if(reporttype!= 'ExamwiseAllExam')
              {
                var examname = document.getElementById(sel14).value;
              }else{
                var examname="none";
              }
            
            
            alert(reporttype+schoolid+classname+division+examname);
            //alert(x);

            madeAjaxCallForGeaphData(reporttype,schoolid,classname,division,examname);

        }

        // show Select Exam dropdown list and hide Select Subject dropdown if it is visible.

        function showexamwisereportDiv() {
            document.getElementById('subjectwisereport').style.display = "none";
            document.getElementById('examwisereportforallexam').style.display = "none";
            document.getElementById('examwisereport').style.display = "block";
         //   madeAjaxCallForSelect("http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getSelectDropDownList","#sel1","exam");
                // Clear the content of #sel1
          //      selectbox=document.getElementById("sel1");
            //    for(var i=selectbox.options.length-1;i>=0;i--)
              //  {
                //    selectbox.remove(i);
              //  }
        } // EOF showexamwisereportDiv()

        // show Select Subjec dropdown list and hide Select Exam dropdown if it is visible

        function showsubjectwisereportDiv() {
            document.getElementById('examwisereport').style.display = "none";
            document.getElementById('examwisereportforallexam').style.display = "none";
            document.getElementById('subjectwisereport').style.display = "block";
          //  madeAjaxCallForSelect("http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getSelectDropDownList","#sel2","subject");
             // Clear the content of #sel2
                /*selectbox=document.getElementById("sel2");
                for(var i=selectbox.options.length-1;i>=0;i--)
                {
                    selectbox.remove(i);
                }*/

        } // EOF showsubjectwisereportDiv()

         // show Select Exam dropdown list and hide Select Subject dropdown if it is visible.

        function showexamwisereportforallexamDiv() {
            document.getElementById('subjectwisereport').style.display = "none";
            document.getElementById('examwisereport').style.display = "none";
            document.getElementById('examwisereportforallexam').style.display = "block";
           // madeAjaxCallForSelect("http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getSelectDropDownList","#sel1","exam");
                // Clear the content of #sel1
             //   selectbox=document.getElementById("sel1");
               // for(var i=selectbox.options.length-1;i>=0;i--)
               // {
                 //   selectbox.remove(i);
               // }
        } // EOF examwisereportforallexam()
        

        // AJAX call function to load graph data

        function madeAjaxCallForGeaphData(reporttype,schoolid,classname,division,examname){
            $.ajax({
                    type: "get",
                    url: "http://localhost:8080/spring3-mvc-maven-xml-hello-world/instituteservices/getClasswiseReport",
                    cache: false,               
                    data:{type:reporttype,schoolid:schoolid,classname:classname,division:division,examname:examname} ,
                        success: function(response){
                           // $('#result').html("");
                   
                          //  $('#result').html("First Name:- " + response[0].subjectName);
                            
                            if(reporttype==="examwise")
                              google.setOnLoadCallback(drawChartForExam(response));

                            if(reporttype==="subjectwise")
                              google.setOnLoadCallback(drawChartForSubject(response));

                            if(reporttype==="ExamwiseAllExam")
                              google.setOnLoadCallback(drawChartForAllExam(response));
                              
     
                    
                    },
                    error: function(){                      
                        alert('Error while request..');
                    }
                });
        }
         
         /*
         // AJAX call function to load exam and subject lists ffrom database

        function madeAjaxCallForSelect(reqURL,selectid,listType){
            $.ajax({
              type: "get",
              url: reqURL,
              cache: false,       
              data:{type:listType} ,
                success: function(response){
                   // $('#result').html("");
            
                   // $('#result').html("First Name:- " + response);
                                                            
                    for(i=0; i<response.length; i++){
                        $(selectid).append("<option>" + response[i] + "</option>");
                    }        
              
              },
              error: function(){            
                alert('Error while request..');
              }
            });
          } // EOF madeAjaxCallForSelect()
        */
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
                        <li class="active"><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/instituteservices/getClassWiseReportPage">Class Reports</a></li>
                         <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/instituteservices/getInstitutewiseReportPage">School Reports</a></li><li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getAttendenceReport">Attendence Reports</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getNotifications">Notifications</a></li>
                        <li><a href="http://localhost:8080/spring3-mvc-maven-xml-hello-world/studentservices/getContactUs">Contact Us</a></li>                   
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
        
    </header><!--/header-->

    <section id="feature" class="transparent-bg">
        <div class="container">
           <!-- <div class="center wow fadeInDown">
                <h2>Class Reports</h2>
                <p class="lead">We provide different analysis reports for a Class. Please select desired class and get your report on screen. <br> </p>
            </div> -->

            <div class="row">
                <div class="features">
                    <div class="col-md-6 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                             <a href="#" onclick="return showexamwisereportDiv();"> 
                            <i class="fa fa-bullhorn"></i>
                            <h2>Examination wise report for selected examination</h2>
                            <h3>This report will contain all details of selected examination including number of students appeared, number of students passed,number off students failed, class average percentage and class result in percentage.</h3></a>
                        </div>
                    </div><!--/.col-md-4-->

                    <div class="col-md-6 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                            <a href="#" onClick="showsubjectwisereportDiv();" >
                            <i class="fa fa-comments" ></i>
                            <h2>Subject report for all examinations </h2>
                            <h3>This report will contain details of particular subject including number of students appeared, number of students passed, number of students failed, subject average and class result in percentage for each examination.</h3></a>
                        </div>
                    </div>
                </div><!--/.services-->
            </div><!--/.row--> 


            <div class="row">
                <div class="features">
                    <div class="col-md-6 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="feature-wrap">
                             <a href="#" onclick="return showexamwisereportforallexamDiv();"> 
                            <i class="fa fa-bullhorn"></i>
                            <h2>Exam wise report for a selected division(class) for all examinations</h2>
                            <h3>This report will contain all details of selected examination including number of students appeared, number of students passed,number off students failed, class average percentage and class result in percentage for each exam.</h3></a>
                        </div>
                    </div>
                </div><!--/.services-->
            </div><!--/.row-->     




         </div><!--/.container-->
    </section><!--/#feature-->


   <section id="feature" class="transparent-bg">
        <div class="container">
           <div id="examwisereport" class="center wow fadeInDown" style="display:none;">
            <p><h3>Please Select the details from the following drop down list.</h3></p>
                <form>
                        <div class="form-group">
                            <div class="row">
                                 <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                      <label for="sel11">School : </label>
                                      <select  class="input-large" id="sel11" >
                                      <option selected='selected'>school_id_1</option>
                                      </select>
                                 </div>

                                <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                      <label for="sel12">Class : </label>
                                      <select  class="input-large" id="sel12" >
                                      <option selected='selected'>V</option>
                                      <option>VI</option>
                                      </select>
                                </div>

                                <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                      <label for="sel13">Division : </label>
                                      <select  class="input-large" id="sel13" >
                                      <option selected='selected'>A</option>
                                      </select>
                                </div>

                                <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                      <label for="sel14">Examination : </label>
                                      <select  class="input-large" id="sel14" >
                                      <option selected='selected'>Unit Test 1</option>
                                      </select>
                                </div>

                            </div>
                      </div>
                      <button type="button" name="submit" class="btn btn-primary btn-lg" required="required" onClick="getGraph('examwise','sel11','sel12','sel13','sel14');">Get Me Report1
                      </button>
                </form>
              
                 
           </div>

           <div id="subjectwisereport" class="center wow fadeInDown" style="display:none;">

             <p><h3>Please Select the details from the following drop down list.</h3></p>
                 <form>
                        <div class="form-group">
                            <div class="row">
                                 <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                      <label for="sel21">School : </label>
                                      <select  class="input-large" id="sel21" >
                                      <option>school_id_1</option>
                                      </select>
                                 </div>

                                <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                      <label for="sel22">Class : </label>
                                      <select  class="input-large" id="sel22" >
                                      <option>V</option>
                                      <option>VI</option>
                                      </select>
                                </div>

                                <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                      <label for="sel23">Division : </label>
                                      <select  class="input-large" id="sel23" >
                                      <option>A</option>
                                      </select>
                                </div>

                                <div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                      <label for="sel24">Subject : </label>
                                      <select  class="input-large" id="sel24" >
                                      <option>Marathi</option>
                                      <option>English</option>
                                       </select>

                                </div>

                            </div>
                      </div>
                      
                      <button type="button" name="submit" class="btn btn-primary btn-lg" required="required" onClick="getGraph('subjectwise','sel21','sel22','sel23','sel24');">Get Me Report
                      </button>
                </form>
            </div>


            <div id="examwisereportforallexam" class="center wow fadeInDown" style="display:none;">

             <p><h3>Please Select the details from the following drop down list.</h3></p>
                 <form>
                        <div class="form-group">
                            <div class="row">
                                 <div class="col-md-4 col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                      <label for="sel31">School : </label>
                                      <select  class="input-large" id="sel31" >
                                      <option>school_id_1</option>
                                      </select>
                                 </div>

                                <div class="col-md-4 col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                      <label for="sel32">Class : </label>
                                      <select  class="input-large" id="sel32" >
                                      <option>V</option>
                                      <option>VI</option>
                                      </select>
                                </div>

                                <div class="col-md-4 col-sm-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                      <label for="sel33">Division : </label>
                                      <select  class="input-large" id="sel33" >
                                      <option>A</option>
                                      </select>
                                </div>

                            </div>
                      </div>
                      
                      <button type="button" name="submit" class="btn btn-primary btn-lg" required="required" onClick="getGraph('ExamwiseAllExam','sel31','sel32','sel33','sel34');">Get Me Report
                      </button>
                </form>
            </div>
       
    </section>

    
          <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                <div id="chart_div" class="center wow fadeInDown" ></div>
          </div> 
 
          <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-6">
                        <div id="piechart_div1" class="center wow fadeInDown" ></div>
                    </div>
                    <div class="col-xs-6">
                        <div id="piechart_div2" class="center wow fadeInDown" ></div>
                </div>
          </div>
  </div>

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