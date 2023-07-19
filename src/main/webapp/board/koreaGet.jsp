<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/top.jsp" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
 <c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>

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
<script>
	function moveK() {
		location.href="${path}/selectKoreaAll.do";
	}
</script>

<section>
<br>
<div align="center">
 <h2> 홈쇼핑 회원 수정</h2></div>
  <br>
   <form action="${path}/updateKorea.do">
    <table border=1 width=700 height=250 align="center">
     <tr>
      <td id=a1><b>회원번호(자동발생)</b></td>
      <td><input type="text" name=custno value="${p.custno}" readonly></td>
     <tr>
       <td id=a1><b>회원성명</b></td>
       <td><input type="text" name=custname value="${p.custname}"></td>
     <tr>
       <td id=a1><b>회원전화</b></td>
       <td><input type="text" name=phone value="${p.phone}" size=30></td>
	 <tr>
	   <td id=a1><b>회원주소</b></td>
	   <td height="30">
	   	<input type="text" name="zipcode" id="zipcode" placeholder="우편번호" size="8" value="${p.zipcode}">
		<input type="button" onclick="kakaoPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="address" id="address" placeholder="주소" size="48" value="${p.address}"><br>
		<input type="text" name="addr3" id="addr3" placeholder="상세주소" size="48" value="${p.addr3}">
	   </td>
	 <tr>
	   <td id=a1><b>가입일자</b></td>
	   <td><input type=text name=joindateStr value="${p.joindate}"></td>
     <tr>
       <td id=a1><b>고객등급[A:VIP,B:일반,C:직원]</b></td>
       <td>
       	<c:if test="${p.grade=='A'}">
       		<input type="radio" name=grade value="A" checked="checked">VIP
		    <input type="radio" name=grade value="B" >일반
		    <input type="radio" name=grade value="C">직원
		</c:if>
		<c:if test="${p.grade=='B'}">
       		<input type="radio" name=grade value="A" >VIP
		    <input type="radio" name=grade value="B" checked="checked">일반
		    <input type="radio" name=grade value="C">직원
		</c:if>
		<c:if test="${p.grade=='C'}">
       		<input type="radio" name=grade value="A">VIP
		    <input type="radio" name=grade value="B">일반
		    <input type="radio" name=grade value="C"checked="checked">직원
		</c:if>    
       </td>
     <tr>
       <td id=a1><b>도시코드</b></td>
       <td><input type="text" name=city value="${p.city}"></td>
     <tr>
       <td colspan="2" align="center">
		<input type=submit value=" 수 정 " >&emsp;
		<input type=button value=" 조 회 " onClick="moveK()">
       </td>
     </tr>
    </table>
   </form>
</section>
<%@ include file ="/include/footer.jsp" %>
