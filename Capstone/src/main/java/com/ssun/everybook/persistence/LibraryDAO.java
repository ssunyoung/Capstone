package com.ssun.everybook.persistence;

import java.util.List;

import com.ssun.everybook.domain.LibraryInput;
import com.ssun.everybook.domain.LibraryVO;

public interface LibraryDAO {

	//리스트 얻기
	public List<LibraryVO> listLibrary(LibraryInput libInput) throws Exception;
}
