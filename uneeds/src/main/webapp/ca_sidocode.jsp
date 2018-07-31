<%@page import="java.util.Objects"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/xml; charset= UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%

StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode"); /*URL*/
urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "= 1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D"); /*Service Key*/
urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("1T7BS1EDFAZ2UpQNRMnhaTeNc%2FF0Mv2DGlpwUgzubu22EGQofVc%2BqWuWTOYydw%2BryYH3uIsZRCc1g8FfZbPzYA%3D%3D (URL - Encode)", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과수*/
urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
urlBuilder.append("&" + URLEncoder.encode("areaCodeYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*서비스명=어플명*/

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
