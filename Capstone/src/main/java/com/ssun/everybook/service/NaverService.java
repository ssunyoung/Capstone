package com.ssun.everybook.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssun.everybook.domain.SearchNaver;

@Service
public interface NaverService {
	public List<SearchNaver> searchBook(String keyword, int display, int start);
}
