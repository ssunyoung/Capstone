package com.ssun.everybook.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssun.everybook.domain.BoardVO;
import com.ssun.everybook.domain.Criteria;
import com.ssun.everybook.domain.SearchCriteria;

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
	
	//search 관련
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	//첨부파일 관련
	
	public List<String> getAttach(Integer bno) throws Exception;
}
