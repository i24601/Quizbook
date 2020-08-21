  
package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/study", method={RequestMethod.GET, RequestMethod.POST})
public class StudyController {
	
	@RequestMapping(value="/main", method={RequestMethod.GET, RequestMethod.POST})
	public String study(){
		System.out.println("studyController:main");
		return "study/main";
	}

}