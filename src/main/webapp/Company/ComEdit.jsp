<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:import url="/include/top.jsp"/>

<section>
<br>
<div align="center"><h2>중소기업 상세보기 ${m.idx }</h2></div>
	<br>
	  <table border=1 width=300 align="center">
	  			<tr>
	  				<td colspan=2>
	  					<div id="map" style="width:100%;height:200px;"></div>							
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}"></script>
							<script>
							
							var  title = "${m.entrprsNm }" ;
							var  lat = "${m.latitude}";
							var  lon = "${m.logitude}";
							var  rdnmadr = "${m.rdnmadr}";
							
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
							    mapOption = { 
							        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
							        level: 5 // 지도의 확대 레벨  35.2382905 128.692398 (경남도청)
							    };
							
							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							
							
							
							<c:forEach var="k"  items="${li}">
						       title.push("${k.entrprsNm }")
						       lat.push("${k.latitude}")
						       lon.push("${k.logitude}")
						       rdnmadr.push("${k.rdnmadr}")
						       idx.push("${k.idx}")
						    </c:forEach>
						     
							// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다
							
							var positions = [];
						
							for (i=0 ; i <= title.length ; i++ ){
								positions[i] = {
										content : ' <div style="padding:5px;"> '+ title +' <br> ' 
												+ '  '  + rdnmadr + '<br>'
												+ '</div>',
										latlng : new kakao.maps.LatLng(lat, lon)
								};
							}
							
							for (var i = 0; i < positions.length; i ++) {
							    // 마커를 생성합니다
							    var marker = new kakao.maps.Marker({
							        map: map, // 마커를 표시할 지도
							        position: positions[i].latlng // 마커의 위치
							    });
							
							    // 마커에 표시할 인포윈도우를 생성합니다 
							    var infowindow = new kakao.maps.InfoWindow({
							        content: positions[i].content // 인포윈도우에 표시할 내용
							    });
							
							    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
							    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
							    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
							    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
							    // kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
							}
							
							// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
							function makeOverListener(map, marker, infowindow) {
							    return function() {
							        infowindow.open(map, marker);
							    };
							}
							
							// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
							function makeOutListener(infowindow) {
							    return function() {
							        infowindow.close();
							    };
							}
				            map.setCenter(coords); // 선택된 주소의 좌표로 지도 중심 이동
				            
							</script>
	  				</td>
				<tr>
				    <td align="center" style="font-weight: bold;" width=70>회사대표</td>
				    <td width=60%><input type="text" name=rprsntvNm value="${m.rprsntvNm}"></td>
				<tr>    
				    <td align="center" style="font-weight: bold;" width=200>회사명</td>
				    <td><input type="text" name=entrprsNm value="${m.entrprsNm}"></td>
				<tr>
				    <td align="center" style="font-weight: bold;" width=280>대표상품</td>
				    <td><input type="text" name=mainGoods value="${m.mainGoods}"></td>
				<tr>
				    <td align="center" style="font-weight: bold;" width=170>주소</td>
				    <td><input type="text" name=rdnmadr value="${m.rdnmadr}"></td>
				</tr> 
	  </table>
</section>
<%@ include file ="/include/footer.jsp" %>

<c:import url="/include/footer.jsp"/>
