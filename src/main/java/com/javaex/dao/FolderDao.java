package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.FolderVo;


@Repository
public class FolderDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//order_no update용 sqlSession
	public int updateOrderNoUp(FolderVo fVo){
		return sqlSession.update("folder.updateOrderNoUp", fVo);
	}
	
	//seq_no를 받을뿐인 sqlSession
	public int getNoBefore(){
		return sqlSession.selectOne("folder.selectNoSeq");
	}
	
	
	public int insertFolder(FolderVo fVo){
		return sqlSession.insert("folder.insert", fVo);
	}
	
	public int newInsertFolder(FolderVo fVo){
		return sqlSession.insert("folder.insertNew", fVo);
	}
	
	public FolderVo getFolderVoByNo(int no){
		return sqlSession.selectOne("folder.selectByNo", no);
	}
	
}
