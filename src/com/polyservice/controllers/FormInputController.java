package com.polyservice.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.polyservice.dto.GuardianInfoDto;

@Controller
public class FormInputController {

	
	@RequestMapping(value = "guardianFormSubmit", method = RequestMethod.POST)
    public ModelAndView submitGuardianInfo(@RequestBody GuardianInfoDto guardianInfoForm, Model model) {
		
		System.out.println(guardianInfoForm.toString());
		
		
		return new ModelAndView("dashboard", "","");
    }
	
}
