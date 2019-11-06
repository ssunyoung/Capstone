package com.ssun.everybook.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import org.json.simple.JSONObject;

public interface BookService {
	//aladin api json parsing
	public String aladinBookApi(String query);
	
	//aladin crawler
	public ArrayList<String> aladinCrawler(String query) throws IOException;
	
	//yes24 crawler
	public String yes24Crawler(String query) throws IOException;
	
	}
