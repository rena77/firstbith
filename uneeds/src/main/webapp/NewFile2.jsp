<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
	<title></title>
	<script type="text/javascript">
		function changehtml(){
			var property = document.getElementById('select').value;
			var show = document.getElementById('show');
			if(property=="text"){
				show.innerHTML ='<input type="text" title="텍스트입력" />';
			}else if(property=="radio") {
				show.innerHTML ='<input type="radio" name="sex" value="man" />남성 <input type="radio"  name="sex" value="woman" />여성';
			}else if(property=="checkbox") {
				show.innerHTML ='<input type="checkbox" name="hobby" value="fishing" />낚시 <input type="checkbox"  name="hobby" value="clim" />등산';
			}else if(property=="button") {
				show.innerHTML ='<input type="button" value="yes" onclick="hello();" />';
			}else if(property=="textarea") {
				show.innerHTML ='<textarea row="5" col="20">이것은 textarea</textarea>';
			}
		}
		function hello(){
			alert("안녕하세요 고객님");
		}
	</script>
</head>
<body>
	<!--<select id="select" onchange="changehtml();">-->
	<select id="select">
		<option value="text">text</option>
		<option value="radio">radio</option>
		<option value="checkbox">checkbox</option>
		<option value="button">button</option>
		<option value="textarea">textarea</option>
	</select>
	<input type="button" value="실행" onclick="changehtml();" />
	<div id="show" style="margin-top:30px;">

	</div>
</body>
</html>