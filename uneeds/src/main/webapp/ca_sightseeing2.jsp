<%@page import="java.util.Objects"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/xml; charset= UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
	String areaCode = request.getParameter("areaCode");
	areaCode = Objects.isNull(areaCode) ? "1" : areaCode;
	String sigunguCode = request.getParameter("sigunguCode");
	sigunguCode = Objects.isNull(sigunguCode) ? "1" : sigunguCode;
	
StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro"); /*URL*/
urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "= 1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D"); /*Service Key*/
urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D (URL- Encode)", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드),WIN (원도우폰), ETC*/
urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("A", "UTF-8")); /*(A=제목순, B=조회순, C=수정일순, D=생성일순) , 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)*/
urlBuilder.append("&" + URLEncoder.encode("cat1","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*대분류 코드*/
urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("38", "UTF-8")); /*관광타입(관광지, 숙박 등) ID*/
urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode(areaCode, "UTF-8")); /*지역코드*/
urlBuilder.append("&" + URLEncoder.encode("sigunguCode","UTF-8") + "=" + URLEncoder.encode(sigunguCode, "UTF-8")); /*시군구코드(areaCode 필수)*/
urlBuilder.append("&" + URLEncoder.encode("cat2","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*중분류 코드(cat1필수)*/
urlBuilder.append("&" + URLEncoder.encode("cat3","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소분류 코드(cat1,cat2필수)*/
urlBuilder.append("&" + URLEncoder.encode("listYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*목록 구분 (Y=목록, N=개수)*/
urlBuilder.append("&" + URLEncoder.encode("overviewYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*콘텐츠 개요 조회여부*/
URL url = new URL(urlBuilder.toString());
HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setRequestMethod("GET");
conn.setRequestProperty("Content-type", "application/json");
System.out.println("Response code: " + conn.getResponseCode());
BufferedReader rd;
if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
out.print(sb.toString());
%>
