/**
 * 
 */
package com.polyservice.controllers;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.util.Calendar;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.polyservice.dto.CourseSelectionDto;
import com.polyservice.dto.GuardianInfoDto;
import com.polyservice.dto.MedicalHistoryDto;
import com.polyservice.dto.StudentInfoDto;
import com.polyservice.factory.DaoFactory;
import com.polyservice.util.APICredentials;
import com.google.api.client.repackaged.org.apache.commons.codec.binary.Base64;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Manu
 *
 */
@Controller
@SessionAttributes("stateSes")
public class HomeController {

	@RequestMapping({ "/", "/home" })
	public String home(Model model, HttpServletResponse response) {
				
		response.addCookie(new Cookie("steamID", "manu"));
		response.addCookie(new Cookie("avatar", "playerAvatar"));
		response.addCookie(new Cookie("persona", "playerPersona"));
		
		model.addAttribute("google_key", APICredentials.GOOGLE_API_KEY);
		
		
		return "home";
	}

	
	@RequestMapping({ "/registration" })
	public String studentRegistration() {
		
				
				// Use this to set user id as time stamp, just for development
				// 1) create a java calendar instance 
				Calendar calendar = Calendar.getInstance();

				// 2) get a java.util.Date from the calendar instance.
				// this date will represent the current instant, or "now".
				java.util.Date now = calendar.getTime();

				// 3) a java current time (now) instance
				java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
				 
//				model.addAttribute("time", currentTimestamp);
				

		return "registration";
	}

//	// this is called when the user clicks to submit form data
//	@RequestMapping(value = { "/signup" }, method = RequestMethod.POST)
//	public String signupPost(Model model, @ModelAttribute("command") StudentInfoDto newUser) {
//
//		// 1) create a java calendar instance
//		Calendar calendar = Calendar.getInstance();
//
//		// 2) get a java.util.Date from the calendar instance.
//		// this date will represent the current instant, or "now".
//		java.util.Date now = calendar.getTime();
//
//		// 3) a java current time (now) instance
////		java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
//
////		newUser.setCurrentDate(currentTimestamp.toString());
////		newUser.setUserID(0);
////		UsersDao dao = DaoFactory.getInstance(DaoFactory.USERSDAO);
////		dao.insertUser(newUser);
//
//		return "dashboard";
//
//	}

	@RequestMapping({ "/dashboard" })
	public String studentDashboard(Model model, HttpServletResponse response) {
		
		
		
		
		response.addCookie(new Cookie("steamID", "manu"));
		response.addCookie(new Cookie("avatar", "playerAvatar"));
		response.addCookie(new Cookie("persona", "playerPersona"));
		
		return "dashboard";
	}
	
	@RequestMapping({ "/schedule" })
	public String showSchedule(Model model) {

		return "schedule";
	}
	
	@RequestMapping({ "/adminconsole" })
	public String adminConsole(Model model) {

		return "adminconsole";
	}
	
	@RequestMapping({ "/modifycourse" })
	public String modifyCourse(Model model) {

		return "modifycourse";
	}
	
}
