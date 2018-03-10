package com.polyservice.dto;

import java.io.Serializable;

public class GuardianInfoDto implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String studentID;
	private String marketing;
	private String guardianName;
	private String guardianAddress;
	private String guardianApt;
	private String guardianCity;
	private String guardianState;
	private String guardianZip;
	private String guardianPhone;
	
	public String getMarketing() {
		return marketing;
	}
	public void setMarketing(String marketing) {
		this.marketing = marketing;
	}
	public String getGuardianName() {
		return guardianName;
	}
	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
	}
	public String getGuardianAddress() {
		return guardianAddress;
	}
	public void setGuardianAddress(String guardianAddress) {
		this.guardianAddress = guardianAddress;
	}
	public String getGuardianApt() {
		return guardianApt;
	}
	public void setGuardianApt(String guardianApt) {
		this.guardianApt = guardianApt;
	}
	public String getGuardianCity() {
		return guardianCity;
	}
	public void setGuardianCity(String guardianCity) {
		this.guardianCity = guardianCity;
	}
	public String getGuardianState() {
		return guardianState;
	}
	public void setGuardianState(String guardianState) {
		this.guardianState = guardianState;
	}
	public String getGuardianZip() {
		return guardianZip;
	}
	public void setGuardianZip(String guardianZip) {
		this.guardianZip = guardianZip;
	}
	public String getGuardianPhone() {
		return guardianPhone;
	}
	public void setGuardianPhone(String guardianPhone) {
		this.guardianPhone = guardianPhone;
	}
	
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	
	@Override
	public String toString() {
		return "GuardianInfoDto [studentID=" + studentID + ", marketing=" + marketing + ", guardianName=" + guardianName
				+ ", guardianAddress=" + guardianAddress + ", guardianApt=" + guardianApt + ", guardianCity="
				+ guardianCity + ", guardianState=" + guardianState + ", guardianZip=" + guardianZip
				+ ", guardianPhone=" + guardianPhone + "]";
	}


}
