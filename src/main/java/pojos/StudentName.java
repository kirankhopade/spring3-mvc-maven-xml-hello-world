package pojos;

public class StudentName {

	private String firstName=null;
	private String middleName=null;
	private String lastName=null;
	private String fullName = null;
	
	/*
	 * Getters and Setters
	 */
	
	public String getFirstName() {
		return firstName;
	}
	public String getFullName() {
		return firstName+" "+middleName+" "+lastName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
}
