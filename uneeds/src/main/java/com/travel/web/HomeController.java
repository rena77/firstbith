package com.travel.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;

import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Locale;
import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travel.model.TourcodeVO;
import com.travel.persistence.TourDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private TourDAO dao;

	@RequestMapping(value = "/viewtest")
	public String test(Locale locale, Model model) {
		return "viewtest";
	}
	
	@RequestMapping(value = "/main")
	public String main(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping(value = "/bookmark")
	public String bookmark(Locale locale, Model model) {
		return "bookmark";
	}

	@RequestMapping(value = "areasidocode", method = RequestMethod.GET)
	public ResponseEntity<String> areasidocode(HttpServletRequest request) throws Exception {

		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode"); /* URL */
		URL url = null;
		HttpURLConnection conn = null;
		BufferedReader rd = null;
		StringBuilder sb = new StringBuilder();
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/xml; charset=utf-8");

			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "= 1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D");
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode("1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D", "UTF-8")); /* 공공데이터포털에서 발급받은 인증키 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /* 한 페이지 결과수 */
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 현재 페이지 번호 */
			urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /* IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC */
			urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
			urlBuilder.append("&" + URLEncoder.encode("areaCodeYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /* 서비스명=어플명 */

			url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json; charset=utf-8");

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			String line = "";
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			
		System.out.println(sb.toString());
		return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}

	@RequestMapping(value = "areagungucode", method = RequestMethod.GET)
	public ResponseEntity<String> areagungucode(HttpServletRequest request) throws Exception {
		
		StringBuilder urlBuilder = new StringBuilder( "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode"); /* URL */
		URL url = null;
		HttpURLConnection conn = null;
		BufferedReader rd = null;
		StringBuilder sb = new StringBuilder();
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/xml; charset=utf-8");

			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "= 1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D"); /* Service Key */
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode("1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D (URL - Encode)", "UTF-8")); /* 공공데이터포털에서 발급받은 인증키 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /* 한 페이지 결과수 */
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 현재 페이지 번호 */
			urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /* IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC */
			urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */

			String areaCode = request.getParameter("areaCode");
			areaCode = Objects.isNull(areaCode) ? "1" : areaCode;

			urlBuilder.append("&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(areaCode, "UTF-8")); /* 서비스명=어플명 */

			url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json; charset=utf-8");

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			String line = "";
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();

		System.out.println(sb.toString());
		return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "coordinates", method = RequestMethod.GET)
	public ResponseEntity<String> coordinates(HttpServletRequest request) throws Exception {
		
		String areaCode = request.getParameter("areaCode");
		areaCode = Objects.isNull(areaCode) ? "1" : areaCode;
		String sigunguCode = request.getParameter("sigunguCode");
		sigunguCode = Objects.isNull(sigunguCode) ? "1" : sigunguCode;
		String contenttype = request.getParameter("contenttype");
		contenttype = Objects.isNull(contenttype) ? "12" : contenttype;

		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "= 1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D"); /*Service Key */
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode("1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D (URL- Encode)", "UTF-8")); /* 공공데이터포털에서 발급받은 인증키 */
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 현재 페이지 번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /* IOS (아이폰), AND (안드로이드),WIN (원도우폰), ETC */
		urlBuilder.append("&" + URLEncoder.encode("arrange", "UTF-8") + "=" + URLEncoder.encode("A", "UTF-8")); /* (A=제목순, B=조회순, C=수정일순, D=생성일순) , 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)  */
		urlBuilder.append("&" + URLEncoder.encode("cat1", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* 대분류 코드 */
		urlBuilder.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "=" + URLEncoder.encode(contenttype, "UTF-8")); /* 관광타입(관광지, 숙박 등) ID */
		urlBuilder.append("&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode(areaCode, "UTF-8")); /* 지역코드 */
		urlBuilder.append("&" + URLEncoder.encode("sigunguCode", "UTF-8") + "=" + URLEncoder.encode(sigunguCode, "UTF-8")); /* 시군구코드(areaCode 필수) */
		urlBuilder.append("&" + URLEncoder.encode("cat2", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* 중분류 코드(cat1필수) */
		urlBuilder.append("&" + URLEncoder.encode("cat3", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /* 소분류 코드(cat1,cat2필수) */
		urlBuilder.append("&" + URLEncoder.encode("listYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /* 목록 구분 (Y=목록, N=개수) */
		urlBuilder.append("&" + URLEncoder.encode("overviewYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /* 콘텐츠 개요 조회여부 */
		urlBuilder.append("&" + URLEncoder.encode("introYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /* 소개정보 조회 */

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/xml; charset=utf-8");

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());

		return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "detailedinformation", method = RequestMethod.GET)
	public ResponseEntity<String> detailedinformation(HttpServletRequest request) throws Exception {
		
		String contenttype = request.getParameter("contenttype");
		contenttype = Objects.isNull(contenttype) ? "12" : contenttype;
		String contentId = request.getParameter("contentId");

		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "= 1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D"); /*Service Key */
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode("1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D (URL- Encode)", "UTF-8")); /* 공공데이터포털에서 발급받은 인증키 */
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentId, "UTF-8")); /*콘텐츠 ID*/
        urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode(contenttype, "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
        urlBuilder.append("&" + URLEncoder.encode("introYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*소개정보 조회*/

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/xml; charset=utf-8");

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println("===========================================");
		System.out.println(sb.toString());

		return new ResponseEntity<String>(sb.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	/* 회원정보 등록 */
	@RequestMapping(value = "insertMapinfo", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, String> insertMemberAjax(HttpServletRequest r, TourcodeVO vo) {
		try {
			r.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 초기
		HashMap<String, String> states = new HashMap<>();
		states.put("state", "ok");
		// insert
		dao.insertMember(vo);
		
		return states;
	}
	
}
