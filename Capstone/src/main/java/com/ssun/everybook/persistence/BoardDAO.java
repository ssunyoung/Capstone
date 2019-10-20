package com.ssun.everybook.persistence;

import java.util.List;

import com.ssun.everybook.domain.BoardVO;
import com.ssun.everybook.domain.Criteria;

public interface BoardDAO {

	//board 관련
	public void create(BoardVO vo) throws Exception;

	public BoardVO read(Integer bno) throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(Integer bno) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	// paging 관련
	public List<BoardVO> listPage(int page) throws Exception;
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public int countPaging(Criteria cri)throws Exception;
}
