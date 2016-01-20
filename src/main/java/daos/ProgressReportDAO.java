/*
 * Author : Kiran
 * Contains code for :
 * 1. To send Exam List to client
 * 2. To send Subject List to client
 * 3. To send Exam wise Progress report data
 * 4. To send subject wise progress report data 
 * 
 * NOTE : SAME OBJECT (ExamWiseReport) IS USED TO SEND EXAM WISE DATA ANS SUBJECT WISE DATA
 */
package daos;

import java.util.ArrayList;

import pojos.ExamWiseReport;
import pojos.StudentProfile;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import pojos.Subject;

public class ProgressReportDAO {

	StudentProfile studentProfile = null; // Reference to a Student Profile object
	
	ArrayList<ExamWiseReport> examWiseReport = null; // to send examwise progress report data (for selected exam)
	ArrayList<ExamWiseReport> subjectWiseReport = null;  // to send subjectwise progress report
	ArrayList<ExamWiseReport> academicYearWiseReport = null; // to send  academic year progress report for all exams
	
	/*
	 * Constructor
	 */
	public ProgressReportDAO(StudentProfile profile){
		this.studentProfile = profile;
		examWiseReport = new ArrayList<ExamWiseReport>();
		subjectWiseReport = new ArrayList<ExamWiseReport>();
		academicYearWiseReport = new ArrayList<ExamWiseReport>();
	}
	
	public ArrayList<ExamWiseReport> getAcademicYearWiseReport(){
		
		setAcademicYearWiseReport();
		return academicYearWiseReport;
	} 
	
	private void setAcademicYearWiseReport(){
		
		for(int i=0;i<studentProfile.getExaminations().size();i++){
			
			ExamWiseReport object =  new ExamWiseReport();
			object.setSubjectName(studentProfile.getExaminations().get(i).getExamName()+" ("+studentProfile.getExaminations().get(i).getPercentage()+")");
			object.setMarks(studentProfile.getExaminations().get(i).getPercentage());
			this.academicYearWiseReport.add(object);
		}
	}
	
	
	/*
	 * Returns subject wise progress report data.
	 */
	public ArrayList<ExamWiseReport> getSubjectWiseReport(String subjectName) {
		setSubjectWiseReport(subjectName);
		return subjectWiseReport;
	}	
	
	/*
	 * Prepares Subject Wise progress report data
	 */
	private void setSubjectWiseReport(String subjectName) {
		
		
		for(int i=0;i<studentProfile.getExaminations().size();i++){
			
			List<Subject> subjects = studentProfile.getExaminations().get(i).getSubjects();
				
				for(int j=0;j<subjects.size();j++){
				
					if(subjectName.equals(subjects.get(j).getSubjectName())){
						ExamWiseReport object =  new ExamWiseReport();
						object.setSubjectName(studentProfile.getExaminations().get(i).getExamName()+" ("+subjects.get(j).getObtainedNumbers()+")");
						object.setMarks(subjects.get(j).getObtainedNumbers());
						this.subjectWiseReport.add(object);
					}
			}
		}
				
	}

	
	/*
	 * Returns Exams wise progress report data.
	 */
	
	public ArrayList<ExamWiseReport> getExamWiseReport(String examName) {
		setExamWiseReport(examName);
		return examWiseReport;
	}
	/*
	 * Prepares Exam wise progress report data.
	 */
	public void setExamWiseReport(String examName) {
		
		float obtainedtotal=0;
		float maxTotal=0;
		
			for(int i=0;i<studentProfile.getExaminations().size();i++){
			
				if(examName.equals(studentProfile.getExaminations().get(i).getExamName())){
				
					List<Subject> subjects = studentProfile.getExaminations().get(i).getSubjects();
					
					for(int j=0;j<subjects.size();j++){
						ExamWiseReport object =  new ExamWiseReport();
						object.setSubjectName(subjects.get(j).getSubjectName()+" ("+subjects.get(j).getObtainedNumbers()+")");
						object.setMarks(subjects.get(j).getObtainedNumbers());
						obtainedtotal = obtainedtotal+subjects.get(j).getObtainedNumbers();
						maxTotal = maxTotal+subjects.get(j).getMaxNumbers();
						this.examWiseReport.add(object);
					
					}
				}
		}
		
			ExamWiseReport object1 =  new ExamWiseReport();
			object1.setSubjectName("obtainedtotal");
			object1.setMarks(obtainedtotal);
			ExamWiseReport object2 =  new ExamWiseReport();
			object2.setSubjectName("maxtotal");
			object2.setMarks(maxTotal);
			examWiseReport.add(object1);
			examWiseReport.add(object2);
	}


	/*
	 * Returns Exams List
	 */

	public ArrayList<String> getExamList(){
		ArrayList<String> examList= new ArrayList<String>();
		
		for(int i=0;i<studentProfile.getExaminations().size();i++){
			
			examList.add(studentProfile.getExaminations().get(i).getExamName());
		}
		
		return examList;
	}
	
	/*
	 * Returns Subjects List (Sorted)
	 */
	
	public ArrayList<String> getSubjectList(){
		Set <String> subjectList = new HashSet<String>();
		
		for(int i=0;i<studentProfile.getExaminations().size();i++){
			
			List<Subject> subjects = studentProfile.getExaminations().get(i).getSubjects();
			
			for(int j=0;j<subjects.size();j++){
				subjectList.add(subjects.get(j).getSubjectName());
			}
		}
		
		TreeSet<String> sorteSubjectList = new TreeSet<String>(subjectList);
		
		return new ArrayList<String>(sorteSubjectList);
	}
}

