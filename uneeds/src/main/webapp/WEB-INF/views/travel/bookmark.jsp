<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//로그인이 아닐 때
		if (session.getAttribute("userid") == null) {
	%>
		<script>
			alert("로그인 후 등록해주세요.");
			history.back();
		</script>
	<%} else { %>
 		<script>
 			alert("등록되었습니다.");
 			history.back();
 		</script>
 	<% } %>
</body>
</html>