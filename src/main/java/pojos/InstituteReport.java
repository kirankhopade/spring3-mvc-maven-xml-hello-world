package pojos;

import java.util.ArrayList;

public class InstituteReport {

	private String schoolname=null;
	private String className=null;
	private String division=null;
	private String examination=null;
	private String subject=null;
	ArrayList <InstExamwiseReport> recordList = new ArrayList<InstExamwiseReport>(); 
	
	public ArrayList<InstExamwiseReport> getRecordList() {
		return recordList;
	}
	public void setRecordList(ArrayList<InstExamwiseReport> recordList) {
		this.recordList = recordList;
	}
	public String getSchoolname() {
		return schoolname;
	}
	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getExamination() {
		return examination;
	}
	public void setExamination(String examination) {
		this.examination = examination;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
}
