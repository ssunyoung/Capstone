package com.ssun.everybook;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ssun.everybook.controller.BookController;
import com.ssun.everybook.domain.BoardVO;
import com.ssun.everybook.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

	@Inject
	private BoardDAO dao;

	private static final Logger logger = LoggerFactory.getLogger(BookController.class);

	@Test
	public void testCreate() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("새로운 글을 등록합니다. title");
		board.setWriter("writer");
		board.setPublisher("publisher");
		board.setPubdate("20190808");
		board.setIsbn("4678956146511");
		board.setOrg_price("50000");
		board.setSale_price("5000");
		board.setGrade("상");
		board.setPhone("010-0000-0000");
		board.setContraction("택배");
		board.setContent("새로운 글을 등록합니다. content");
		board.setWriter("user00");
		dao.create(board);
	}

	@Test
	public void testRead() throws Exception {
		logger.info(dao.read(1).toString());
	}
}
