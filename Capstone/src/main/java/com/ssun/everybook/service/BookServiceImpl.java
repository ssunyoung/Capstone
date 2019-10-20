package com.ssun.everybook.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService {

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

	@Override
	public String aladinCrawler() throws IOException {

		String query = "c언어 익스프레스";
		String url = "https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=Used&SearchWord="
				+ URLEncoder.encode(query, "euc-kr") + "&CategorySearch=&chkKeyTitle=on";

		Document rawData = Jsoup.connect(url).get();
		// System.out.println(rawData.toString());

		// 개수
		Elements usedBookNum = rawData.select("span[class=bo_used_s]");
		// String usedBookPrice2 = usedBookPrice.text();

		System.out.println(usedBookNum);
		System.out.println("*************************************************************"); //
		// System.out.println(usedBookPrice2); // 재고 개수 구하기 완료

		for (Element usedBookNums : usedBookNum) {

			String result = usedBookNums.text();

			System.out.println("###Result===>" + result);

		}

		// 가격 구하기.
		Elements usedBookPrice = rawData.select("td:nth-child(4) table tbody tr:nth-child(4) td a[class=bo_used] b");
		for (Element usedBookPrices : usedBookPrice) {

			// System.out.println("usedBookPrices->>"+usedBookPrices);
			String result = usedBookPrices.text();

			System.out.println("***Result===>" + result);

		}

		return null;
	}

	@Override
	public String yes24Crawler() throws IOException {
		String query = "c언어 익스프레스";
		String url = "http://www.yes24.com/searchcorner/Search?keywordAd=&keyword=&domain=USED_GOODS&qdomain=UsedGoods&query="
				+ URLEncoder.encode(query, "euc-kr");

		Document rawData = Jsoup.connect(url).get();

		Elements title = null;
		Elements img = null;
		Elements orgPrice = null;
		Elements salePrice = null;
		Elements writer = null;
		Elements publisher = null;
		Elements pubDate = null;
		// Elements stockStatus = null;
		Elements stockNum = null;
		// 홀수만 출력 1 3 5 7 9
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
			System.out.println("stockNum" + stockNum.text());
			System.out.println("publisher" + publisher.text());
			System.out.println("pubDate" + pubDate.text());
			System.out.println("writer" + writer.text());
			System.out.println("ORGPRice" + orgPrice.text());
			System.out.println("Sale" + salePrice.text());
			System.out.println("CoverImg" + img.attr("src"));
			// link는 타이틀과 동일
			System.out.println("link" + title.attr("href"));
			System.out.println("title" + title.text());
		}

		// ArrayList<String> results = null;
		// results.add(title.text());

		return null;
	}

	class Typetester {
		void printType(String x) {
			System.out.println(x + " is an String");
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
