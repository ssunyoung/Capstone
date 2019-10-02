package com.ssun.everybook.service;

import org.springframework.stereotype.Service;

import com.ssun.everybook.domain.BoardVO;

@Service
public interface BoardService {

	public void regist(BoardVO board) throws Exception;

	public BoardVO read(Integer bno) throws Exception;
}
