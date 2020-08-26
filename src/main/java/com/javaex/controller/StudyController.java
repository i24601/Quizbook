  
package com.javaex.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.vo.FolderVo;

@Controller
@RequestMapping(value="/study", method={RequestMethod.GET, RequestMethod.POST})
public class StudyController {
	
	@RequestMapping(value="/main", method={RequestMethod.GET, RequestMethod.POST})
	public String study(Model model){
		System.out.println("studyController:main");
		List<FolderVo> fList = new ArrayList<FolderVo>();
		model.addAttribute("fList", fList);
		return "study/main";
	}

}