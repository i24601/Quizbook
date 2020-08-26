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
	
	public FolderVo insertNewFolder(Map<String, Object> paging){
		System.out.println("BoardDao:selectListByMap");
		return sqlSession.selectList("board.selectListByMap", paging);
	}
	
}
