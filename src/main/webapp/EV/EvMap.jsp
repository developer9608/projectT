<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:import url="/include/top.jsp"/>

<section>
<br>
<div align="center">
 <h2> 전국 전문대학교 분포도 ( 주소를 이용한 마커 표시하기 )  </h2>
 <hr width=80%>
<div id="map" style="width:70%;height:450px;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}&libraries=services"></script>
		<script type="text/javascript" >

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
		
		var  idx = new Array();
		var  csNm = new Array();
		var  addr = new Array();

		<c:forEach var="k"  items="${li}">
        	 idx.push("${k.idx}");
	         csNm.push("${k.csNm}");
	         addr.push("${k.addr}");
	    </c:forEach>
	 	
		var positions = [];
		
		for (i=0 ; i <= csNm.length ; i++ ){
			positions[i] = {
					idx : idx[i],
					csNm : csNm[i],
					addr : addr[i]
			};
		}
	 	

		positions.forEach(function (k) { //추가한 코드
		    // 주소로 좌표를 검색합니다
		    geocoder.addressSearch(k.addr, function(result, status) {
	            	
		    	// 정상적으로 검색이 완료됐으면
		        if (status === kakao.maps.services.Status.OK) {

		          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		          // 결과값으로 받은 위치를 마커로 표시합니다
		          var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords,
		          });

		          // 인포윈도우를 생성합니다
                  var infowindow = new kakao.maps.InfoWindow({
                	  
                      content: '<div style="width:150px;text-align:center;padding:6px 0;">' + k.csNm + '<br>'
                      			+ '<a href="${path}/EvEdit.do?idx='+ k.idx +'" style="color:blue">기업상세보기</a></div>',
                      removable : true
                  });
                      
                  // 마커에 클릭이벤트를 등록합니다
                  kakao.maps.event.addListener(marker, 'click', function() {
                        // 마커 위에 인포윈도우를 표시합니다
                        infowindow.open(map, marker);  
                  });
			    } 
			});
		}); 

</script>

</div>
<br><br>
</section>

<%@ include file ="/include/footer.jsp" %>
