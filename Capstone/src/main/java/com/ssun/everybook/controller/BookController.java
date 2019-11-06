package com.ssun.everybook.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssun.everybook.service.BookService;

@RequestMapping("/bookbook/*")
@Controller
public class BookController {

	private static final Logger logger = LoggerFactory.getLogger(BookController.class);

	@Inject
	private BookService service;

	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String search(HttpServletRequest request,
			@RequestParam(value = "queryWord", required = false, defaultValue = "") String queryWord) throws Exception {
		logger.info("searchList get .............");
		ArrayList<String> aladinRest = new ArrayList<String>();
		String aa = null;
		aa = service.yes24Crawler(queryWord);
		String aladinMain = service.aladinBookApi(queryWord);
		System.out.println("queryWord" + queryWord);

		aladinRest = service.aladinCrawler(queryWord);

		System.out.println("================yes24======CONTROLLER START========\n");
		System.out.println(aa);
		System.out.println("================yes24======CONTROLLER END========\n");

		request.setAttribute("hash", aa);

		// request.setAttribute("test", test);
		if (aladinMain.contains("error")) {
			request.setAttribute("addResult", "error");
		} else {
			request.setAttribute("addResult", aladinMain);
			request.setAttribute("aladinRest", aladinRest);
		}
		System.out.println("================aladin=====CONTROLLER START========\n");
		System.out.println(aladinMain.contains("error"));
		System.out.println("================aladin======CONTROLLER END========\n");
		request.setAttribute("queryWord", queryWord);

		return "book";

	}

}
