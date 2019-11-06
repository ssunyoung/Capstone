package com.ssun.everybook.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService {

	@Override
	public String yes24Crawler(String query) throws IOException {
		String url = "http://www.yes24.com/searchcorner/Search?keywordAd=&keyword=&domain=USED_GOODS&qdomain=UsedGoods&query="
				+ URLEncoder.encode(query, "euc-kr");

		Document rawData = Jsoup.connect(url).get();

		Elements title = null;
		Elements img = null;
		Elements orgPrice = null;
		Elements salePrice = null;
		Elements writer = null;
		Elements pubDate = null;
		Elements stockNum = null;
		
		JSONArray jsonArray = new JSONArray();
		
		// 홀수만 출력 1 3 5 7 9 11 13 15 17 19 
		// 총 10개의 값만
		for (int i = 1; i < 20; i += 2) {
			JSONObject data = new JSONObject();

			// System.out.println("i :::::::::::" + i);
			title = rawData.select("table tbody tr:nth-child(" + i + ") p[class=goods_name goods_icon] a:nth-child(1)");
			img = rawData.select("table tbody tr:nth-child(" + i + ") td[class=goods_img] a img");
			orgPrice = rawData.select(
					"table tbody tr:nth-child(" + i + ") td[class=goods_infogrp] p:nth-child(5) strong:nth-child(2)");
			salePrice = rawData.select(
					"table tbody tr:nth-child(" + i + ") td[class=goods_infogrp] p:nth-child(4) em:nth-child(1)");
			writer = rawData.select(
					"table tbody tr:nth-child(" + i + ") td[class=goods_infogrp] p[class=goods_info] a:nth-child(1)");
/*			publisher = rawData.select(
					"table tbody tr:nth-child(" + i + ") td[class=goods_infogrp] p[class=goods_info] a:nth-child(3)");*/
			pubDate = rawData
					.select("table tbody tr:nth-child(" + i + ") td[class=goods_infogrp] p[class=goods_info] em");
			stockNum = rawData.select("table tbody tr:nth-child(" + i
					+ ") td[class=goods_infogrp] p[class=used_info] a[class=txt_used_all] strong");
			
			// 비어있으면 출력 break;
			if (title.text().equals(""))
				break;
			// 출력 확인
			
			// System.out.println("title" + title.text());
			data.put("title", title.text());
			// System.out.println("stockNum" + stockNum.text());
			data.put("stockNum", stockNum.text());
			// System.out.println("publisher" + publisher.text());
			//map.put("publisher" + i, publisher.text());
			// System.out.println("pubDate" + pubDate.text());
			//data.put("pubDate", pubDate.text());
			// System.out.println("writer" + writer.text());
			data.put("writer", writer.text());
			// System.out.println("OrgPrice" + orgPrice.text());
			data.put("OrgPrice", orgPrice.text());
			// System.out.println("Sale" + salePrice.text());
			data.put("Sale", salePrice.text());
			System.out.println("CoverImg" + img.attr("src"));
			data.put("CoverImg", img.attr("src"));
			// link는 타이틀과 동일
			// System.out.println("link" + title.attr("href"));
			data.put("link", title.attr("href"));

			jsonArray.add(data);
			//System.out.println("yes24 check"+data);
		}
		JSONObject yesRes = new JSONObject();
		yesRes.put("res", jsonArray);
		System.out.println("YES24 SERVICE START ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ");

		System.out.println(yesRes);
		System.out.println("YES24 SERVICE END ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ");
		// ArrayList<String> results = null;
		// results.add(title.text());

		return yesRes.toJSONString();
	}
	
	//aladin API
	@Override
	public String aladinBookApi(String query) {
		// "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbtjsdud4061911002&QueryType=Title&MaxResults=10&start=1&SearchTarget=used&Version=20131101";
		String apiKey = "ttbtjsdud4061911002";
		// Query= 검색어
		InputStream is = null;
		// BufferedReader bufferedReader = null;
		String resultSet = null;
		try {
			// 링크 주소 만들기
			String requestUrl = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
			requestUrl += "?ttbkey=" + apiKey;
			requestUrl += "&MaxResults=10&QueryType=Title&start=1&SearchTarget=used&Version=20131101&Output=JS";
			requestUrl += "&query=" + URLEncoder.encode(query, "UTF-8");
			is = new URL(requestUrl).openStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			String str;
			StringBuffer buffer = new StringBuffer();

			while ((str = rd.readLine()) != null) {
				buffer.append(str);
			}
			String receiveMsg = buffer.toString();
			// System.out.println("&&&&&&&&&&&" + receiveMsg);
			resultSet = receiveMsg;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultSet;
	}

	//aladin Crawler
	
	@Override
	public ArrayList<String> aladinCrawler(String query) throws IOException {

		String url = "https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=Used&SearchWord="
				+ URLEncoder.encode(query, "euc-kr") + "&CategorySearch=&chkKeyTitle=on";

		Document rawData = Jsoup.connect(url).get();
		// System.out.println(rawData.toString());

		// 개수
		Elements usedBookNum = rawData.select("td:nth-child(5) table tbody tr:nth-child(2) td a span[class=bo_used_s]");
		// System.out.println(usedBookNum);
		System.out.println("************************************************************* \n" + usedBookNum);
		ArrayList<String> test = new ArrayList<String>();
		System.out.println("************************************************************* \n");

		for (Element usedBookNums : usedBookNum) {
			String result = usedBookNums.text();
			result = result.replaceAll("[(,)]", "");
			// 10개 결과만 뽑기 위함
			System.out.println("test num size" + test.size());

			if (test.size() >= 10)
				break;
			test.add(result);
		}

		// 가격 구하기.
		Elements usedBookPrice = rawData.select("td:nth-child(5) table tbody tr:nth-child(4) td a[class=bo_used] b");
		System.out.println(usedBookPrice);

		for (Element usedBookPrices : usedBookPrice) {
			String result = usedBookPrices.text();
			result = result.replaceAll("[원,\\,]", "");
			System.out.println("test price size" + test.size());

			// 10개 결과만 뽑기 위함
			if (test.size() >= 20)
				break;
			test.add(result);
		}

		return test;
	}
	
	//yes24 Crawler

/*	@Override
	public LinkedHashMap<String, String> yes24Crawler(String query) throws IOException {
		String url = "http://www.yes24.com/searchcorner/Search?keywordAd=&keyword=&domain=USED_GOODS&qdomain=UsedGoods&query="
				+ URLEncoder.encode(query, "euc-kr");

		Document rawData = Jsoup.connect(url).get();

		Elements title = null;
		Elements img = null;
		Elements orgPrice = null;
		Elements salePrice = null;
		Elements writer = null;
		//Elements publisher = null;
		Elements pubDate = null;
		// Elements stockStatus = null;
		Elements stockNum = null;
		
		LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
		
		
		// 홀수만 출력 1 3 5 7 9 11 13 15 17 19
		for (int i = 1; i < 20; i += 2) {

			// System.out.println("i :::::::::::" + i);
			title = rawData.select("table tbody tr:nth-child(" + i + ") p[class=goods_name goods_icon] a:nth-child(1)");
			img = rawData.select("table tbody tr:nth-child(" + i + ") td[class=goods_img] a img");
			orgPrice = rawData.select(
					"table tbody tr:nth-child(" + i + ") td[class=goods_infogrp] p:nth-child(5) strong:nth-child(2)");
			salePrice = rawData.select(
					"table tbody tr:nth-child(" + i + ") td[class=goods_infogrp] p:nth-child(4) em:nth-child(1)");
			writer = rawData.select(
					"table tbody tr:nth-child(" + i + ") td[class=goods_infogrp] p[class=goods_info] a:nth-child(1)");
			publisher = rawData.select(
					"table tbody tr:nth-child(" + i + ") td[class=goods_infogrp] p[class=goods_info] a:nth-child(3)");
			pubDate = rawData
					.select("table tbody tr:nth-child(" + i + ") td[class=goods_infogrp] p[class=goods_info] em");
			stockNum = rawData.select("table tbody tr:nth-child(" + i
					+ ") td[class=goods_infogrp] p[class=used_info] a[class=txt_used_all] strong");
			
			// 비어있으면 출력 break;
			if (title.text().equals(""))
				break;
			// 출력 확인
			
			// System.out.println("title" + title.text());
			map.put("title" + i, title.text());
			// System.out.println("stockNum" + stockNum.text());
			map.put("stockNum" + i, stockNum.text());
			// System.out.println("publisher" + publisher.text());
			//map.put("publisher" + i, publisher.text());
			// System.out.println("pubDate" + pubDate.text());
			map.put("pubDate" + i, pubDate.text());
			// System.out.println("writer" + writer.text());
			map.put("writer" + i, writer.text());
			// System.out.println("OrgPrice" + orgPrice.text());
			map.put("OrgPrice" + i, orgPrice.text());
			// System.out.println("Sale" + salePrice.text());
			map.put("Sale" + i, salePrice.text());
			// System.out.println("CoverImg" + img.attr("src"));
			map.put("CoverImg" + i, img.attr("src"));
			// link는 타이틀과 동일
			// System.out.println("link" + title.attr("href"));
			map.put("link" + i, title.attr("href"));

		}

		// System.out.println(map+"제발요 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ");
		// ArrayList<String> results = null;
		// results.add(title.text());

		return map;
	}*/
	

	class Typetester {
		void printType(List x) {
			System.out.println(x + " is an List");
		}

		void printType(HashMap x) {
			System.out.println(x + " is an HashMap");
		}

		void printType(Map x) {
			System.out.println(x + " is an Map");
		}

		void printType(Elements x) {
			System.out.println(x + " is an Elements");
		}

		void printType(float x) {
			System.out.println(x + " is an float");
		}

		void printType(double x) {
			System.out.println(x + " is an double");
		}

		void printType(char x) {
			System.out.println(x + " is an char");
		}
	}

}
