package com.ssun.everybook.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssun.everybook.domain.LibraryInput;
import com.ssun.everybook.domain.LibraryVO;

@Service
public interface LibraryService {

	public List<LibraryVO> listLibrary(LibraryInput libInput) throws Exception;
	
	//도서나루 api 가져오기.
	public String libraryApi (String libCode, String isbn);
}
