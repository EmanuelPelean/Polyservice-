package com.polyservice.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.polyservice.dao.Dao;
import com.polyservice.dto.CourseSelectionDto;
import com.polyservice.dto.GuardianInfoDto;
import com.polyservice.dto.MedicalHistoryDto;
import com.polyservice.dto.StudentInfoDto;
import com.polyservice.factory.DaoFactory;

@Controller
public class RESTController {

	@RequestMapping(value = "/studentInfoFormSubmit.html", method = RequestMethod.POST)
	public String submitStudentInfo(@RequestBody StudentInfoDto studentInfoForm) {

		System.out.println(studentInfoForm.toString());

		// Push the current student information form data to MySQL via hibernate
		Dao dao = DaoFactory.getInstance(DaoFactory.USERSDAO);
		
		dao.insertUser(studentInfoForm);

//		boolean result = false;
//		// A check to see if the current user already has info saved in MySQL
//		try{  
//			result = dao.userRegistrationCheck(studentInfoForm.getStudentID());
//			
//		}catch(IllegalStateException illRef){
//				
//			System.out.println("No ID matches found for this user!");
//			}  
//
//		
//		// Based on the check above we can save or update the current user's info
//		if (result == true) {
//			//Debug only
//			System.out.println("The result when submitting student info should be true, it is : " + result);
//			dao.updateUser(studentInfoForm);
//		} else {
//			//Debug only
//			System.out.println("The result when submitting student info should be false, it is : " + result);
//			dao.insertUser(studentInfoForm);
//		}

		return "registration";
	}

	@RequestMapping(value = "getStudentInfo", method = RequestMethod.POST)
	public String retrieveStudentInfo(@RequestBody StudentInfoDto studentInfoForm, StudentInfoDto resultDto,
			ModelMap model) {

		Dao dao = DaoFactory.getInstance(DaoFactory.USERSDAO);

		System.out.println("(RESTController) The student we are looking for has id " + studentInfoForm.getStudentID());

		// Push the current student id to MySQL via hibernate and return the user DTO
		// that matches this id
		
		resultDto = dao.getUserInfo(studentInfoForm.getStudentID());

		System.out.println("The returned user is: " + resultDto.toString());
		System.out.println("The returned user's first name is: " + resultDto.getFirstName());

		return "registration";
	}
	
	

	@RequestMapping(value = "courseInfoFormSubmit", method = RequestMethod.POST)
	public String submitCourseInfo(@RequestBody CourseSelectionDto courseInfoForm) {

		System.out.println(courseInfoForm.toString());

		// Push the current course information form data to MySQL via hibernate
		Dao dao = DaoFactory.getInstance(DaoFactory.COURSEDAO);
		
		dao.insertCourseInfo(courseInfoForm);

//		// A check to see if the current user already has info saved in MySQL
//		boolean result = dao.courseRegistrationCheck(courseInfoForm.getStudentID());
//
//		// Based on the check above we can save or update the current user's info
//		if (result == true) {
//			dao.updateCourseInfo(courseInfoForm);
//		} else {
//			dao.insertCourseInfo(courseInfoForm);
//		}

		return "registration";
	}

	@RequestMapping(value = "medicalInfoFormSubmit", method = RequestMethod.POST)
	public String submitMedicalInfo(@RequestBody MedicalHistoryDto medicalInfoForm) {

		System.out.println(medicalInfoForm.toString());

		// Push the current course information form data to MySQL via hibernate
		Dao dao = DaoFactory.getInstance(DaoFactory.MEDICALDAO);

		dao.insertMedicalInfo(medicalInfoForm);
//		// A check to see if the current user already has info saved in MySQL
//		boolean result = dao.medicalRegistrationCheck(medicalInfoForm.getStudentID());
//
//		// Based on the check above we can save or update the current user's info
//		if (result == true) {
//			dao.updateMedicalInfo(medicalInfoForm);
//			
//		} else {
//			dao.insertMedicalInfo(medicalInfoForm);
//		}

		return "registration";
	}

//	@RequestMapping(value = "guardianFormSubmit", method = RequestMethod.POST)
//	public String submitGuardianInfo(@RequestBody GuardianInfoDto guardianInfoForm) {
//
//		System.out.println(guardianInfoForm.toString());
//
//		// Push the current course information form data to MySQL via hibernate
//		Dao dao = DaoFactory.getInstance(DaoFactory.GUARDIANDAO);
//		
//		dao.insertGuardianInfo(guardianInfoForm);
//
////		// A check to see if the current user already has info saved in MySQL
////		boolean result = dao.guardianRegistrationCheck(guardianInfoForm.getStudentID());
////
////		// Based on the check above we can save or update the current user's info
////		if (result == true) {
////			dao.updateGuardianInfo(guardianInfoForm);
////		} else {
////			dao.insertGuardianInfo(guardianInfoForm);
////		}
//
//		return "registration";
//	}
	
	@RequestMapping(value = {"/submitGuardianInfo"}, method = RequestMethod.POST)
	public String submitGuardInfo(@ModelAttribute("command") GuardianInfoDto guardianInfoForm) {
		
		System.out.println(guardianInfoForm.toString());

		// Push the current course information form data to MySQL via hibernate
		Dao dao = DaoFactory.getInstance(DaoFactory.GUARDIANDAO);
		
		dao.insertGuardianInfo(guardianInfoForm);

//		// A check to see if the current user already has info saved in MySQL
//		boolean result = dao.guardianRegistrationCheck(guardianInfoForm.getStudentID());
//
//		// Based on the check above we can save or update the current user's info
//		if (result == true) {
//			dao.updateGuardianInfo(guardianInfoForm);
//		} else {
//			dao.insertGuardianInfo(guardianInfoForm);
//		}
		
		return "dashboard";
		
	}

}
