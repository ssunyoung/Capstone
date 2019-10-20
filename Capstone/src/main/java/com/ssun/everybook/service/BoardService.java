package com.ssun.everybook.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssun.everybook.domain.BoardVO;
import com.ssun.everybook.domain.Criteria;

@Service
public interface BoardService {

	public void regist(BoardVO board) throws Exception;

	public BoardVO read(Integer bno) throws Exception;

	public void modify(BoardVO board) throws Exception;

	public void remove(Integer bno) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	// paging 관련
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception;

}
