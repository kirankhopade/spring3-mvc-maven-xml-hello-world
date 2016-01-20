package pojos;

import java.util.ArrayList;
import java.util.List;


public class StudentProfile {
	
	private String _id = null;
	private String password=null;
	private StudentName studentName = new StudentName();
	private SchoolDetails schoolDetails = new SchoolDetails();
	private String std_class=null;
	private String division=null;
	private String rollNo=null;
	private String parentEmail=null;
	private String contactDetails = null;
	private List<Examination> examinations = new ArrayList<Examination>();
	
	/*
	 * Getters and Setters
	 */
	
	public String get_id() {
		return _id;
	}
	
	public String getContactDetails() {
		return contactDetails;
	}

	public void setContactDetails(String contactDetails) {
		this.contactDetails = contactDetails;
	}

	public void set_id(String _id) {
		this._id = _id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public StudentName getStudentName() {
		return studentName;
	}
	public void setStudentName(StudentName studentName) {
		this.studentName = studentName;
	}
	public SchoolDetails getSchoolDetails() {
		return schoolDetails;
	}
	public void setSchoolDetails(SchoolDetails schoolDetails) {
		this.schoolDetails = schoolDetails;
	}
	public String getStd_class() {
		return std_class;
	}
	public void setStd_class(String std_class) {
		this.std_class = std_class;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
	public String getParentEmail() {
		return parentEmail;
	}
	public void setParentEmail(String parentEmail) {
		this.parentEmail = parentEmail;
	}
	
	public List<Examination> getExaminations() {
		return examinations;
	}
	public void setExaminations(ArrayList<Examination> examinations) {
		this.examinations = examinations;
	}
	
	
	
	 
	
	 
	public String objectString(){
		return this._id+""+this.studentName.getFirstName()+""+this.schoolDetails.getAddress().getState()+""+this.contactDetails+""+this.examinations.get(0).getSubjects().get(0).getSubjectName();
	}
}
