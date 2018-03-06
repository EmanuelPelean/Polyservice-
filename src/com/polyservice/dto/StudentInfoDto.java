package com.polyservice.dto;

public class StudentInfoDto {

	private String studentID;
	private String email;
	private String firstName;
	private String middleName;
	private String lastName;
	private String address;
	private String aptNum;
	private String city;
	private String state;
	private String zip;
	private String birth_date;
	private String exact_age;
	private String gender;
	private String phoneHome;
	private String phoneStudent;
	
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstName() {
		return firstName;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAptNum() {
		return aptNum;
	}
	public void setAptNum(String aptNum) {
		this.aptNum = aptNum;
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
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	public String getExact_age() {
		return exact_age;
	}
	public void setExact_age(String exact_age) {
		this.exact_age = exact_age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getPhoneStudent() {
		return phoneStudent;
	}
	public void setPhoneStudent(String phoneStudent) {
		this.phoneStudent = phoneStudent;
	}
	
	public String getPhoneHome() {
		return phoneHome;
	}
	public void setPhoneHome(String phoneHome) {
		this.phoneHome = phoneHome;
	}
	@Override
	public String toString() {
		return "StudentInfoDto [studentID=" + studentID + ", email=" + email + ", firstName=" + firstName
				+ ", middleName=" + middleName + ", lastName=" + lastName + ", address=" + address + ", aptNum="
				+ aptNum + ", city=" + city + ", state=" + state + ", zip=" + zip + ", birth_date=" + birth_date
				+ ", exact_age=" + exact_age + ", gender=" + gender + ", honeHome=" + phoneHome + ", phoneStudent="
				+ phoneStudent + "]";
	}
}
