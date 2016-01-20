/*
 * Author : Kiran
 * Contains code for :
 * 1. Document(retrieved on successful login) is mapped to a studentProfile Object
 */

package daos;

import pojos.StudentProfile;
import org.bson.Document;
import org.codehaus.jackson.map.ObjectMapper;


public class StudentProfileDAO {

	
	private StudentProfile studentProfile = null;
	private Document document=null;

	/*
	 * Constructor
	 */
	public StudentProfileDAO(Document record){
		this.document=record;
		this.studentProfile = new StudentProfile();
				
		try {
				ObjectMapper mapper = new ObjectMapper();
				studentProfile = mapper.readValue(document.toJson(), StudentProfile.class);
			} catch (Exception e) {
					System.out.println("Conversion Exception  "+e);
			}
		
	}
	
	/*
	 * Getters/Setters
	 */
	
	public StudentProfile getStudentProfile() {
		return studentProfile;
	}
	public void setStudentProfile(StudentProfile studentProfile) {
		this.studentProfile = studentProfile;
	}
	
}
