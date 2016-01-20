package daos;

import java.util.ArrayList;

import org.bson.Document;

import pojos.InstExamwiseReport;
import pojos.InstituteReport;
import static java.util.Arrays.asList;

import com.mongodb.Block;
import com.mongodb.MongoClient;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoDatabase;

public class InstituteReportDAO {

	
	 private MongoClient mongoClient=null;
	 private MongoDatabase db=null;
	
/*
 * Constructor
 */
	 public InstituteReportDAO(){
	 	 try{
	 			mongoClient = new MongoClient("localhost", 27017);
	 			db = mongoClient.getDatabase("progressreport");
	 	
	 		}catch(Exception e){
	 			e.printStackTrace();
	 		}
	 	 
	 	 

	  }
	 
	 
	/*
	 * 1) Get subject wise report for given exam for all subjects
	 */
	 
	 public InstituteReport getExamwiseReport(String schoolid,String classname,String division,String examname){

		 InstituteReport reportdata = new InstituteReport();
		 final ArrayList <InstExamwiseReport> recordList = new ArrayList<InstExamwiseReport>();
		 
		 System.out.println("from DAO"+schoolid+classname+division+examname);
		 
		 reportdata.setClassName(classname);
		 reportdata.setDivision(division);
		 reportdata.setExamination(examname);
		 reportdata.setSchoolname(schoolid);
		 reportdata.setSubject("null");
		 
		 ArrayList expression = new ArrayList();
	      expression.add("$examinations.subjects.obtainedNumbers");
	      expression.add("$examinations.subjects.passingNumbers");
	      
	      ArrayList gte = new ArrayList();
	      gte.add(new Document("$gte",expression));
	      gte.add(1);
	      gte.add(0);
	      
	      ArrayList lt = new ArrayList();
	      lt.add(new Document("$lt",expression));
	      lt.add(1);
	      lt.add(0);
	    
	      try{
	      AggregateIterable<Document> iterable = db.getCollection("studenprofile").aggregate(asList(
	    			new Document("$unwind","$examinations"),
					new Document("$match", new Document("schoolDetails.schoolID" , schoolid.trim()).append("std_class" , classname.trim()).append("division",division.trim()).append("examinations.examName",examname.trim())),
					new Document("$unwind","$examinations.subjects"),
					new Document("$group",new Document("_id",new Document("SchoolID","$schoolDetails.schoolID").append("Class", "$std_class").append("Division", "$division").append("Exam","$examinations.examName").append("Subject","$examinations.subjects.subjectName")).append("totalObtained", new Document("$sum","$examinations.subjects.obtainedNumbers")).append("totalOutoff", new Document("$sum","$examinations.subjects.maxNumbers")).append("StudentsAppeared", new Document("$sum", 1)).append("passed", new Document("$sum",new Document("$cond", gte))).append("failed", new Document("$sum",new Document("$cond",lt))))));
	 
	      
	      System.out.println("Query Executed....");
	     	      iterable.forEach(new Block<Document>() {
	    	    @Override
	    	    public void apply(final Document document) {
	    	    	
	    	    	InstExamwiseReport tempObject = new InstExamwiseReport();
	    	    	tempObject.setSubject(((Document)document.get("_id")).getString("Subject"));
	    	    	tempObject.setExamname("");
	    	    	tempObject.setTotalobtained(Float.parseFloat((document.get("totalObtained").toString())));
	    	    	tempObject.setTotaloutoff(Float.parseFloat((document.get("totalOutoff")).toString()));
	    	    	tempObject.setStudentsappeared(document.getInteger("StudentsAppeared"));
	    	    	tempObject.setStudentspassed(document.getInteger("passed"));
	    	    	tempObject.setStudentfailed(document.getInteger("failed"));
	    	    	
	    	    	recordList.add(tempObject);
	    	   // 	System.out.println("test"+tempObject.getSubject());
	    	    	/*System.out.println(((Document)document.get("_id")).getString("Subject"));
	    	    	System.out.println(document.getInteger("StudentsAppeared"));
	    	    	System.out.println(document.getInteger("passed"));
	    	    	System.out.println(document.getInteger("failed"));
	    	    	System.out.println(Float.parseFloat((document.get("totalObtained").toString())));
	    	    	System.out.println(Float.parseFloat((document.get("totalOutoff")).toString()));
	    	    	*/
	    	        System.out.println(document.toJson());
	    	    }
	    	});
	      
	      }catch(Exception e){ e.printStackTrace();}
	      
	      reportdata.setRecordList(recordList);
		 return reportdata;
	 }
	 
	 
	 public InstituteReport getSubjectwiseReport(String schoolid,String classname,String division,String subjectname){
	 
		 InstituteReport reportdata = new InstituteReport();
		 final ArrayList <InstExamwiseReport> recordList = new ArrayList<InstExamwiseReport>();
		 
		 System.out.println("from DAO"+schoolid+classname+division+subjectname);
		 
		 reportdata.setClassName(classname);
		 reportdata.setDivision(division);
		 reportdata.setExamination("");
		 reportdata.setSchoolname(schoolid);
		 reportdata.setSubject("null");
		 
		 ArrayList expression = new ArrayList();
	      expression.add("$examinations.subjects.obtainedNumbers");
	      expression.add("$examinations.subjects.passingNumbers");
	      
	      ArrayList gte = new ArrayList();
	      gte.add(new Document("$gte",expression));
	      gte.add(1);
	      gte.add(0);
	      
	      ArrayList lt = new ArrayList();
	      lt.add(new Document("$lt",expression));
	      lt.add(1);
	      lt.add(0);
	      
	      AggregateIterable<Document> iterable = db.getCollection("studenprofile").aggregate(asList(
	    			new Document("$unwind","$examinations"),
					new Document("$match", new Document("schoolDetails.schoolID" , schoolid.trim()).append("std_class" , classname.trim()).append("division",division.trim())),
					new Document("$unwind","$examinations.subjects"),
					new Document("$match",new Document("examinations.subjects.subjectName",subjectname.trim())),
					new Document("$group",new Document("_id",new Document("SchoolID","$schoolDetails.schoolID").append("Class", "$std_class").append("Division", "$division").append("Exam","$examinations.examName").append("Subject","$examinations.subjects.subjectName")).append("totalObtained", new Document("$sum","$examinations.subjects.obtainedNumbers")).append("totalOutoff", new Document("$sum","$examinations.subjects.maxNumbers")).append("StudentsAppeared", new Document("$sum", 1)).append("passed", new Document("$sum",new Document("$cond", gte))).append("failed", new Document("$sum",new Document("$cond",lt))))));
	      
	      
	      iterable.forEach(new Block<Document>() {
	    	    @Override
	    	    public void apply(final Document document) {
	    	
	    	    	InstExamwiseReport tempObject = new InstExamwiseReport();
	    	    	tempObject.setSubject(((Document)document.get("_id")).getString("Subject"));
	    	    	tempObject.setExamname(((Document)document.get("_id")).getString("Exam"));
	    	    	tempObject.setTotalobtained(Float.parseFloat((document.get("totalObtained").toString())));
	    	    	tempObject.setTotaloutoff(Float.parseFloat((document.get("totalOutoff")).toString()));
	    	    	tempObject.setStudentsappeared(document.getInteger("StudentsAppeared"));
	    	    	tempObject.setStudentspassed(document.getInteger("passed"));
	    	    	tempObject.setStudentfailed(document.getInteger("failed"));
	    	    	recordList.add(tempObject);
	    	    	
	    	        System.out.println(document.toJson());
	    	    }
	    	});
	
	      reportdata.setRecordList(recordList);
			 return reportdata;
	 }
	 
	 
	 public InstituteReport getExamwiseReportForAllExams(String schoolid,String classname,String division){
		 
		 InstituteReport reportdata = new InstituteReport();
		 final ArrayList <InstExamwiseReport> recordList = new ArrayList<InstExamwiseReport>();
		 
		 reportdata.setClassName(classname);
		 reportdata.setDivision(division);
		 reportdata.setExamination("");
		 reportdata.setSchoolname(schoolid);
		 reportdata.setSubject("");
		 
		 ArrayList expression = new ArrayList();
	      expression.add("$examinations.failed");
	      expression.add(0);
	      
	      ArrayList eq = new ArrayList();
	      eq.add(new Document("$eq",expression));
	      eq.add(1);
	      eq.add(0);
	      
	      ArrayList gt = new ArrayList();
	      gt.add(new Document("$gt",expression));
	      gt.add(1);
	      gt.add(0);
	      
	      AggregateIterable<Document> iterable = db.getCollection("studenprofile").aggregate(asList(
	    			new Document("$unwind","$examinations"),
					new Document("$match", new Document("schoolDetails.schoolID" , "school_id_1").append("std_class" , "V").append("division","A")),
					new Document("$group",new Document("_id",new Document("SchoolID","$schoolDetails.schoolID").append("Class", "$std_class").append("Division", "$division").append("Exam","$examinations.examName")).append("totalObtained", new Document("$sum","$examinations.totalObtained")).append("totalOutoff", new Document("$sum","$examinations.outOff")).append("StudentsAppeared", new Document("$sum", 1)).append("passed", new Document("$sum",new Document("$cond", eq))).append("failed", new Document("$sum",new Document("$cond",gt))))));
	      
	      
	      iterable.forEach(new Block<Document>() {
	    	    @Override
	    	    public void apply(final Document document) {
	    	
	    	    	InstExamwiseReport tempObject = new InstExamwiseReport();
	    	    	tempObject.setSubject("");
	    	    	tempObject.setExamname(((Document)document.get("_id")).getString("Exam"));
	    	    	tempObject.setTotalobtained(Float.parseFloat((document.get("totalObtained").toString())));
	    	    	tempObject.setTotaloutoff(Float.parseFloat((document.get("totalOutoff")).toString()));
	    	    	tempObject.setStudentsappeared(document.getInteger("StudentsAppeared"));
	    	    	tempObject.setStudentspassed(document.getInteger("passed"));
	    	    	tempObject.setStudentfailed(document.getInteger("failed"));
	    	    	recordList.add(tempObject);
	    	    	
	    	        System.out.println(document.toJson());
	    	    }
	    	});
	
	      reportdata.setRecordList(recordList);
			 return reportdata;
	 }
	 
	 
	 
	 /*
	  * 1) Examwise report for all examinations accross entire school [ FOR SELECTED SCHOOL ACCROSS AL EXAMINATIONS]
	  */
	 
	 public InstituteReport getAllExaminationsAccrossEntireInstitute(String schoolId){
		 
		 InstituteReport reportdata = new InstituteReport();
		 final ArrayList <InstExamwiseReport> recordList = new ArrayList<InstExamwiseReport>();
		 
		 
		  reportdata.setClassName("");
		  reportdata.setDivision("");
		  reportdata.setExamination("");
		  reportdata.setSchoolname(schoolId);
		  reportdata.setSubject("");
		
		 ArrayList expression = new ArrayList();
	      expression.add("$examinations.failed");
	      expression.add(0);
	      
	      ArrayList eq = new ArrayList();
	      eq.add(new Document("$eq",expression));
	      eq.add(1);
	      eq.add(0);
	      
	      ArrayList gt = new ArrayList();
	      gt.add(new Document("$gt",expression));
	      gt.add(1);
	      gt.add(0);
	      
	          AggregateIterable<Document> iterable = db.getCollection("studenprofile").aggregate(asList(
	    			new Document("$unwind","$examinations"),
					new Document("$match", new Document("schoolDetails.schoolID" , schoolId)),
					new Document("$group",new Document("_id",new Document("SchoolID","$schoolDetails.schoolID").append("Exam","$examinations.examName")).append("totalObtained", new Document("$sum","$examinations.totalObtained")).append("totalOutoff", new Document("$sum","$examinations.outOff")).append("StudentsAppeared", new Document("$sum", 1)).append("passed", new Document("$sum",new Document("$cond", eq))).append("failed", new Document("$sum",new Document("$cond",gt))))));
	                            
	          iterable.forEach(new Block<Document>() {
		    	    @Override
		    	    public void apply(final Document document) {
		    	
		    	    	InstExamwiseReport tempObject = new InstExamwiseReport();
		    	    	tempObject.setSubject("");
		    	    
		    	    	tempObject.setExamname(((Document)document.get("_id")).getString("Exam"));
		    	    	tempObject.setTotalobtained(Float.parseFloat((document.get("totalObtained").toString())));
		    	    	tempObject.setTotaloutoff(Float.parseFloat((document.get("totalOutoff")).toString()));
		    	    	tempObject.setStudentsappeared(document.getInteger("StudentsAppeared"));
		    	    	tempObject.setStudentspassed(document.getInteger("passed"));
		    	    	tempObject.setStudentfailed(document.getInteger("failed"));
		    	    	recordList.add(tempObject);
		    	    	
		    	        System.out.println(document.toJson());
		    	    }
		    	});
		       
	        //  reportdata.s
	          reportdata.setRecordList(recordList);
				 return reportdata;
		 //return null;
	 }
	 
	// for_selected_examination_accross_all_classes
	 /*
	  * 2) Classwise report for entire school for selected exam [ FOR SELECTED EXAMINATION ACCROSS ALL CLASSES ]
	  */
	 
	 public InstituteReport getReportForSelectedExaminationAccrossAllClasses(String schoolid,String examname){
		 
		 InstituteReport reportdata = new InstituteReport();
		 final ArrayList <InstExamwiseReport> recordList = new ArrayList<InstExamwiseReport>();
		 
		 reportdata.setClassName("");
		  reportdata.setDivision("");
		  reportdata.setExamination(examname);
		  reportdata.setSchoolname(schoolid);
		  reportdata.setSubject("");
		  
		 ArrayList expression = new ArrayList();
	      expression.add("$examinations.failed");
	      expression.add(0);
	      
	      ArrayList eq = new ArrayList();
	      eq.add(new Document("$eq",expression));
	      eq.add(1);
	      eq.add(0);
	      
	      ArrayList gt = new ArrayList();
	      gt.add(new Document("$gt",expression));
	      gt.add(1);
	      gt.add(0);
	      
	          AggregateIterable<Document> iterable = db.getCollection("studenprofile").aggregate(asList(
	    			new Document("$unwind","$examinations"),
					new Document("$match", new Document("schoolDetails.schoolID" , schoolid).append("examinations.examName",examname)),
					new Document("$group",new Document("_id",new Document("SchoolID","$schoolDetails.schoolID").append("Exam","$examinations.examName").append("Class", "$std_class").append("Division", "$division")).append("totalObtained", new Document("$sum","$examinations.totalObtained")).append("totalOutoff", new Document("$sum","$examinations.outOff")).append("StudentsAppeared", new Document("$sum", 1)).append("passed", new Document("$sum",new Document("$cond", eq))).append("failed", new Document("$sum",new Document("$cond",gt))))));
	                  
	     
	          iterable.forEach(new Block<Document>() {
		    	    @Override
		    	    public void apply(final Document document) {
		    	
		    	    	InstExamwiseReport tempObject = new InstExamwiseReport();
		    	    	tempObject.setSubject("");
		    	    	tempObject.setExamname(((Document)document.get("_id")).getString("Exam"));
		    	    	tempObject.setStd_class(((Document)document.get("_id")).getString("Class"));
		    	    	tempObject.setDivision(((Document)document.get("_id")).getString("Division"));
		    	    	tempObject.setTotalobtained(Float.parseFloat((document.get("totalObtained").toString())));
		    	    	tempObject.setTotaloutoff(Float.parseFloat((document.get("totalOutoff")).toString()));
		    	    	tempObject.setStudentsappeared(document.getInteger("StudentsAppeared"));
		    	    	tempObject.setStudentspassed(document.getInteger("passed"));
		    	    	tempObject.setStudentfailed(document.getInteger("failed"));
		    	    	recordList.add(tempObject);
		    	    	
		    	        System.out.println(document.toJson());
		    	    }
		    	});
		       
	          reportdata.setRecordList(recordList);
				 return reportdata;
	//	 return null;
	 }
	 
	 /*
	  * 3) Examwise report for entire school for selected subject [ FOR SELECTED SUBJECT ACCROSS ALL EXAMINATIONS]
	  */
	 
	 public InstituteReport getReportForSelectedSubjectAccrossAllExaminations(String schoolid,String subject){
		 
		 InstituteReport reportdata = new InstituteReport();
		 final ArrayList <InstExamwiseReport> recordList = new ArrayList<InstExamwiseReport>();
		 
		 reportdata.setClassName("");
		  reportdata.setDivision("");
		  reportdata.setExamination("");
		  reportdata.setSchoolname(schoolid);
		  reportdata.setSubject(subject);
		      ArrayList expression = new ArrayList();
		      expression.add("$examinations.subjects.obtainedNumbers");
		      expression.add("$examinations.subjects.passingNumbers");
		      
		      ArrayList gte = new ArrayList();
		      gte.add(new Document("$gte",expression));
		      gte.add(1);
		      gte.add(0);
		      
		      ArrayList lt = new ArrayList();
		      lt.add(new Document("$lt",expression));
		      lt.add(1);
		      lt.add(0);
		       AggregateIterable<Document> iterable = db.getCollection("studenprofile").aggregate(asList(
		    		   new Document("$unwind","$examinations"),
		    		   new Document("$match",new Document("schoolDetails.schoolID" , schoolid)),
		    		   new Document("$unwind","$examinations.subjects"),
		    		   new Document("$match", new Document("examinations.subjects.subjectName",subject)),
		    		   new Document("$group",new Document("_id",new Document("SchoolID" , "school_id_1").append("Exam","$examinations.examName").append("Subject","$examinations.subjects.subjectName")).append("totalObtained", new Document("$sum","$examinations.subjects.obtainedNumbers")).append("totalOutoff", new Document("$sum","$examinations.subjects.maxNumbers")).append("StudentsAppeared", new Document("$sum", 1)).append("passed", new Document("$sum",new Document("$cond", gte))).append("failed", new Document("$sum",new Document("$cond",lt))))));
		    
		       iterable.forEach(new Block<Document>() {
		    	    @Override
		    	    public void apply(final Document document) {
		    	
		    	    	InstExamwiseReport tempObject = new InstExamwiseReport();
		    	    	tempObject.setSubject("");
		    	    	tempObject.setExamname(((Document)document.get("_id")).getString("Exam"));
		    	    	//tempObject.setStd_class(((Document)document.get("_id")).getString("Class"));
		    	    	//tempObject.setDivision(((Document)document.get("_id")).getString("Division"));
		    	    //	tempObject.setSubject(subject);
		    	    	tempObject.setTotalobtained(Float.parseFloat((document.get("totalObtained").toString())));
		    	    	tempObject.setTotaloutoff(Float.parseFloat((document.get("totalOutoff")).toString()));
		    	    	tempObject.setStudentsappeared(document.getInteger("StudentsAppeared"));
		    	    	tempObject.setStudentspassed(document.getInteger("passed"));
		    	    	tempObject.setStudentfailed(document.getInteger("failed"));
		    	    	recordList.add(tempObject);
		    	    	
		    	        System.out.println(document.toJson());
		    	    }
		    	});
		 
		       reportdata.setRecordList(recordList);
				 return reportdata;
		       // return null;
	 }
	 
	 /*
	  * 4) [ FOR SELECTED SUBJECT & EXAMINATION ACCROSS ALL CLASSES]
	  */
	 
	  public InstituteReport getForSelectedSubjectAndExamination(String schoolid, String subject,String examname){
		  
		  InstituteReport reportdata = new InstituteReport();
			 final ArrayList <InstExamwiseReport> recordList = new ArrayList<InstExamwiseReport>();
			 
			 reportdata.setClassName("");
			  reportdata.setDivision("");
			  reportdata.setExamination(examname);
			  reportdata.setSchoolname(schoolid);
			  reportdata.setSubject(subject);
			 
		  
		  ArrayList expression = new ArrayList();
	      expression.add("$examinations.subjects.obtainedNumbers");
	      expression.add("$examinations.subjects.passingNumbers");
	      
	      ArrayList gte = new ArrayList();
	      gte.add(new Document("$gte",expression));
	      gte.add(1);
	      gte.add(0);
	      
	      ArrayList lt = new ArrayList();
	      lt.add(new Document("$lt",expression));
	      lt.add(1);
	      lt.add(0);
	      
	      
	      AggregateIterable<Document> iterable = db.getCollection("studenprofile").aggregate(asList(
	    		  new Document("$unwind","$examinations"),
	    		  new Document("$match",new Document("schoolDetails.schoolID" , schoolid).append("examinations.examName",examname)),
	    		  new Document("$unwind","$examinations.subjects"),
	    		  new Document("$match",new Document("examinations.subjects.subjectName",subject)),
	    		  new Document("$group",new Document("_id",new Document("SchoolID" , "school_id_1").append("Exam","$examinations.examName").append("Subject","$examinations.subjects.subjectName").append("Class", "$std_class").append("Division", "$division")).append("totalObtained", new Document("$sum","$examinations.subjects.obtainedNumbers")).append("totalOutoff", new Document("$sum","$examinations.subjects.maxNumbers")).append("StudentsAppeared", new Document("$sum", 1)).append("passed", new Document("$sum",new Document("$cond", gte))).append("failed", new Document("$sum",new Document("$cond",lt))))));
	       
	      iterable.forEach(new Block<Document>() {
	    	    @Override
	    	    public void apply(final Document document) {
	    	
	    	    	InstExamwiseReport tempObject = new InstExamwiseReport();
	    	    	tempObject.setSubject("");
	    	    	tempObject.setExamname(((Document)document.get("_id")).getString("Exam"));
	    	    	tempObject.setStd_class(((Document)document.get("_id")).getString("Class"));
	    	    	tempObject.setDivision(((Document)document.get("_id")).getString("Division"));
	    	    //	tempObject.setSubject(subject);
	    	    	tempObject.setTotalobtained(Float.parseFloat((document.get("totalObtained").toString())));
	    	    	tempObject.setTotaloutoff(Float.parseFloat((document.get("totalOutoff")).toString()));
	    	    	tempObject.setStudentsappeared(document.getInteger("StudentsAppeared"));
	    	    	tempObject.setStudentspassed(document.getInteger("passed"));
	    	    	tempObject.setStudentfailed(document.getInteger("failed"));
	    	    	recordList.add(tempObject);
	    	    	
	    	        System.out.println(document.toJson());
	    	    }
	    	});
	 
	       reportdata.setRecordList(recordList);
			 return reportdata;
	
		  
	//	  return null;
	  }
	 
	 
	 }
	 
	 
	 

