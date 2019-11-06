package com.ssun.everybook.persistence;

import java.util.List;

import com.ssun.everybook.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> list(Integer bno) throws Exception;
	
	public void create(ReplyVO vo) throws Exception; 
	
	public void update(ReplyVO vo) throws Exception; 
	
	public void delete(Integer rno) throws Exception; 

}
