package com.ssun.everybook.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssun.everybook.service.BookService;

@RequestMapping("/everybook/*")
@Controller
public class BookController {

	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Inject
	private BookService service;
	
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String search(HttpServletRequest request,
			@RequestParam(value = "queryWord", defaultValue = "") String queryWord) throws Exception {
		logger.info("searchList get .............");
		
		String addResult = service.aladinBookApi("c언어 익스프레스");
		//service.aladinCrawler();
		service.yes24Crawler();
		System.out.println("==================addResult ==>" + addResult);
		request.setAttribute("addResult", addResult);
		request.setAttribute("queryWord", queryWord);
		
		return "book";
		
	}
	
}
