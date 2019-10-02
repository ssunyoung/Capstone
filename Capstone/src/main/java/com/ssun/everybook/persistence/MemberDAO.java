package com.ssun.everybook.persistence;

import com.ssun.everybook.domain.MemberVO;

public interface MemberDAO {

	public void create(MemberVO vo)throws Exception;

}
