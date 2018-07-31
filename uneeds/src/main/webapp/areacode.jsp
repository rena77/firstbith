<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>areacode.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ucYte0wemG4pQC7n_XNz"></script>
<script>
	var map; // 맵 
	var markers = [];
	var contentString; // 마커 내용
	var infowindows = [];

	//성공 함수	
	function bindSelsido(data, state) {
		var items = $(data).find("item");
		var sg = $("#selsido");
		for (var i = 0; i < items.length; i++) {
			item = $(items[i]);
			sg.append("<option value ='" + item.find("code").text() + "'>" + item.find("name").text() + "</option>");
		}
	}

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
		$.get("ca_sidocode.jsp", {areaCode : this.value}, bindSelsido);

		$.get("ca_areacode.jsp", bindSelgu);

		$("#selsido").on("change", function() {
			$.get("ca_areacode.jsp", {areaCode : this.value}, bindSelgu);
		});

		$("#btnSearch").on("click", function(e) {
			$.get("ca_sightseeing.jsp",{areaCode : $("#selsido").val(),sigunguCode : $("#selGu").val()},
				function bindList(data, state) {
					var items = $(data).find("item");
						for (var i = 0; i < items.length; i++) { 
							item = $(items[i]);
							console.log(item.find("title").text());
							
							contentString = [
								'<div class="'+ item.find("title").text()+ '">',
								'   <h3>'+ item.find("title").text()+ '</h3>',
								'   <p>'+ item.find("addr1").text()+ '<br />',
								'       <img src="'+ item.find("firstimage").text()+ '"width="55" height="55" alt="'+ item.find("title").text()+ '" class="thumb" /><br />',
								'       '+ item.find("tel").text()+ '<br />',
								'   </p>', '</div>' ].join('');
							
							// 지도 마커 표시
							var marker = new naver.maps.Marker({
								position : new naver.maps.LatLng(item.find("mapy").text(), item.find("mapx").text()),
								map : map});
							//

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

		// 최초 지도 표시
		map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 10
		});
		//

	});
</script>
</head>
<body>
	<h1 class="text-center">국내 관광 명소</h1>
	<ul class="list-inline text-center" id="ul">
		<li><select id="selsido" style="width: 100px; height: 25px;"></select></li>
		<li><select id="selGu" style="width: 100px; height: 25px;"></select></li>
		<li><button type="button" id="btnSearch" class="btn btn-default">SEARCH</button></li>
	</ul>

	<div align="center">
		<div id="map" style="align-items: center; width: 80%; height: 600px;"></div>
	</div>

</body>
</html>