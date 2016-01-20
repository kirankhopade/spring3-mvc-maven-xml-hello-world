/*
 * Author:Kiran
 * This Controller handles all service related requests from the clients and sends corresponding results
 */

package controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bson.Document;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;










import daos.LoginDAO;
import daos.ProgressReportDAO;
import daos.StudentProfileDAO;
import pojos.ExamWiseReport;
import pojos.LoginCredentials;
import pojos.StudentProfile;




import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



@Controller
@RequestMapping(value="/studentservices")
public class StudentServices {

	 /*@Autowired
	    private JavaMailSender mailSender;*/

	private Document studentRecord = null; // Document- holds entire student document from DB 
	StudentProfile studentprofile = null;  // Object- parses studentRecord document and stores data in object
	
	/*
	 * This method receives student_id and password, validates it and based on validation results,
	 *  returns success or error message
	 */
	
	@RequestMapping(value="/verifyLogin", method=RequestMethod.POST)
	public ModelAndView verifyLogin(@ModelAttribute ("logindata") LoginCredentials logindata, HttpSession session, Model model,HttpServletRequest request){
	
		ModelAndView modelnview = new ModelAndView();
		
		/* LoginDAO to perform CRUD operations on LoginCredentials object data */
		LoginDAO dao=new LoginDAO(logindata); //contains student_id and password entered by user
		
		/* Validate Entered Student_ID and Password and return status*/
		if(dao.validateCredentials()){
			
		    session.setAttribute("logintype", request.getParameter("optradio"));
			session.setAttribute("loggedInUser", logindata);
			model.addAttribute("success", "Login Successful!!!!"); // set success message to display on successful login
			if(session.getAttribute("logintype").equals("facultysignin"))
				model.addAttribute("facultysignin", "Faculty Signed In");
			else
				model.addAttribute("parentsignin", "Parent/Student Signed In");
			studentRecord= dao.getStudentRecord(); // get student document from database
			studentprofile = (new StudentProfileDAO(studentRecord)).getStudentProfile(); // parse studentDocument and stores in studentprofile object
		}
		else{
			model.addAttribute("error", "Login Failed!!!!"); // set login failed message to display on wrong login credentials
		}
			
			modelnview.setViewName("index"); // redirect the index page to client
			return modelnview;
	}
	
	
	/*
	 * This method returns student profile if user has signed in otherwise returns error message
	 */
	
	@RequestMapping(value = "/getStudentProfile", method = RequestMethod.GET)
	public ModelAndView getStudentProfile(HttpSession session, Model model){
		
		ModelAndView modelnview = new ModelAndView();
		
		LoginCredentials logincredential = (LoginCredentials) session.getAttribute("loggedInUser"); //capture login session to verify user has logged in
		
		if(logincredential!=null){
			modelnview.addObject("studentprofile",studentprofile); // set StudentProfile on jsp
				String str = (String)session.getAttribute("updateRequestStatus");
			if(str!=null){
				System.out.println("Update Request Received");
				model.addAttribute("success", "Your Update Request will be processed soon. Thank You..");
				session.removeAttribute("updateRequestStatus");
			}
			
			modelnview.setViewName("std_profile"); // redirect to std_profile page 
		}
		else{
			model.addAttribute("error", "Please, Login to get this feature..."); // if user has not logged in then set "Please, Login to get this feature..." message
			modelnview.setViewName("index");  // if user has not logged in then redirect to login page			
		}
		return modelnview;
	}
	
	
	/*
	 * This method redirects user to Progress Report page from another page if logged in otherwise redirects to login page
	 */
	
	@RequestMapping(value = "/getProgressReport", method = RequestMethod.GET)
	public ModelAndView getProgressReport(HttpSession session, Model model){
		
		ModelAndView modelnview = new ModelAndView();
		
		LoginCredentials logincredential = (LoginCredentials) session.getAttribute("loggedInUser");
		
		if(logincredential!=null){
			modelnview.setViewName("services");
		}
		else{
			model.addAttribute("error", "Please, Login to get this feature...");
			modelnview.setViewName("index");
			
		}
		return modelnview;
	}
	
	
	/*
	 * This method returns attendance data if user has signed in otherwise returns error message
	 */
	
	@RequestMapping(value = "/getAttendenceReport", method = RequestMethod.GET)
	public ModelAndView getAttendenceReport(HttpSession session, Model model){
		
		ModelAndView modelnview = new ModelAndView();
		
		LoginCredentials logincredential = (LoginCredentials) session.getAttribute("loggedInUser");
		
		if(logincredential!=null){
		
			/*
			 * Business Logic to get Attendance Report Data
			 */
				
	
			if(session.getAttribute("logintype").equals("facultysignin"))
				model.addAttribute("facultysignin", "Faculty Signed In");
			else
				model.addAttribute("parentsignin", "Parent/Student Signed In");
			modelnview.setViewName("attendence");
			
		}
		else{
			model.addAttribute("error", "Please, Login to get this feature...");
			modelnview.setViewName("index");
			
		}
		return modelnview;
	}
	
	/*
	 * This method returns notifications if user has signed in otherwise returns error message
	 */
	
	@RequestMapping(value = "/getNotifications", method = RequestMethod.GET)
	public ModelAndView getNotifications(HttpSession session, Model model){
		
		ModelAndView modelnview = new ModelAndView();
		
		LoginCredentials logincredential = (LoginCredentials) session.getAttribute("loggedInUser");
		
		if(logincredential!=null){
		
			/*
			 * Business Logic to get Attendance Report Data
			 */
			if(session.getAttribute("logintype").equals("facultysignin"))
				model.addAttribute("facultysignin", "Faculty Signed In");
			else
				model.addAttribute("parentsignin", "Parent/Student Signed In");
			modelnview.setViewName("notification");
			
		}
		else{
			model.addAttribute("error", "Please, Login to get this feature...");
			modelnview.setViewName("index");
			
		}
		return modelnview;
	}
	
	/*
	 * This method collects data from Contact Us page and stored into the database
	 */
	
	@RequestMapping(value = "/getContactUs", method = RequestMethod.GET)
	public ModelAndView getContactUs(HttpSession session, Model model){
		
		ModelAndView modelnview = new ModelAndView();
		
		LoginCredentials logincredential = (LoginCredentials) session.getAttribute("loggedInUser");
		
		if(logincredential!=null){
		
			/*
			 * Business Logic to get Attendance Report Data
			 */
			if(session.getAttribute("logintype").equals("facultysignin"))
				model.addAttribute("facultysignin", "Faculty Signed In");
			else
				model.addAttribute("parentsignin", "Parent/Student Signed In");
			modelnview.setViewName("notification");
			//modelnview.setViewName("attendence");
			modelnview.setViewName("contact-us");
			
		}
		else{
			model.addAttribute("error", "Please, Login to get this feature...");
			modelnview.setViewName("index");
			
		}
		return modelnview;
	}
	
	
	/*
	 * This method is called from Progress Report Page (AJAX CALL). This ajax call will get the list of exams or List of subjects 
	 * based on input parameter "type". 
	 * If type="exam" : The list of exams attained by student will be returned to user.
	 * If type="subject" : The list of subjects for which student has written the exam will be returned. 
	 */
	
	@RequestMapping(value="/getSelectDropDownList", method = RequestMethod.GET)
	
	public @ResponseBody ArrayList <String> showSubjectWiseReport(HttpServletRequest request){
		
		ArrayList <String> list =null;
				
		if(request.getParameter("type").equals("exam"))
			 list= ( new ProgressReportDAO(studentprofile)).getExamList(); 
		if(request.getParameter("type").equals("subject"))
			list = (new ProgressReportDAO(studentprofile)).getSubjectList();

		return list;
	}
	
	
	/*
	 * This method is called from Progress Report Page (AJAX CALL) on "Get Me Report" button click
	 * This method collects data to draw a graph on browser.
	 * If type="exam" : The data for a selected exam (variable 'value') will be sent to browser.
	 * If type="subject" : The data  for a selected subject (variable 'value') across entire academic year will be sent to user.
	 * If type="academicYear" : The percentage data of all examinations for the current academic years will be sent to user.
	 */
	
@RequestMapping(value="/getGraphData", method = RequestMethod.GET)
	
	public @ResponseBody ArrayList <ExamWiseReport> getGraphData(HttpServletRequest request){
		
			
		ArrayList <ExamWiseReport> list =null;
		if(request.getParameter("type").equals("exam")){
			list = (new ProgressReportDAO(studentprofile)).getExamWiseReport(request.getParameter("value"));
			return (list);
		}
		
		if(request.getParameter("type").equals("subject")){
			 list = (new ProgressReportDAO(studentprofile)).getSubjectWiseReport(request.getParameter("value"));
			return list;
		}
		if(request.getParameter("type").equals("academicYear")){
			list = (new ProgressReportDAO(studentprofile)).getAcademicYearWiseReport();
			return (list);
		}
		return null;
		
	}

	/*
	 * This method receives a request to update profile data and sends a current data to user.
	 */

	@RequestMapping(value="getProfileToUpdate", method= RequestMethod.GET)
	public ModelAndView getProfileToUpdate(HttpSession session, Model model){
		
		ModelAndView modelnview = new ModelAndView();
		
		LoginCredentials logincredential = (LoginCredentials) session.getAttribute("loggedInUser");
		
		if(logincredential!=null){
		
			modelnview.addObject("studentprofile",studentprofile);
				
			modelnview.setViewName("EnterRecord");
			
		}
		else{
			model.addAttribute("error", "Please, Login to get this feature...");
			modelnview.setViewName("index");
			
		}
		return modelnview;
	}
	
	
	@RequestMapping(value="getDataToUpdate", method= RequestMethod.POST)
	public String getDataToUpdate(HttpSession session, HttpServletRequest request){
		
		System.out.println("reached @getDataToUpdate()");
	
		LoginCredentials logincredential = (LoginCredentials) session.getAttribute("loggedInUser");
		
		System.out.println("from get data to update : "+request.getParameter("firstname"));
		System.out.println(request.getContentLength());
		//System.out.println(request.getAttributeNames().);
		//System.out.println(request.);
		if(logincredential!=null){
			
			
			String value=null;
			
			if(!(value=request.getParameter("firstname")).isEmpty()){
			System.out.println("changed"+value);
			}
			if(!(value=request.getParameter("middlename")).isEmpty()){
				System.out.println("changed"+value);
			}
			if(!(value=request.getParameter("lastname")).isEmpty()){
				System.out.println("changed"+value);
			}
			if(!(value=request.getParameter("schoolname")).isEmpty()){
				System.out.println("changed"+value);
			}
			if(!(value=request.getParameter("firstline")).isEmpty()){	
				System.out.println("changed"+value);
				}
			if(!(value=request.getParameter("secondline")).isEmpty()){	
				System.out.println("changed"+value);
				}
			if(!(value=request.getParameter("city")).isEmpty()){
				System.out.println("changed"+value);
				}
			if(!(value=request.getParameter("state")).isEmpty()){	System.out.println("changed"+value);}
			if(!(value=request.getParameter("country")).isEmpty()){	System.out.println("changed"+value);}
			if(!(value=request.getParameter("pincode")).isEmpty()){	System.out.println("changed"+value);}
			if(!(value=request.getParameter("std_class")).isEmpty()){	System.out.println("changed"+value);}
			if(!(value=request.getParameter("division")).isEmpty()){	System.out.println("changed"+value);}
			if(!(value=request.getParameter("rollno")).isEmpty()){	System.out.println("changed"+value);}
			if(!(value=request.getParameter("contactno")).isEmpty()){	System.out.println("changed"+value);}
			if(!(value=request.getParameter("email")).isEmpty()){	System.out.println("changed"+value);}
			
			
			
		}
		
		//getStudentProfile(session, null);
		session.setAttribute("updateRequestStatus", "true");
		return "redirect:/studentservices/getStudentProfile";
}
	
	
	 @RequestMapping(value="/sendmail" , method = RequestMethod.POST)
	    public String doSendEmail(HttpServletRequest request) {
	        // takes input from e-mail form
	    	
	    	String name = request.getParameter("name");
	        String snederAddress = request.getParameter("email");
	        String phoneNumber = request.getParameter("number");
	        
	        String subject = request.getParameter("subject");
	        //String message = request.getParameter("message");
	         
	       // Recipient's email ID needs to be mentioned.
	        String to = snederAddress+",kkhopade007@gmail.com";

	        // Sender's email ID needs to be mentioned
	        String from = "kkhopade007@gmail.com";
	        final String username = "kkhopade007@gmail.com";//change accordingly
	        final String password = "gskkr@96@kuli";//change accordingly

	      
	        Properties props = new Properties();
	       
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.socketFactory.port", "465");
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.port", "465");
	        
	        System.out.println("mailtest");
	        // Get the Session object.
	        Session session = Session.getInstance(props,
	           new javax.mail.Authenticator() {
	              protected PasswordAuthentication getPasswordAuthentication() {
	                 return new PasswordAuthentication(username, password);
	  	   }
	           });

	        try {
	  	   // Create a default MimeMessage object.
	  	   Message message = new MimeMessage(session);
	  	
	  	   // Set From: header field of the header.
	  	   message.setFrom(new InternetAddress(from));
	  	
	  	   // Set To: header field of the header.
	  	   message.setRecipients(Message.RecipientType.TO,
	                 InternetAddress.parse(to));
	  	
	  	   // Set Subject: header field
	  	   message.setSubject("Info: Received your message");
	  	
	  	   // Now set the actual message
	  	   message.setText("Hello "+name+", \r\n Thank you for your message. We will act on it and let you know our actions on your message. \r\n Team,\r\n P.R. Solutions");

	  	   // Send message
	  	   Transport.send(message);

	  	   System.out.println("Sent message successfully....");

	        } catch (MessagingException e) {
	           throw new RuntimeException(e);
	        }
	        
	        
	        return "Result";
	    }
	
	
}
