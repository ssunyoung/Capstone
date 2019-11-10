package com.ssun.everybook.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ssun.everybook.domain.LibraryInput;
import com.ssun.everybook.domain.LibraryVO;

@Repository
public class LibraryDAOImpl implements LibraryDAO{
	
	@Inject
	SqlSession session;
	
	private static String namespace = "com.ssun.everybook.mapper.LibraryMapper";

	@Override
	public List<LibraryVO> listLibrary(LibraryInput libInput) throws Exception {
	//	System.out.println("DAO____________libInput"+libInput);
		return session.selectList(namespace + ".listLibrary",libInput);
	}



}
