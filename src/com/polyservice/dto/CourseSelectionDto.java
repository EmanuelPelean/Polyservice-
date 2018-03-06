package com.polyservice.dto;

public class CourseSelectionDto {

	private String studentID;
	private String schoolAttending;
	private String programType;
	private String programNumber;
	private String licenseNum;
	private String segOneSchool;
	private String permitDate;
	private String inputHours;
	
	public String getSchoolAttending() {
		return schoolAttending;
	}
	public void setSchoolAttending(String schoolAttending) {
		this.schoolAttending = schoolAttending;
	}
	public String getProgramType() {
		return programType;
	}
	public void setProgramType(String programType) {
		this.programType = programType;
	}
	public String getProgramNumber() {
		return programNumber;
	}
	public void setProgramNumber(String programNumber) {
		this.programNumber = programNumber;
	}
	public String getLicenseNum() {
		return licenseNum;
	}
	public void setLicenseNum(String licenseNum) {
		this.licenseNum = licenseNum;
	}
	public String getSegOneSchool() {
		return segOneSchool;
	}
	public void setSegOneSchool(String segOneSchool) {
		this.segOneSchool = segOneSchool;
	}
	public String getPermitDate() {
		return permitDate;
	}
	public void setPermitDate(String permitDate) {
		this.permitDate = permitDate;
	}
	public String getInputHours() {
		return inputHours;
	}
	public void setInputHours(String inputHours) {
		this.inputHours = inputHours;
	}
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	@Override
	public String toString() {
		return "CourseSelectionDto [studentID=" + studentID + ", schoolAttending=" + schoolAttending + ", programType="
				+ programType + ", programNumber=" + programNumber + ", licenseNum=" + licenseNum + ", segOneSchool="
				+ segOneSchool + ", permitDate=" + permitDate + ", inputHours=" + inputHours + "]";
	}
	
}
