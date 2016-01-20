package pojos;

public class InstExamwiseReport {

	private String subject=null;
	private String examname=null;
	private int studentsappeared=0;
	private int studentspassed=0;
	private int studentfailed=0;
	private float totalobtained=0;
	private float totaloutoff=0;
	private String std_class=null;
	private String division=null;
	
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
	public String getExamname() {
		return examname;
	}
	public void setExamname(String examname) {
		this.examname = examname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getStudentsappeared() {
		return studentsappeared;
	}
	public void setStudentsappeared(int studentsappeared) {
		this.studentsappeared = studentsappeared;
	}
	public int getStudentspassed() {
		return studentspassed;
	}
	public void setStudentspassed(int studentspassed) {
		this.studentspassed = studentspassed;
	}
	public int getStudentfailed() {
		return studentfailed;
	}
	public void setStudentfailed(int studentfailed) {
		this.studentfailed = studentfailed;
	}
	public float getTotalobtained() {
		return totalobtained;
	}
	public void setTotalobtained(float totalobtained) {
		this.totalobtained = totalobtained;
	}
	public float getTotaloutoff() {
		return totaloutoff;
	}
	public void setTotaloutoff(float totaloutoff) {
		this.totaloutoff = totaloutoff;
	}
	
}
