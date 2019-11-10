package com.ssun.everybook.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Repository;

import com.ssun.everybook.domain.LibraryInput;
import com.ssun.everybook.domain.LibraryVO;
import com.ssun.everybook.persistence.LibraryDAO;

@Repository
public class LibraryServiceImpl implements LibraryService {

	@Inject
	private LibraryDAO dao;

	@Override
	public List<LibraryVO> listLibrary(LibraryInput libInput) throws Exception {
		System.out.println("SERVICE____________libInput" + libInput);
		return dao.listLibrary(libInput);
	}

	@Override
	public String libraryApi(String libCode, String isbn) {
		String apiKey = "8f07890778b91267156c968dafac735985cff0822b09c7d348192efd72bf8498";
		InputStream is = null;
		String resultSet = null;
		try {
			String requestUrl = "http://data4library.kr/api/bookExist";
			requestUrl += "?authKey=" + apiKey;
			requestUrl += "&libCode=" + libCode;
			requestUrl += "&isbn13=" + isbn;
			requestUrl += "&format=json";
			is = new URL(requestUrl).openStream();
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			String str;
			StringBuffer buffer = new StringBuffer();
			while ((str = rd.readLine()) != null) {
				buffer.append(str);
			}
			String receiveMsg = buffer.toString();

//			System.out.println("111111111111111111111111111\n" + receiveMsg + "service");

			Object obj = JSONValue.parse(receiveMsg);

	//		System.out.println("222222222222222222222222222\n" + obj);

			JSONObject object = (JSONObject) obj;

			// System.out.println("33333333333333333333333333\n"+object);

		//	System.out.println("44444444444444444444444444\n" + object.get("response"));
			JSONObject parse = (JSONObject) object.get("response");
//			System.out.println("\n\n\n" + parse);
			resultSet = (String) parse.get("result");
		//	System.out.println("ppppppppppppppppppp"+pp);


		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("=====================================================\n");
		System.out.println(resultSet);
		System.out.println("=====================================================\n");
		return resultSet;
	}

}
