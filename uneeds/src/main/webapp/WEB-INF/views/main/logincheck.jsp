<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>LOGINcheck</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

<%
	String id = (String)session.getAttribute("userid"); 
	String lcode = (String)session.getAttribute("lcode");
	
	if (lcode.equals("1")) {
%>
<script>
	alert("환영합니다");
	window.close();
</script>
<% } else { 	
	session.removeAttribute("userid");%>
<script>
	alert("Uneeds로 로그인 해주세요.");
	window.close();
</script>
<%
	}
%>


<body>

</body>