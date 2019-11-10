package com.ssun.everybook.service;

import java.util.List;

import com.ssun.everybook.domain.Criteria;
import com.ssun.everybook.domain.ReplyVO;

public interface ReplyService {

	public void addReply(ReplyVO vo) throws Exception;

	public List<ReplyVO> listReply(Integer bno) throws Exception;

	public void modifyReply(ReplyVO vo) throws Exception;

	public void removeReply(Integer rno) throws Exception;
	
	//for paging
	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception;
	
	public int count(Integer bno) throws Exception;
}
