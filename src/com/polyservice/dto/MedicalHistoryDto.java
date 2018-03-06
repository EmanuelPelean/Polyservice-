package com.polyservice.dto;

public class MedicalHistoryDto {

	private String studentID;
	private String accommodations;
	private String medication;
	private String disability;
	private String seizure;
	private String driveStatus;
	
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getAccommodations() {
		return accommodations;
	}
	public void setAccommodations(String accommodations) {
		this.accommodations = accommodations;
	}
	public String getMedication() {
		return medication;
	}
	public void setMedication(String medication) {
		this.medication = medication;
	}
	public String getDisability() {
		return disability;
	}
	public void setDisability(String disability) {
		this.disability = disability;
	}
	public String getSeizure() {
		return seizure;
	}
	public void setSeizure(String seizure) {
		this.seizure = seizure;
	}
	public String getDriveStatus() {
		return driveStatus;
	}
	public void setDriveStatus(String driveStatus) {
		this.driveStatus = driveStatus;
	}
}
