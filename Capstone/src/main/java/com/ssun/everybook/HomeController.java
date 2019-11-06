package com.ssun.everybook;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssun.everybook.domain.PageMaker;
import com.ssun.everybook.domain.SearchCriteria;
import com.ssun.everybook.service.BoardService;

@Controller
public class HomeController {
	@Inject
	private BoardService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		logger.info(cri.toString() + "cri.tostringggggggggggggggggggggggggggggggggggg");

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

}
