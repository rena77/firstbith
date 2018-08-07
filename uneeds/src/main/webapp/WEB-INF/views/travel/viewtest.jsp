<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ucYte0wemG4pQC7n_XNz"></script>

<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="./resources/css/app.d6157d9993ceb446bea8.css">
<link rel ="stylesheet" id="gnb_style" type="text/css" href="./resources/css/gnb.css">

<!-- 선택시 맵 변경 부분 -->
<script>

var map; // map 표시 (최초 맵과 맵 표시 부분을 공용으로 사용)
var HOME_PATH = window.HOME_PATH || '.';  //   ../web/ 을 써줌
var contentString; // 마커 내용
var markers = []; // 마커 배열
var infowindows = []; // 정보 배열

	// 최초 맵 표시 부분
	$(function(){
		map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.4978992118, 127.0276129349), // 강남 좌표
			zoom : 10
		});
	})
			
	function mapchange(data){					
		var items = $(data).find("item"); // api로 가지고온 데이터
		
		deleteMarkers(map,markers);
		
		markers = [];
		infowindows = []; 
		
		for (var i = 0; i < items.length; i++){ // 데이터 map infowindow에 뿌림
			item = $(items[i]);
			contentString = [
				'<div class= iw_inner>',
				'   <h3>'+ item.find("title").text()+ '</h3>',
				'   <p>'+ item.find("addr1").text()+ '<br />',
				'       <img src="'+ item.find("firstimage").text()+ '"width="55" height="55" alt="'+ item.find("title").text()+ '" class="thumb" /><br />',
				'       '+ item.find("tel").text()+ '<br />',
				'		<INPUT TYPE="hidden" NAME="hid1" VALUE="'+ item.find("contentid").text()+ '">',
        		'		<INPUT TYPE="hidden" NAME="hid2" VALUE="'+ item.find("contenttypeid").text()+ '">',
				'   </p>', 
				'</div>'
				].join('');

			// 마커 정보 표시창
			var infowindow = new naver.maps.InfoWindow({
				content : contentString});
			//
			
			// 지도 마커 위치
			var position = new naver.maps.LatLng(item.find("mapy").text(), item.find("mapx").text());
							
			var markerOptions = {
			    	position: position.destinationPoint(90, 15),
			    	map: map,
			    	icon: {
			        	url: HOME_PATH +'/resources/img/food2.png',
			        	size: new naver.maps.Size(50, 50),
			        	origin: new naver.maps.Point(0, 0),
			        	anchor: new naver.maps.Point(25, 26)
			    	}
				};

			var marker = new naver.maps.Marker(markerOptions);

			markers.push(marker);
			infowindows.push(infowindow);
			
		}

		// 지도 이동
		var select = new naver.maps.Point(item.find("mapx").text(), item.find("mapy").text()); //마지막 좌표값으로 지도 이동
		map.setCenter(select);
		//

		naver.maps.Event.addListener(map, 'idle' , function() { //idle 지도의 움직임이 종료되었을 때(유휴 상태) 이벤트가 발생
			updateMarkers(map,markers);			// 마커 표시 추가
		});

		for (var i = 0, ii = markers.length; i < ii; i++) {	// click 시 gethandler 사용 하여 지도 마커 내용 온/오프
			naver.maps.Event.addListener(markers[i] , 'click' , getClickHandler(i));
		}

	}
	
	function deleteMarkers(map, markers) {
		var mapBounds = map.getBounds();
		var marker, position, infoWindow;

		for (var i = 0; i < markers.length; i++) {
			marker = markers[i];
			position = marker.getPosition();
			infoWindow = infowindows[i];
		
			if (mapBounds.hasLatLng(position) || infoWindow.getMap()) {
				hideMarker(map, marker);	// 마커 사라지기
				infoWindow.close();
			}
		}         
	}
		
	function updateMarkers(map,markers) {
		var mapBounds = map.getBounds();
		var marker, position;

		for (var i = 0; i < markers.length; i++) {
			marker = markers[i];
			position = marker.getPosition();
		
			if (mapBounds.hasLatLng(position)) {
				showMarker(map, marker);	// 마커 보여주기
			} else {
				hideMarker(map,marker);		// 마커 사라지기
			}
		}
	}
		
	// Marker show / hide 변경
	function showMarker(map, marker) {
		if (marker.setMap())
		return;
		marker.setMap(map);
	}

	function hideMarker(map, marker) {
		if (!marker.setMap())
		return;
		marker.setMap(null);
	}

	// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
	function getClickHandler(seq) {
		return function(e) {
			var marker = markers[seq], infoWindow = infowindows[seq];
			
			if (infoWindow.getMap()) {
				infoWindow.close();
			} else {
				map.setCenter(new naver.maps.Point(markers[seq].position.x, markers[seq].position.y));
				infoWindow.open(map,marker);
			}
		}
	}
	
	function listClickHandler(seq) {
			var marker = markers[seq], infoWindow = infowindows[seq];
			if (infoWindow.getMap()) {
				infoWindow.close();
			} else {
				map.setCenter(new naver.maps.Point(markers[seq].position.x, markers[seq].position.y));
				infoWindow.open(map,marker);
			}
	}
	
	// 마커 클릭시 값 가져오기
</script>

<script>
  function detailshowhide(){
	  
	  var ul1 = $("#list_place_col");
	  var ul2= $("#list_place_col1");
	  
	  if(ul1.css("display") == "none"){
		    ul1.show();
		    ul2.hide();
		} else {
		    ul1.hide();
		    ul2.show();
		}
  }
</script>



<!-- 선택시 맵 변경 부분 -->
<script>
	function detailedinformationlist(data){
		var item = $(data).find("item");
				
		var contenttypeid = item.find("contenttypeid").text();
		var divlist = $('#listid_'+item.find("contentid").text());
		
		var ul = $("#list_place_col1");
		ul.empty();
		
		detailshowhide();
		
		console.log('#listid_'+item.find("contentid").text());
		
		switch (contenttypeid){
			case '12' : // 관광지 
				ul.append(
					"<li class=list_item type_restaurant=''>" +
						"<div class=list_item_inner>" +
								"<span>유모차대여 정보 : </span><span>" + item.find("chkbabycarriage").text()+ "</span></br>" +
								"<span>신용카드가능 정보 : </span><span>" + item.find("chkcreditcard").text()+ "</span></br>" +
								"<span>애완동물동반가능 정보 : </span><span>" + item.find("chkpet").text()+ "</span></br>" +
								"<span>문의 및 안내 : </span><span>" + item.find("infocenter").text()+ "</span></br>" +
							"</div>" +
						"<div class=list_item_inner>" +
							"</div>" +
						"<div class=list_item_inner>" +
							"<h3><span> 함께 검색한 장소 </span></h3>" +
							"</div>" +
						"<div class=list_item_inner>" +
							"<h3><span> 리뷰 </span></h3>" +
							"</div><button onclick = javascript:detailshowhide()>돌아가기</button></li>");
				break;
			case '14' : // 문화시설
				divlist.append("<div>" +	item.find("infocenterculture").text() + "</div>");
				break;
			case '15' : // 행사/공연/축제
				divlist.append("<div>" +	item.find("infocenterculture").text() + "</div>");
				break;
			case '25' : // 여행코스
				divlist.append("<div>" +	item.find("distance").text() + "</div>");
				divlist.append("<div>" +	item.find("taketime").text() + "</div>");
				break;
			case '28' : // 레포츠
				divlist.append("<div>" +	item.find("infocenterleports").text() + "</div>");
				break;
			case '32' : // 숙박
				divlist.append("<div>" +	item.find("infocenterlodging").text() + "</div>");
				break;
			case '38' : // 쇼핑
				divlist.append("<div>" +	item.find("infocentershopping").text() + "</div>");
				break;
			case '39' : // 음식점
				divlist.append("<div>" +	item.find("infocenterfood").text() + "</div>");
				break;
		}
		
	}
</script>

<%-- <script>

$(function(){
	$(document).on("click",".gnb_btn_bookmark", function() {
		var id = '<%=session.getAttribute("userid")%>';
		var trashParam = $(this).attr('id');
		var idarray = trashParam.split('_');
		if(id == 'null'){
			alert("로그인 후 등록해주세요.");
		}else {
			alert("등록되었습니다.");
		}
		var test = $(".infoarea").attr('data');
		
		console.log(test);
	});
	
	$(function(){
		 $(document).on("click",".infoarea", function() {
			var ul1 =  $("#list_place_col");
			var ul2 =  $("#list_place_col_list");
			
			var ul1 =  $("#list_place_col");
			
			var list = $(this).attr('data');
			var detailinfo = $(this).attr('data2');
			var detailinfotype = $(this).attr('data3'); 
			
			
			$.ajax({
				url : "detailedinformation",
				type : 'get',
				datatype : 'json', //respone 데이터 타입
				data : {
					"contenttype" : detailinfotype,
					"contentId" : detailinfo
					},
				success :	function(data){
					detailedinformationlist(data);
					listClickHandler(list);
				},
				error : function(request, status, error){ //에러 함수
					alert("ERROR");
				}
			});
		});
	})
})


</script> --%>

<script>
	function listpage(data){
		var test1= data.data1.value;
		var test2= data.data2.value;
		var test3= data.data3.value;
		var test = data.input1.value;
		console.log(test);
		console.log(test1);
		console.log(test2);
		console.log(test3);

		$(document).on("click",".gnb_btn_bookmark", function() {
			var id = '<%=session.getAttribute("userid")%>';
			var trashParam = $(this).attr('id');
			var idarray = trashParam.split('_');
			if(id == 'null'){
				alert("로그인 후 등록해주세요.");
			}else {
				alert("등록되었습니다.");
			}
			var test = $(".infoarea").attr('data');

		});
		
		$(document).on("click",".infoarea", function() {
			var ul1 =  $("#list_place_col");
			var ul2 =  $("#list_place_col_list");
			
			var ul1 =  $("#list_place_col");
			
			var list = $(this).attr('data');
			var detailinfo = $(this).attr('data2');
			var detailinfotype = $(this).attr('data3'); 
			
			
			$.ajax({
				url : "detailedinformation",
				type : 'get',
				datatype : 'json', //respone 데이터 타입
				data : {
					"contenttype" : detailinfotype,
					"contentId" : detailinfo
					},
				success :	function(data){
					detailedinformationlist(data);
					listClickHandler(list);
				},
				error : function(request, status, error){ //에러 함수
					alert("ERROR");
				}
			});
		});
	}

</script>

<!--  시도 구분 -->
<script>
	// 시군구 api를 통해서 list를 왼쪽 폴더창에 보여줌
	function bindList(data){
		var ul = $("#list_place_col");
		var items = $(data).find("item");
			ul.empty();
			for (var i = 0; i < items.length; i++){
				item = $(items[i]);
				
					ul.append("<li 'id'= '"+ item.find("title").text() + "' class= list_item type_restaurant>" +  
									"<div class = list_item_inner>" +
		    							"<a id = '_sls.img' class= 'thumb_area fr' href= '" + item.find("firstimage").text() + "' target=_blank>" +
										"<div class= thumb>" +
											"<img src='" + item.find("firstimage").text() + "' alt= '"+ item.find("title").text()+ "' width='100' height='100'>" +
										"</div>" +
										"</a>" +
										"<form name = form method = get>"+
										"<div class= info_area>" +
											"<div class= tit>" +
												"<span class=tit_inner>" +
												"<input class = 'infoarea' type = 'button'  name='input1' value='" + item.find("title").text() + "' onclick= javascript:listpage(this.form); data = '"+ i + "' data2= '" + item.find("contentid").text() + "' data3= '" + item.find("contenttypeid").text() + "'>" +
											"</input></span></div>" +
											"<div class = listid  id= 'listid_" + item.find("contentid").text() + "' title= '" + item.find("contentid").text() + "'></div>" +
												"<input class= 'gnb_btn_bookmark' name='input2' type= 'button'  value ='즐겨찾기' onclick= javascript:listpage(this.form);  id='gnb_bookmark_" + i +"'>" +
												"<input type='hidden' name = 'data1' class = 'data1' value = '"+ i +"'>" +
												"<input type='hidden' name = 'data2' class = 'data2' value = '" + item.find("contentid").text() + "'>" +
												"<input type='hidden' name = 'data3' class = 'data3' value = '" + item.find("contenttypeid").text() + "'>" +
											"</div></form></div></li>");
					
					$.post("insertMapinfo", {
						addr1 : item.find("addr1").text(),
						addr2 : item.find("addr2").text(),
						areacode : Number(item.find("areacode").text()),
						cat1 : item.find("cat1").text(),
						cat2 : item.find("cat2").text(),
						cat3 : item.find("cat3").text(),
						contentid : Number(item.find("contentid").text()),
						contenttypeid : Number(item.find("contenttypeid").text()),
						mapx : Number(item.find("mapx").text()),
						mapy : Number(item.find("mapy").text()),
						readcount : Number(item.find("readcount").text()),
						title : item.find("title").text()
					}).done(function(data, state) {
					});
			}
	}		
	
	//시도 구분하기
	function bindSelsido(data) {
		var items = $(data).find("item");
		var sg = $("#selsido");
		for (var i = 0; i < items.length; i++) {
			item = $(items[i]);
			sg.append("<option value ='" + item.find("code").text() + "'>" + item.find("name").text() + "</option>");
		}
	} 

	//군구 구분하기
	function bindSelgu(data) {
		var items = $(data).find("item");
		var sg = $("#selGu");
		sg.empty();
		for (var i = 0; i < items.length; i++) {
			item = $(items[i]);
			sg.append("<option value ='" + item.find("code").text() + "'>" + item.find("name").text() + "</option>");
		}
	}	
	
</script>

<!-- 최초 표현 -->
<script>
	// 최초 시도 표현
	$(function() {
	 		$.ajax({
			url : "areasidocode",
			type : 'get', // get/post 방식
			datatype : 'json', // response 데이터 타입
			success : bindSelsido,
			error : function(request, status, error){ //에러 함수
				alert("ERROR");
			}
		});
	})

// 최초 군구 표현
	$(function() {
		 	$.ajax({
			url : "areagungucode",
			type : 'get', // get/post 방식
			datatype : 'json', // response 데이터 타입,
			success : bindSelgu,
			error : function(request, status, error){ //에러 함수
				alert("ERROR");
			}
		});
	})
	
// 기본 표시 실행
	$(function(){
		$.ajax({
			url : "coordinates",
			type : 'get',
			datatype : 'json', //respone 데이터 타입
			data : {
				"areaCode" : 1, 
				"sigunguCode" : 1, 
				"contenttype" : 12
				},
			success : function(data){
				bindList(data);
				mapchange(data);
			},
			error : function(request, status, error){ //에러 함수
				alert("ERROR");
			}
		});
	})

</script>
<!-- 최초 표현 -->

<!-- 선택시 변경 -->
<script>

//시도 변경 시 군구 변경
$(function(){
	$("#selsido").on("change", function() {
		$.ajax({
			url : "areagungucode",
			type : 'get', // get/post 방식
			datatype : 'json', // response 데이터 타입
			data : {"areaCode" : this.value},
			success : bindSelgu,
			error : function(request, status, error){ //에러 함수
				alert("ERROR");
			}
		});
	});	
})

//버튼 클릭시 지도 표시
$(function(){
	$("#btnSearch").on("click", function() {
		$.ajax({
			url : "coordinates",
			type : 'get',
			datatype : 'json', //respone 데이터 타입
			data : {
				"areaCode" : $("#selsido").val(), 
				"sigunguCode" : $("#selGu").val(), 
				"contenttype" : $("#contenttype").val()
				},
			success :	function(data) { // 성공함수
				bindList(data);
				mapchange(data);
			}, 
			error : function(request, status, error){ //에러 함수
				alert("ERROR");
			}
		});
	});
})
</script>
<!-- 선택시 변경 -->

<!-- 높이 자동 조정 -->
<script>
function funLoad(){
    var Cheight = $(window).height();    
    
    $('.list_area').css({'height':Cheight -140+'px'});
    $('#map').css({'height':Cheight -140+'px'});
}
window.onload = funLoad;
window.onresize = funLoad;
</script>
<!-- 높이 자동 조정 -->

</head>
<body class="place_list">
	<!-- header 부분 -->
	<header id= "header" role="banner">
			<jsp:include page="topheader.jsp" flush="false"/>
	</header>
	<!-- header 부분 -->
	
	<!-- container 부분 -->
	<div id="container" role="main" data-reactroot="">
		<!-- 필터 부분 -->
		<div class="filter_area">
			<div class = "filter_group type_restaurant">
				<strong class="filter_label"><span>시</span></strong>
				<div class ="filter_group_inner">
					<select id="selsido" ></select>
				</div>
				
				<strong class="filter_label"><span>군구</span></strong>
				<div class ="filter_group_inner">
					<select id ="selGu"></select>
				</div>
				
				<strong class="filter_label"><span>타입</span></strong>
				<div class ="filter_group_inner">
					<select id ="contenttype" >
						<option value="12">관광지</option>
						<option value="14">문화시설</option>
						<option value="15">행사/공연/축제</option>
						<option value="25">여행코스</option>
						<option value="28">레포츠</option>
						<option value="32">숙박</option>
						<option value="38">쇼핑</option> 
						<option value="39">음식점</option>  
					</select>
				</div>
				<button type="button" id="btnSearch" class="btn btn-default">SEARCH</button>
			</div>
		</div>
		<!-- 필터 부분 -->
		
		<!-- list 부분 -->
		<div class="placemap_area">
			<div class="list_wrapper" style="width: 401px;">
				<div class="list_area" style="height: 700px; overflow-y: auto;">
					<ul class="list_place_col1" id ="list_place_col"></ul>
					<ul class="list_place_col1" id ="list_place_col1" style="display: none;"></ul>
		</div>
		<!-- list 부분 -->
		
				<!-- list 창 접기 -->
				<a id="btn_fold_list" class="btn_fold_list" aria-label="목록영역접기"
					href="javascript:void(0)" target="_self" style="display: block;"
					onclick="this.parentNode.style.width='0px'; this.style.display ='none'; document.getElementById('btn_fold_list_folded').style.display ='block';">
					<svg class="icon" version="1.1" width="11" height="7" viewBox="0 0 11 7">
						<path d="M5.5,6.846l-5.53-5.53L1.03,0.255L5.5,4.725l4.47-4.469l1.061,1.061L5.5,6.846z"></path></svg></a>
				 <a id="btn_fold_list_folded" class="btn_fold_list folded"
					aria-label="목록영역 접기" href="javascript:void(0)" target="_self"
					style="display: none;"
					onclick="this.parentNode.style.width='401px'; this.style.display ='none'; document.getElementById('btn_fold_list').style.display ='block';">
					<svg class="icon" version="1.1" width="11" height="7" viewBox="0 0 11 7">
						<path d="M5.5,6.846l-5.53-5.53L1.03,0.255L5.5,4.725l4.47-4.469l1.061,1.061L5.5,6.846z"></path></svg></a>
				
				<!-- list 창 접기 -->	
			</div>
			
			<!--  지도 창 -->
			<div class ="map_wrapper _list_dynamic_map_wrapper">
				<div class = "map_area type_dynamic _map_area">
						<div align="center">
							<div ></div>
							<div id="map" style="align-items: center; width: 100%; height: 1100px;"></div>
						</div>
				</div>
			</div>
			<!--  지도 창 -->
			
		</div>
	</div>
	<!-- container 부분 -->
	
</body>
</html>