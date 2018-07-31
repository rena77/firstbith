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

<link rel="stylesheet" type="text/css" href="../web/resources/css/app.d6157d9993ceb446bea8.css">
<link rel ="stylesheet" id="gnb_style" type="text/css" href="../web/resources/css/gnb.css">

<script>
	var map; // 맵 
	var markers = [];
	var contentString; // 마커 내용
	var infowindows = [];
	var HOME_PATH = window.HOME_PATH || '.';  //   ../web/ 을 써줌

	//시도 구분하기
	function bindSelsido(data, state) {	
		var items = $(data).find("item");
		var sg = $("#selsido");
		for (var i = 0; i < items.length; i++) {
			item = $(items[i]);
			sg.append("<option value ='" + item.find("code").text() + "'>" + item.find("name").text() + "</option>");
		}
	}
	
	
	//군구 구분하기
	function bindSelgu(data, state) {
		var items = $(data).find("item");
		var sg = $("#selGu");
		sg.empty();
		for (var i = 0; i < items.length; i++) {
			item = $(items[i]);
			sg.append("<option value ='" + item.find("code").text() + "'>" + item.find("name").text() + "</option>");
		}
	}
	
	$(function() {
		// 최초 지도 표시
		map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 10
		});
		//
		
		// 최초 시군구 표시
		$.get("ca_sidocode.jsp", {areaCode : this.value}, bindSelsido);

		$.get("ca_areacode.jsp", bindSelgu);

		$("#selsido").on("change", function() {
			console.log("최시군구변경");
			$.get("ca_areacode.jsp", {areaCode : this.value}, bindSelgu);
		});
		//

		$("#btnSearch").on("click", function(e) {
			$.get("ca_sightseeing.jsp", {areaCode : $("#selsido").val(), sigunguCode : $("#selGu").val(), contenttype : $("#contenttype").val()},
				function bindList(data, state) {
					var ul = $("#list_place_col");
					var items = $(data).find("item");
						ul.empty();
						for (var i = 0; i < items.length; i++){
							
							item = $(items[i]);
							console.log(item.find("title").text());
							
 							ul.append("<li 'id'= '"+ item.find("title").text() + "' class= list_item type_restaurant>" +  
											"<div class = list_item_inner>" +
					    				"<a id = '_sls.img' class= 'thumb_area fr' href= '" + item.find("firstimage").text() + "' target=_blank>" +
											"<div class= thumb>" +
												"<img src='" + item.find("firstimage").text() + "' alt= '"+ item.find("title").text()+ "' width='100' height='100'>" +
											"</div>" +
										"</a>" +
										"<div class= info_area>" +
											"<div class= tit>" +
												"<span class=tit_inner>" +
													"<a class=name title='" + item.find("firstimage").text() + "' href= '"+ item.find("firstimage").text() + "' target=_blank>" +
														"<span>"+ item.find("title").text() + "</span>" +
													"</a></span></div>" +
											"<div class=txt ellp>" +item.find("tel").text() +"</div></div></div></li>"); 
							
							contentString = [
								'<div class= iw_inner>',
								'   <h3>'+ item.find("title").text()+ '</h3>',
								'   <p>'+ item.find("addr1").text()+ '<br />',
								'       <img src="'+ item.find("firstimage").text()+ '"width="55" height="55" alt="'+ item.find("title").text()+ '" class="thumb" /><br />',
								'       '+ item.find("tel").text()+ '<br />',
								'   </p>', 
								'</div>'
								].join('');
							
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

							var marker = new naver.maps.Marker(markerOptions)
							// 지도 마커 표시

							// 마커 정보 표시창
							var infowindow = new naver.maps.InfoWindow({
								content : contentString});
							//

							markers.push(marker)
							infowindows.push(infowindow)
							}

							// 지도 이동
							e.preventDefault();
							var select = new naver.maps.LatLng(item.find("mapy").text(), item.find("mapx").text());
							map.panTo(select);
							//

							naver.maps.Event.addListener(map, 'idle',function() {
									updateMarkers(map,markers);
							});

							function updateMarkers(map,markers) {
								var mapBounds = map.getBounds();
								var marker, position;

									for (var i = 0; i < markers.length; i++) {
										marker = markers[i]
										position = marker.getPosition();
										
										if (mapBounds.hasLatLng(position)) {
											showMarker(map, marker);
										} else {
											hideMarker(map,marker);
									}
								}
							}

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
											infoWindow.open(map,marker);
											}
									}
								}

								for (var i = 0, ii = markers.length; i < ii; i++) {
									naver.maps.Event.addListener(
											markers[i],'click',getClickHandler(i));
									}
								infowindow.open(map, marker);
					});
			});
	});
	
</script>

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

<!-- list 창 바뀌기 -->

<!-- list 창 바뀌기 -->

</head>
<body class="place_list">
	<!-- header 부분 -->
	<header id= "header" role="banner">
		<div class="header_inner">
			<h1><img class="logo"  src="./resources/img/KakaoTalk_20180710_143413418.png">
			</h1>
		</div>	
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
					<ul class="list_place_col1" id ="list_place_col">
						
					</ul>
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