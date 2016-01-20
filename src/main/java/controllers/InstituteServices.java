package controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pojos.InstituteReport;
import pojos.LoginCredentials;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;

import daos.InstituteReportDAO;
import daos.ProgressReportDAO;


@Controller

@RequestMapping(value="/instituteservices")
public class InstituteServices {
	
	
	
	
	@RequestMapping(value = "/getClassWiseReportPage", method = RequestMethod.GET)
	public ModelAndView getClassWiseReportPage(HttpSession session, Model model){
		
		ModelAndView modelnview = new ModelAndView();
		
		LoginCredentials logincredential = (LoginCredentials) session.getAttribute("loggedInUser");
		
		if(logincredential!=null){
			modelnview.setViewName("classreport");
		}
		else{
			model.addAttribute("error", "Please, Login to get this feature...");
			modelnview.setViewName("index");
			
		}
		return modelnview;
	}
	

	@RequestMapping(value = "/getInstitutewiseReportPage", method = RequestMethod.GET)
	public ModelAndView getInstitutewiseReportPage(HttpSession session, Model model){
		
		ModelAndView modelnview = new ModelAndView();
		
		LoginCredentials logincredential = (LoginCredentials) session.getAttribute("loggedInUser");
		
		if(logincredential!=null){
			modelnview.setViewName("institutereport");
		}
		else{
			model.addAttribute("error", "Please, Login to get this feature...");
			modelnview.setViewName("index");
			
		}
		return modelnview;
	}
	


@RequestMapping(value="/getClasswiseReport", method = RequestMethod.GET)
	
	public @ResponseBody InstituteReport showClassReport(HttpServletRequest request){
	
	InstituteReport datatoclient=null;
	System.out.println("@inst cont");
	String schoolid = request.getParameter("schoolid");
	System.out.println(schoolid);
	
	String classname= request.getParameter("classname");
	System.out.println(classname);
	String division = request.getParameter("division");
	System.out.println(division);
	String  examname = request.getParameter("examname");
	System.out.println(examname);
	
	if((request.getParameter("type").trim()).equals("examwise"))
		datatoclient = (new InstituteReportDAO()).getExamwiseReport(schoolid, classname, division, examname);
		
	if((request.getParameter("type").trim()).equals("ExamwiseAllExam"))
	    datatoclient = (new InstituteReportDAO()).getExamwiseReportForAllExams(schoolid, classname, division);
	
	if((request.getParameter("type").trim()).equals("subjectwise"))
		datatoclient = (new InstituteReportDAO()).getSubjectwiseReport(schoolid, classname, division, examname);
		
				System.out.println(datatoclient.getRecordList().get(1).getSubject());
				System.out.println(datatoclient.getRecordList().get(1).getTotalobtained());
				System.out.println(datatoclient.getRecordList().get(1).getTotaloutoff());
				System.out.println(datatoclient.getRecordList().get(1).getStudentsappeared());
				System.out.println(datatoclient.getRecordList().get(1).getStudentspassed());
				System.out.println(datatoclient.getRecordList().get(1).getStudentfailed());
				System.out.println(datatoclient.getRecordList().size());
				//System.out.println
		return datatoclient;
	}

@RequestMapping(value="/getInstitutewiseReport", method= RequestMethod.GET)
public @ResponseBody InstituteReport showInstitutewiseReport(HttpServletRequest request){
	InstituteReport datatoclient=null;
	//all examinations across entire school
	if((request.getParameter("type").trim()).equals("ForAllExaminations")){
		String schoolid = request.getParameter("schoolid");
		System.out.println(schoolid);
		datatoclient = (new InstituteReportDAO()).getAllExaminationsAccrossEntireInstitute(schoolid.trim());
	}
	//FOR SELECTED EXAMINATION ACCROSS ALL CLASSES
	if((request.getParameter("type").trim()).equals("ForSelectedExamination")){
		String schoolid = request.getParameter("schoolid");
		String exam = request.getParameter("examname");
		System.out.println(schoolid+exam);
		datatoclient = (new InstituteReportDAO()).getReportForSelectedExaminationAccrossAllClasses(schoolid, exam);
	}
	//FOR SELECTED SUBJECT ACCROSS ALL EXAMINATIONS
	if((request.getParameter("type").trim()).equals("ForSelectedSubject")){
		String schoolid = request.getParameter("schoolid");
		String subject = request.getParameter("subject");
		System.out.println(schoolid+subject);
		datatoclient = (new InstituteReportDAO()).getReportForSelectedSubjectAccrossAllExaminations(schoolid, subject);
	}
	//FOR SELECTED SUBJECT & EXAMINATION ACCROSS ALL CLASSES
	if((request.getParameter("type").trim()).equals("ForSelectedExamAndSubject")){
		String schoolid= request.getParameter("schoolid");
		String subject =request.getParameter("subject");
		String examname= request.getParameter("examname");
		System.out.println(schoolid+subject+examname);
		datatoclient = (new InstituteReportDAO()).getForSelectedSubjectAndExamination(schoolid, subject, examname);
	}
	//return null;
	System.out.println(datatoclient.getSubject());
	System.out.println(datatoclient.getRecordList().get(1).getStd_class());
	System.out.println(datatoclient.getRecordList().get(1).getDivision());
	System.out.println(datatoclient.getRecordList().get(1).getTotalobtained());
	System.out.println(datatoclient.getRecordList().get(1).getTotaloutoff());
	System.out.println(datatoclient.getRecordList().get(1).getStudentsappeared());
	System.out.println(datatoclient.getRecordList().get(1).getStudentspassed());
	System.out.println(datatoclient.getRecordList().get(1).getStudentfailed());
	System.out.println(datatoclient.getRecordList().size());
	return datatoclient;
}



	
}
