<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:import url="/include/top.jsp"/>

<section>
<br>
<div align="center"><h2>충전소 상세보기 ${m.idx }</h2></div>
	<br>
	  <table border=1 width=600 align="center">
	  			<tr>
	  				<td colspan=2>	
	  					<div id="map" style="width:100%;height:450px;"></div>
	  						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}&libraries=services"></script>
							<script type="text/javascript" >
							
							var  csNm = "${m.csNm}";
							var  addr = "${m.addr}";
							// 넘어온 값 확인
							// alert("csNm : " + csNm + " addr : " + addr)
							
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = {
							        //center: new kakao.maps.LatLng(36.5498747, 127.9260111), // 지도의 중심좌표
							        //level: 12 // 지도의 확대 레벨
							        center: new kakao.maps.LatLng(37.594371, 126.923464), // 지도의 중심좌표
							        level: 4 // 지도의 확대 레벨
							    };  
							
							// 지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer, mapOption); 
							
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();
							
							
							var	positions= [{
										csNm : csNm,
										addr : addr
							}];
							
						 	
					
							positions.forEach(function (k) { //추가한 코드
							    // 주소로 좌표를 검색합니다
							    geocoder.addressSearch(addr, function(result, status) {
						            	
							    	// 정상적으로 검색이 완료됐으면
							        if (status === kakao.maps.services.Status.OK) {
									  // 좌표값 리턴 확인
									  //alert(result[0].y + " : " + result[0].x)
							          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
							          // 결과값으로 받은 위치를 마커로 표시합니다
							          var marker = new kakao.maps.Marker({
							            map: map,
							            position: coords,
							          });
					
							          // 인포윈도우를 생성합니다
					                  var infowindow = new kakao.maps.InfoWindow({
					                	  
					                      content: '<div style="width:150px;text-align:center;padding:6px 0;">' + csNm + '</div>',
					                      removable : true
					                  });
					                      
					                  // 마커에 클릭이벤트를 등록합니다
					                  kakao.maps.event.addListener(marker, 'click', function() {
					                        // 마커 위에 인포윈도우를 표시합니다
					                        infowindow.open(map, marker);  
					                  });
					                  // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map.setCenter(coords);
								    } 
								});
							}); 

					</script>
	  				</td>
				<tr>
				    <td align="center" style="font-weight: bold;" width=70>충전소명</td>
				    <td><input type="text" name=csNm value="${m.csNm}" size="50%"></td>
				<tr>
				    <td align="center" style="font-weight: bold;" width=170>주소</td>
				    <td><input type="text" name=addr value="${m.addr}" size="50%"></td>
				<tr>    
				    <td align="center" style="font-weight: bold;" width=200>종류</td>
				    <td><input type="text" name=cpStat value="${m.cpStat}" size="50%"></td>
				<tr>
				    <td align="center" style="font-weight: bold;" width=280>충전속도</td>
				    <td><input type="text" name=cpNm value="${m.cpNm}" size="50%"></td>
				
				</tr> 
	  </table>
	  <br><br>
</section>
<%@ include file ="/include/footer.jsp" %>

<c:import url="/include/footer.jsp"/>
