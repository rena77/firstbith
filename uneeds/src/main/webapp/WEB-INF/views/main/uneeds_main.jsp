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

	<jsp:include page="uneeds_main_top.jsp" flush="false"/>
	
	<div class="container-fluid" align="center" style="padding-bottom: 10px;">
		<a href="#"> 
		<img src="../resources/main/img/mainlogo.png" alt="mainlogo" style="width: 20%;">
		</a>
	</div>

	<div class="bg-primary sticky-top" align="center">
		<a class="nav-link" href="/uneeds/book/">도서</a>
		<a class="nav-link" href="/uneeds/food/main">맛집</a>
		<a class="nav-link" href="/uneeds/travel/viewtest">여행+</a>
		<a class="nav-link" href="/uneeds/medical/main_view">의료</a>
		<a class="nav-link" href="/uneeds/movie/main">영화/엔터</a>
		<a class="nav-link" href="/uneeds/">공연/전시</a>
		<a class="nav-link" href="/uneeds/admin/main">ADMIN</a>
	</div>
	<!-- 1단 -->
	<div class="row">
		<div class="col-lg-2" align="center" style="background-color: white; height: 350px;">
		</div>
		<div class="col-lg-6" align="center" style="background-color: #D358F7; height: 350px;">
		
		</div>
		<div class="col-lg-2" align="center" style="background-color: #819FF7; height: 350px;">
		
		</div>
		<div class="col-lg-2" align="center" style="background-color: #CED8F6; height: 350px;">
		
		</div>
	</div>
	<!-- 2단 -->
	<div class="row">
		<div class="col-lg-2" align="center" style="background-color: white; height: 400px;">
		</div>
		<div class="col-lg-4" align="center" style="background-color: gold; height: 400px;">
		
		</div>
		<div class="col-lg-4" align="center" style="background-color: #F7819F; height: 400px;">
		
		</div>
		<div class="col-lg-2" align="center" style="background-color: white; height: 400px;">
		</div>
	</div>
	<!-- 3단 -->
	<div class="row">
		<div class="col-lg-2" align="center" style="background-color: white; height: 200px;">
		</div>
		<div class="col-lg-6" align="center" style="background-color: #BFFF00; height: 200px;">
		
		</div>
		<div class="col-lg-2" align="center" style="background-color: #01DFD7; height: 200px;">
		
		</div>
		<div class="col-lg-2" align="center" style="background-color: white; height: 200px;">
		</div>
	</div>
	<!-- 4단 -->
	<div class="row">
		<div class="col-lg-2" align="center" style="background-color: white; height: 400px;">
		</div>
		<div class="col-lg-3" align="center" style="background-color: pink; height: 400px;">
		
		</div>
		<div class="col-lg-5" align="center" style="background-color: #D8F781; height: 400px;">
		
		</div>
		<div class="col-lg-2" align="center" style="background-color: white; height: 400px;">
		</div>
	</div>
	<!-- 5단 -->
	<div class="row">
		<div class="col-lg-2" align="center" style="background-color: white; height: 200px;">
		</div>
		<div class="col-lg-6" align="center" style="background-color: #BFFF00; height: 200px;">
		
		</div>
		<div class="col-lg-2" align="center" style="background-color: #01DFD7; height: 200px;">
		
		</div>
		<div class="col-lg-2" align="center" style="background-color: white; height: 200px;">
		</div>
	</div>
	<!-- body 끝 -->
	<!-- foot -->
	<div class="container" align="center"
		style="background-color: #EFF2FB; font-size: xx-small;">
		이용약관 개인정보처리방침 책임의 한계와 법적고지 UNEEDS 고객센터<br> 본 콘텐츠의 저작권은 저작권자 또는 제공처에
		있으며, 이를 무단 이용하는 경우 저작권법 등에 따라 법적 책임을 질 수 있습니다.<br> 비트캠프 서울시 서초구
		서초동 1327-15 비트아카데미빌딩｜ 사업자등록번호 : 214-85-24928<br> (주)비트컴퓨터 / 문의
		: 02-3486-9600 / 팩스 : 02-6007-1245<br> 통신판매업 신고번호 : 제 서초-00098호
		/ 개인정보보호관리책임자 : 권도혁<br> UNEEDS BIT Copyright © UNEEDS BIT Corp.
		All Rights Reserved.<br>
	</div>
</body>
</html>