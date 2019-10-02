package com.ssun.everybook.service;

import java.io.IOException;

public interface BookService {
	//aladin api json parsing
	public String aladinBookApi(String query);
	
	//aladin crawler
	public String aladinCrawler() throws IOException;
	
	//yes24 crawler
	public String yes24Crawler() throws IOException;
}
