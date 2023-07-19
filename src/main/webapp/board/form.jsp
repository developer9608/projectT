<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url ="/include/top.jsp"/>


<!-- 우편번호 kakao openApi -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function kakaoPostcode() {
    new daum.Postcode({
      oncomplete: function (data) {
        var addr = ''; // 주소 변수

        // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') {
          // 사용자가 도로명 주소를 선택한 경우
          addr = data.roadAddress;
        } else {
          // 사용자가 지번 주소를 선택한 경우
          addr = data.jibunAddress;
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('zipcode').value = data.zonecode;
        document.getElementById('address').value = addr;
        /* alert(document.getElementById('sample6_address').value = addr); */

        // 커서를 상세주소 필드로 이동한다.
        document.getElementById('addr3').focus();
      },
    }).open();
  }
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	var path = '${path}';

	function inK() {
		var pass = true;
		
		if(f1.id.value==""){
			alert("ID를 입력하세요");
			f1.id.focus()
			pass = false;
		}else if(f1.password.value==""){
			alert("암호를 입력하세요");
			f1.password.focus()
			pass = false;
		}else if ($("#custno").val() == "") {
			alert("회원번호가 입력되지 않음");
			f1.custno.focus()
			pass = false;
		} else if ($("#custname").val() == "") {
			alert("회원성명이 입력되지 않음");
			f1.custname.focus()
			pass = false;		
		} else if ($("#phone").val() == "") {
			alert("회원전화가 입력되지 않음");
			pass = false;		
		} else if ($("#address").val() == "") {
			alert("회원주소가 입력되지 않음");
			pass = false;		
		} else if ($("#joindateStr").val() == "") {
			alert("가입일자가 입력되지 않음");
			pass = false;		
		} else if ($("#city").val() == "") {
			alert("도시코드가 입력되지 않음");
			pass = false;
		}
		
		if (!pass) {
			return;
		}
		
		// 등록시 알림 동작		
		var dataStr = {
			id : $("#id").val(),
			password : $("#password").val(),
			custno: $("#custno").val(),
			custname: $("#custname").val(),
			phone: $("#phone").val(),
			zipcode: $("#zipcode").val(),
			address: $("#address").val(),
			addr3: $("#addr3").val(),
			joindateStr: $("#joindateStr").val(),
			grade: $("input[name='grade']:checked").val(),
			city: $("#city").val()
		};
				
		$.ajax({
			type: "GET",
			url: path + "/insertKorea.do",
			data: dataStr,
			success: function(k) {
				alert("회원등록 완료");
				location.replace("${path}/selectKoreaAll.do");
			}
		});
	}
	
	// 조회 버튼 동작
	function moveK() {
		location.replace("${path}/selectKoreaAll.do");
	}
</script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
jQuery.ajaxSetup({cache:false})
	var path = '${path}';
$(document).ready(function() {
	$("#ckBtn").click(function(){
		var idValue = $("#id").val();
		var dataStr = {
			id : idValue
		};
			
		$.ajax({
			type : "GET",
			url : path + "/IdCk.do",
			data : dataStr,
			success : function(data){
				if(data =="T"){
					alert("사용 가능한 ID입니다.")
				}else{
					alert("이미 존재하는 ID입니다.")
					$("#id").val("");
					$("#id").focus();
				}
			}			
		});
	});
});
</script>

<section>
<br>
<div align="center">
 <h2> 홈쇼핑 회원 등록</h2></div>
  <br>
   <form name="f1">
		<table border=1 width=700 height=250 align="center">
		     <tr>
		      	<td id=a1><b>회원번호(자동발생)</b></td>
		      	<td><input type="text" id=custno name=custno value="${custno}" readonly></td>
		     <tr>
		      	<td id=a1><b>아이디</b></td>
		      	<td>
		      		<input type="text" id=id name=id>
		      		<input type="button" id=ckBtn value="아이디체크">
		      	</td>
		     <tr>
		      	<td id=a1><b>패스워드</b></td>
		      	<td><input type="text" name=password id=password></td>
		     <tr>
		       	<td id=a1><b>회원성명</b></td>
		       	<td><input type="text" id=custname name=custname></td>
		     <tr>
		       	<td id=a1><b>회원전화</b></td>
		       	<td><input type="text" id=phone name=phone size=30></td>
		     <tr>
		     	<td id=a1><b>회원주소</b></td>
				<td height="30">
				    <input type="text" name="zipcode" id="zipcode" placeholder="우편번호" size="8">
				    <input type="button" onclick="kakaoPostcode()" value="우편번호 찾기"><br>
				    <input type="text" name="address" id="address" placeholder="주소" size="48" readonly><br>
				    <input type="text" name="addr3" id="addr3" placeholder="상세주소" size="48">
				</td>
		     <tr>
		       	<td id=a1><b>가입일자</b></td>
		       	<td>
		       	  <c:set var="now" value="<%=new java.util.Date()%>"/>
		       	  <c:set var="sysYear">
		      	   	  <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
		      	  </c:set>
		      	  <input type="text" id="joindateStr" value=${sysYear }>
			  	</td>
		     <tr>
		      	<td id=a1><b>고객등급[A:VIP,B:일반,C:직원]</b></td>
		      	<td>
		      		<input type="radio" name=grade value="A">VIP
		      		<input type="radio" name=grade value="B" checked>일반
		      		<input type="radio" name=grade value="C">직원
		      	</td>
		     <tr>
		      	<td id=a1><b>도시코드</b></td>
		      	<td><input type="text" id=city name=city ></td>
		     <tr>
		      	<td colspan="2" align="center">
			   		<input type=button value=" 등 록 " onClick="inK()">&emsp;
			   		<input type=button value=" 조 회 " onClick="moveK()">
		      	</td>
		     </tr>
    	</table>
   </form>
</section>
<c:import url ="/include/footer.jsp"/>


