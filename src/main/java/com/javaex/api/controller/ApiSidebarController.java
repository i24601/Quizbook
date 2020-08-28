package com.javaex.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.SideService;
import com.javaex.vo.FolderVo;

@Controller
@RequestMapping(value="/api/side")
public class ApiSidebarController {
	
	@Autowired
	private SideService sideService;
	
	@ResponseBody
	@RequestMapping(value="/folderAddFolder")
	public FolderVo addFolder(@RequestBody FolderVo fVo) {
		System.out.println("받은데이터"+fVo.toString());
		//session 여기서 받는게 안전 일단 테스트
		fVo.setUser_id("test");
		return sideService.newFolder(fVo);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFolder")
	public int deleteFolder(@RequestBody FolderVo fVo) {
		System.out.println("받은데이터"+fVo.toString());
		//session 여기서 받는게 안전 일단 테스트
		fVo.setUser_id("test");
		return sideService.deleteFolder(fVo);
	}
	
}
