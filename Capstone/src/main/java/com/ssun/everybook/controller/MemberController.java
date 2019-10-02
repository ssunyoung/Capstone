package com.ssun.everybook.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssun.everybook.domain.MemberVO;
import com.ssun.everybook.service.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	private MemberService service;
/*
	@RequestMapping(value = "/member/register", method = RequestMethod.GET)
	public String registGET(MemberVO member, Model model) throws Exception{
		logger.info("회원가입 regist");
		return "/hew/member/register";
	}
	
	@RequestMapping(value = "/member/register", method = RequestMethod.POST)
	public String registPOST(MemberVO member, Model model) throws Exception{
		logger.info("회원가입 post");
		service.regist(member);
		return "home";
	}
*/
}
