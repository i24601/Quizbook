package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.FolderDao;
import com.javaex.vo.FolderVo;

@Service
public class SideService {
	
	@Autowired
	private FolderDao folderDao;
	
	public FolderVo newFolder(FolderVo fVo) {
		System.out.println("SideService:addFolder");
		
		folderDao.updateOrderNoUp(fVo);
		fVo.setOrder_no(fVo.getOrder_no()+1);
		
		/* select key가 대체해줌
		 * int no = folderDao.getNoBefore(); fVo.setNo(no);
		 */
		
		
		if(fVo.getNo()==0) {
			folderDao.newInsertFolder(fVo);
		}
		
		else {
			fVo.setDepth(fVo.getDepth()+1);
			
			//no X
			System.out.println("no"+fVo.getNo());
			folderDao.insertFolder(fVo);
			System.out.println("no"+fVo.getNo());
			//fVo no			
		}
		
		return folderDao.getFolderVoByNo(fVo.getNo());

	}

}
