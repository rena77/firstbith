<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>UNEEDS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- login -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="412414727668-s6eej5gc6l0emtej7ccvr949oo2l68hg.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3-min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/main/css/login.css" rel="stylesheet"/>
<style>
	.nav-link{
		display: inline-block; color:white;
		font: white; font-weight: bold;
		padding-right: 20px;padding-top: 15px;padding-bottom: 15px;
	}
	.nav-link:hover{
		color: gold;
	}
	a:hover{
		text-decoration: none;
	}
</style>
</head>
<body>
<%
	String id = (String)session.getAttribute("userid"); 
%>
<%
		//로그인이 아닐 때
		if (id == null) {
	%>
	<div align="right" style="padding-top: 10px;">
		<a href="#" style="padding-right: 10px;"> 
		<img src="../resources/main/img/n.png" alt="naver" style="width:25px;height: 25px;">
		</a>
		<a href="#" style="padding-right: 10px;"> 
		<img src="../resources/main/img/k.png" alt="kakao" style="width:25px;height: 25px;">
		</a>
		<a href="/uneeds/login" style="padding-right: 10px;"> 
		<img src="../resources/main/img/u.png" alt="uneeds" style="width:25px;height: 25px;">
		</a>
		<button type="button" class="btn btn-primary btn-sm"  style="margin-right: 20px;" 
		onclick="uneeds_join.jsp','','width=400,height=500,left=600')">JOIN</button>
	</div>
	<%} else { %>
	<div align="right" style="padding-top: 10px;">
		<%= id %> 님이 로그인 중입니다.
	</div>
	<%}%>
</body>
</html>