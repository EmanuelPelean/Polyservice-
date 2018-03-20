package com.polyservice.dao;

import com.polyservice.dto.CourseSelectionDto;
import com.polyservice.dto.GuardianInfoDto;
import com.polyservice.dto.MedicalHistoryDto;
import com.polyservice.dto.StudentInfoDto;

public interface Dao {
	
	void insertUser(StudentInfoDto newUser);
	
	StudentInfoDto getUserInfo(String userId);

	void updateUser(StudentInfoDto newUser);

	boolean userRegistrationCheck(String userId);
	
	
	
	void insertCourseInfo(CourseSelectionDto courseInfo);

	void updateCourseInfo(CourseSelectionDto courseInfo);

	boolean courseRegistrationCheck(String userId);
	
	
	
	void insertMedicalInfo(MedicalHistoryDto medicalInfo);

	void updateMedicalInfo(MedicalHistoryDto medicalInfo);

	boolean medicalRegistrationCheck(String userId);
	
	
	
	void insertGuardianInfo(GuardianInfoDto medicalInfo);

	void updateGuardianInfo(GuardianInfoDto medicalInfo);

	boolean guardianRegistrationCheck(String userId);

}
