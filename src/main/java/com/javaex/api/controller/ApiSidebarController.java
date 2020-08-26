package com.javaex.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.SideService;
import com.javaex.vo.FolderVo;

@Controller
@RequestMapping(value="/api/side")
public class ApiSidebarController {
	
	@Autowired
	private SideService sideService;
	
	@ResponseBody
	@RequestMapping(value="/folderNew")
	public FolderVo newFolder(@RequestParam String user_id) {
		System.out.println("받은데이터"+user_id);
		return sideService.newByUserId(user_id);
	}
	
}
