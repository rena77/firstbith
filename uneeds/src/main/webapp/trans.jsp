<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function goPopup() {
		var pop = window.open("jusoPopup", "pop", "width=570,height=420, scrollbars=yes,resizable=yes");
		//josuPopup은 도로명 주소 샘플에 있는 jsp 파일입니다. Controller에서 뷰와 연결해주시면 됩니다. 
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn) {
		$.ajax({
			type : 'post',
			url : '/trans',
			data : {
				'address' : encodeURIComponent(roadFullAddr)
			}, //encodeURIComponent로 인코딩하여 넘깁니다. 
			dataType : 'json',
			timeout : 10000,
			cache : false,
			error : function(x, e) {
				alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');
			},
			success : function(data) {
				console.log(data); //결과값이 JSON으로 파싱되어 넘어옵니다. 
				var lng = data.result.items[0].point.x; //결과의 첫번째 값의 좌표를 가져옵니다. 상세주소 없이 검색된 경우에는 결과가 
				var lat = data.result.items[0].point.y; //여러개로 넘어 올 수 있습니다.
				console.log(lng);
				console.log(lat);
			}
		});
	};
	function action(){
		
	}
	
</script>
</head>
<body>
	<form>
	<input type="text">
	<button onclick="goPopup(this.form);">등록</button>
	</form>
</body>	
</html>