package pojos;

public class Address {

		private String firstLine = null;
		private String secondLine  = null;
		private String city= null;
		private String state = null;
		private String country = null;
		private String pinCode = null;
		
		
		/*
		 * Getters and Setters
		 */
				
		public String getFirstLine() {
			return firstLine;
		}
		public String getPinCode() {
			return pinCode;
		}
		public void setPinCode(String pinCode) {
			this.pinCode = pinCode;
		}
		public void setFirstLine(String firstLine) {
			this.firstLine = firstLine;
		}
		public String getSecondLine() {
			return secondLine;
		}
		public void setSecondLine(String secondLine) {
			this.secondLine = secondLine;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getCountry() {
			return country;
		}
		public void setCountry(String country) {
			this.country = country;
		}
		
		
		
		
}
