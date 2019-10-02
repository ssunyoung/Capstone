package com.ssun.everybook.service;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.ssun.everybook.domain.BoardVO;
import com.ssun.everybook.persistence.BoardDAO;

@Repository
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		return dao.read(bno);
	}

}
