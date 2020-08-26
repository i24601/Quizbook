package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.FolderDao;
import com.javaex.vo.FolderVo;

@Service
public class SideService {
	
	@Autowired
	private FolderDao folderDao;
	
	public FolderVo newByUserId(String user_id) {
		System.out.println("SideService:New");
		FolderVo fVo = new FolderVo();
		fVo.setUser_id(user_id);
		fVo.setDepth(0);
		fVo.setOrder_no(1);
		
		int no = FolderDao.selectNoBefore();
		fVo.setNo(no);
		
		FolderDao.insertFolder(fVo);
		System.out.println(fVo.toString());
		
		return getFolderByNo(key);

	}

}
