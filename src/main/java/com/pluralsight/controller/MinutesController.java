package com.pluralsight.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pluralsight.model.Activity;
import com.pluralsight.model.Exercise;
import com.pluralsight.service.ExerciseService;

@Controller
public class MinutesController {
	
	@Autowired
	private ExerciseService exerciseService;
	
	@RequestMapping(value = "/addMinutes")  //actually the url provided should be: http://localhost:8070/FitnessTracker/addMinutes.html
	public String addMinutes(@ModelAttribute ("exercise") Exercise exercise){
		System.out.println("exercise: " + exercise.getMinutes());
		System.out.println("exercise activity: " + exercise.getActivity());
		
		return "addMinutes";  //the returning path will be /WEB-INF/jsp/addMinutes.jsp
//		return "forward:addMoreMinutes.html";  //continue old request, keep all former data	
//		return "redirect:addMoreMinutes.html"; //close the old request, lost all former data
	}	
	
	@RequestMapping(value = "/addMoreMinutes")
	public String addMoreMinutes(@ModelAttribute ("exercise") Exercise exercise){
		System.out.println("exercising: " + exercise.getMinutes());
		return "addMinutes";
	}
	
	@RequestMapping(value = "/activities", method = RequestMethod.GET) 
	public @ResponseBody List<Activity> findAllActivities(){

		return exerciseService.findAllActivities();
	}
}
