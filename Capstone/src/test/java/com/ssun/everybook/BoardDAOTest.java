package com.ssun.everybook;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ssun.everybook.controller.BookController;
import com.ssun.everybook.domain.BoardVO;
import com.ssun.everybook.domain.SearchCriteria;
import com.ssun.everybook.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

	@Inject
	private BoardDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(BookController.class);

	/*
	 * @Test public void testCreate() throws Exception { BoardVO board = new
	 * BoardVO(); board.setTitle("새로운 글을 등록합니다. title"); board.setWriter("writer");
	 * board.setPublisher("publisher"); board.setPubdate("20190808");
	 * board.setIsbn("4678956146511"); board.setOrg_price("50000");
	 * board.setSale_price("5000"); board.setGrade("상");
	 * board.setPhone("010-0000-0000"); board.setContraction("택배");
	 * board.setContent("새로운 글을 등록합니다. content"); board.setWriter("user00");
	 * dao.create(board); }
	 */

	/*
	 * @Test public void testRead() throws Exception {
	 * logger.info(dao.read(1).toString()); }
	 */

	// paging test
	/*
	 * @Test public void testListPage() throws Exception { int page = 3;
	 * List<BoardVO> list = dao.listPage(page);
	 * 
	 * for (BoardVO boardVO : list) { logger.info(boardVO.getBno() + ":" +
	 * boardVO.getTitle()); } }
	 */

	/*
	 * @Test //ListCriteria paging test public void testListCriteria() throws
	 * Exception { Criteria cri = new Criteria(); cri.setPage(2);
	 * cri.setPerPageNum(20);
	 * 
	 * List<BoardVO> list = dao.listCriteria(cri);
	 * 
	 * for(BoardVO boardVO : list) {
	 * logger.info(boardVO.getBno()+":"+boardVO.getTitle()); } }
	 */

	/*@Test // url test
	public void testURI() throws Exception {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/board/read").queryParam("bno", 12)
				.queryParam("perPageNum", 20).build();

		logger.info("/board/read?bno=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}

	@Test // url test2
	public void testURI2() throws Exception {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/{module}/{page}").queryParam("bno", 12)
				.queryParam("perPageNum", 20).build().expand("board","read").encode();

		logger.info("/board/read?bno=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}*/
	
	@Test //dynamic sql 
	public void testDynamic1() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("글");
		cri.setSearchType("t");
		
		logger.info("====================================================================");
		
		List<BoardVO> list = dao.listSearch(cri);
		
		for(BoardVO boardVO : list) {
			logger.info(boardVO.getBno() + ": "+boardVO.getTitle());
		}
		
		logger.info("===========================================");
		
		logger.info("COUNT: " + dao.listSearchCount(cri));
	}
}
