package com.ssun.everybook.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ssun.everybook.domain.MemberVO;
import com.ssun.everybook.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	@Override
	public void regist(MemberVO board) throws Exception {
		dao.create(board);
	}

}
