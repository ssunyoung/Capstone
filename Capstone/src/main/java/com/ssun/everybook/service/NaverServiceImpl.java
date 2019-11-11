package com.ssun.everybook.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.stereotype.Repository;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.ssun.everybook.domain.SearchNaver;

@Repository
public class NaverServiceImpl implements NaverService {

	// naver start ======================
	private static String clientID = "EyNYH6PaYuHKkdxUQzWp";
	private static String clientSecret = "qvap_gL47N";

	// display ==> 몇개 출력
	// start==>몇번쨰부터 (item)
	public List<SearchNaver> searchBook(String keyword, int display, int start) {
		List<SearchNaver> list = null;
		try {
			URL url;
			url = new URL(
					"https://openapi.naver.com/v1/search/" + "book.xml?query=" + URLEncoder.encode(keyword, "UTF-8")
							+ (display != 0 ? "&display=" + display : "") + (start != 0 ? "&start=" + start : ""));

			URLConnection urlConn = url.openConnection();
			urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
			urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

			XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
			XmlPullParser parser = factory.newPullParser();
			parser.setInput(new InputStreamReader(urlConn.getInputStream()));
			// Test에서 했던 방식은 DOM방식이기때문에?
			// 그래서 이렇게 해도 된다?!??!??!?

			int eventType = parser.getEventType();
			SearchNaver SrcNav = null;

			while (eventType != XmlPullParser.END_DOCUMENT) {
				switch (eventType) {
				case XmlPullParser.END_DOCUMENT: // 문서의 끝
					break;
				case XmlPullParser.START_DOCUMENT:
					list = new ArrayList<SearchNaver>();
					break;
				case XmlPullParser.END_TAG: {
					String tag = parser.getName();
					if (tag.equals("item")) {
						list.add(SrcNav);
						SrcNav = null;
					}
				}
				case XmlPullParser.START_TAG: {
					String tag = parser.getName();
					switch (tag) {
					case "item":
						SrcNav = new SearchNaver();
						break;
					case "title":
						if (SrcNav != null)
							SrcNav.setTitle(parser.nextText().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
						break;
					case "link":
						if (SrcNav != null)
							SrcNav.setLink(parser.nextText());
						break;
					case "image":
						if (SrcNav != null)
							SrcNav.setImage(parser.nextText());
						break;
					case "author":
						if (SrcNav != null)
							SrcNav.setAuthor(parser.nextText().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
						break;
					case "price":
						if (SrcNav != null)
							SrcNav.setPrice(parser.nextText());
						break;
					case "discount":
						if (SrcNav != null)
							SrcNav.setDiscount(parser.nextText());
						break;
					case "publisher":
						if (SrcNav != null)
							SrcNav.setPublisher(parser.nextText().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", ""));
						break;
					case "pubdate":
						if (SrcNav != null)
							SrcNav.setPubdate(parser.nextText());
						break;
					case "isbn":
						if (SrcNav != null)
							SrcNav.setIsbn(parser.nextText());
						break;
					case "description":
						if (SrcNav != null)
							SrcNav.setDescription(parser.nextText());
						break;
					}

				}
				}
				eventType = parser.next();
			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (XmlPullParserException e) {
			e.printStackTrace();
		}
		return list;
	}

}
