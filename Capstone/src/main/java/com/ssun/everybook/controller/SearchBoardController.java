package com.ssun.everybook.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssun.everybook.domain.BoardVO;
//import com.ssun.everybook.domain.Criteria;
import com.ssun.everybook.domain.PageMaker;
import com.ssun.everybook.domain.SearchCriteria;
import com.ssun.everybook.domain.SearchNaver;
import com.ssun.everybook.service.BoardService;
import com.ssun.everybook.service.NaverService;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {

	private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);

	@Inject
	private BoardService service;

	@Inject
	private NaverService naverService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info(cri.toString() + "cri.tostringggggggggggggggggggggggggggggggggggg");

		model.addAttribute("list", service.listSearchCriteria(cri));
		// System.out.println(cri + "cri model listttttttttttttttttttttttttttt");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		// System.out.println(cri + "setcriiiiiiiiiiiiiiiiiiiii");
		pageMaker.setTotalCount(service.listSearchCount(cri));

		// System.out.println(cri + "setcriiiiiiiiiiiiiiiiiiiiiiiiiii");
		model.addAttribute("pageMaker", pageMaker);

	}

	// 각 글 조회
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		logger.info("show Each List...............+paging+search");

		model.addAttribute(service.read(bno));
	}

	// Naver 검색결과 페이지
	@RequestMapping(value = "/naverSearch", method = RequestMethod.GET)
	public ModelAndView naverSearching(HttpServletRequest request, SearchNaver naverVO,
			@RequestParam(required = false) String naverQuery) throws Exception {
		ModelAndView mav = new ModelAndView();
		logger.info("naver searching controller 실행..................");

		if (naverQuery != null) {

			mav.addObject("naverRes", naverService.searchBook(naverQuery, 10, 1));
			System.out.println("************************************************");
		}
		mav.setViewName("/sboard/naverSearch");

		return mav;
	}

	// 각 글 삭제
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("board remove...............+paging");

		service.remove(bno);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("result", "success");

		return "redirect:/sboard/list";
	}

	// 글 수정 +paging
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		logger.info("show Each List...............+ paging modify");

		model.addAttribute(service.read(bno));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info(cri.toString() + "mod POST...............");

		service.modify(board);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("result", "success");

		logger.info(rttr.toString());

		return "redirect:/sboard/list";
	}

	// 글 작성
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET(BoardVO board, Model model) throws Exception {
		logger.info("board Register get...............");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("board Register post...............");
		logger.info(board.toString());

		service.regist(board);

		rttr.addFlashAttribute("result", "success");
		return "redirect:/sboard/list";
	}
}
