/**
 * 
 */
package com.polyservice.controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.util.Calendar;

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
import com.polyservice.dao.UsersDao;
import com.polyservice.dto.CourseSelectionDto;
import com.polyservice.dto.GuardianInfoDto;
import com.polyservice.dto.MedicalHistoryDto;
import com.polyservice.dto.StudentInfoDto;
import com.polyservice.factory.DaoFactory;
import com.polyservice.json.UserDetailsJSON;
import com.polyservice.json.UserJSON;
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
				
		String cred = APICredentials.GOOGLE_API_KEY;
				
		model.addAttribute("google_key", cred);

		response.addCookie(new Cookie("steamID", "manu"));
		response.addCookie(new Cookie("avatar", "playerAvatar"));
		response.addCookie(new Cookie("persona", "playerPersona"));
		
		
		String state = null;

		if (state == null) {

			// Create a state token to prevent request forgery.
			// Store it in the session for later validation.
			state = new BigInteger(130, new SecureRandom()).toString(32);

		}

//		model.addAttribute("state", state);

//		System.out.println("This is the random state token: " + state);

		return "home";
	}

	
	@RequestMapping({ "/registration" })
	public String studentRegistration(Model model) {
		
				
				// Use this to set user id as time stamp, just for development
				// 1) create a java calendar instance 
				Calendar calendar = Calendar.getInstance();

				// 2) get a java.util.Date from the calendar instance.
				// this date will represent the current instant, or "now".
				java.util.Date now = calendar.getTime();

				// 3) a java current time (now) instance
				java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
				 
				model.addAttribute("time", currentTimestamp);
				

		return "registration";
	}

	// this is called when the user clicks to submit form data
	@RequestMapping(value = { "/signup" }, method = RequestMethod.POST)
	public String signupPost(Model model, @ModelAttribute("command") StudentInfoDto newUser) {

		// 1) create a java calendar instance
		Calendar calendar = Calendar.getInstance();

		// 2) get a java.util.Date from the calendar instance.
		// this date will represent the current instant, or "now".
		java.util.Date now = calendar.getTime();

		// 3) a java current time (now) instance
//		java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());

//		newUser.setCurrentDate(currentTimestamp.toString());
//		newUser.setUserID(0);
		UsersDao dao = DaoFactory.getInstance(DaoFactory.USERSDAO);
		dao.insertUser(newUser);

		return "dashboard";

	}

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
	

	@RequestMapping("/result")
	public ModelAndView result(Model model, @RequestParam("code") String code, @RequestParam("state") String state,
			@ModelAttribute("stateSes") String stateSes) {

		// Check to make sure the state values match
		if (stateSes.equals(state)) {

			System.out.println("This is the Result page and info: " + code + " " + state);

			// Exchange temporary code for an access token
			URL url;
			try {
				url = new URL("https://www.googleapis.com/oauth2/v4/token?" + "code=" + code + "&" + "client_id="
						+ APICredentials.CLIENT_ID + "&" + "redirect_uri=http://localhost:8080/Polyservice/result" + "&"
						+ "client_secret=" + APICredentials.CLIENT_SECRET + "&" + "grant_type=authorization_code");

				HttpURLConnection con = (HttpURLConnection) url.openConnection();

				con.setDoOutput(true); // Must add
				con.setRequestMethod("POST");
				con.setFixedLengthStreamingMode(0); // Must add

				// Use the Jackson API to covert JSON to POJO
				ObjectMapper mapper = new ObjectMapper();
				UserJSON jsonMap = mapper.readValue(new BufferedReader(new InputStreamReader(con.getInputStream())),
						UserJSON.class);

				System.out.println(jsonMap);

				System.out.println(
						"The test is if the access token shows up below this line\n" + jsonMap.getAccess_token());

				byte[] decoded = Base64.decodeBase64(jsonMap.getId_token());
				System.out.println(new String(decoded, "UTF-8") + "\n");

				System.out.println("Here is the getId_token " + jsonMap.getId_token());

				String temp = jsonMap.getId_token();
				String[] arrTemp = temp.split("\\.");
				System.out.println("Here is the length of the array " + arrTemp.length);

				byte[] decodedID = Base64.decodeBase64(arrTemp[1]);
				System.out.println(new String(decodedID, "UTF-8") + "\n");

				String payload = (new String(decodedID, "UTF-8") + "\n");
				System.out.println("Payload is " + payload);

				ObjectMapper mapperID = new ObjectMapper();
				UserDetailsJSON userDetailJSON = mapperID.readValue(payload, UserDetailsJSON.class);

				System.out.println("These are the user details we will store in MySQL from the google API: "
						+ userDetailJSON.getEmail() + " " + userDetailJSON.getSub());

				con.disconnect();

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {

			System.out.println("Invalid State Parameter!" + "\n State is: " + state);

		}

		return new ModelAndView("home", "", "");
	}
	
	
	//TODO Add these to a REST Controller
	
	@RequestMapping(value = "studentInfoFormSubmit", method = RequestMethod.POST)
    public String submitStudentInfo(@RequestBody StudentInfoDto studentInfoForm) {
		
		System.out.println(studentInfoForm.toString());
		
		//Push the current student information form data to MySQL via hibernate
		UsersDao dao = DaoFactory.getInstance(DaoFactory.USERSDAO);
		dao.insertUser(studentInfoForm);
		
		return "registration";
    }
	
	@RequestMapping(value = "studentInfoFormRetrieve", method = RequestMethod.POST)
    public String retrieveStudentInfo(@RequestBody StudentInfoDto studentInfoForm) {
		
		//Push the current student information form data to MySQL via hibernate
		UsersDao dao = DaoFactory.getInstance(DaoFactory.USERSDAO);
		
		StudentInfoDto user = dao.getUserInfo(studentInfoForm.getStudentID());
		System.out.println("The returned user is: " + user);
		
		return "registration";
    }
	
	
	
	@RequestMapping(value = "courseInfoFormSubmit", method = RequestMethod.POST)
    public String submitCourseInfo(@RequestBody CourseSelectionDto courseInfoForm) {
		
		System.out.println(courseInfoForm.toString());
		
		return "registration";
    }
	
	@RequestMapping(value = "medicalInfoFormSubmit", method = RequestMethod.POST)
    public String submitMedicalInfo(@RequestBody MedicalHistoryDto medicalInfoForm) {
		
		System.out.println(medicalInfoForm.toString());
		
		return "registration";
    }
	
	
	
}
