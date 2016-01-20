package pojos;

import java.util.ArrayList;
import java.util.List;

public class Examination {

	 private String examName=null;
	 private List<Subject> subjects = new ArrayList<Subject>();
	 private float totalObtained = 0;
	 private float outOff = 0;
	 private float percentage =0;
	 
	
	 /*
	  * Getters and Setters
	  */
	 
	public float getTotalObtained() {
		return totalObtained;
	}
	public void setTotalObtained(float totalObtained) {
		this.totalObtained = totalObtained;
	}
	public float getOutOff() {
		return outOff;
	}
	public void setOutOff(float outOff) {
		this.outOff = outOff;
	}
	public float getPercentage() {
		return percentage;
	}
	public void setPercentage(float percentage) {
		this.percentage = percentage;
	}
	public List<Subject> getSubjects() {
		return subjects;
	}
	public void setSubjects(List<Subject> subjects) {
		this.subjects = subjects;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	
	 
	 
}
