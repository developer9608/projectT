<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/include/top.jsp"/>
<section>
<br>
<div align="center"><h2> 회원목록조회</h2></div>
<br>
  <table border=1 width=800 align="center">
   <tr align="center" style="font-weight: bold;">
    <td class="bold" width=80>회원번호</td>
    <td width=70>회원성명</td>
    <td width=100>회원전화</td>
    <td width=250>주소</td>
    <td width=90>가입일자</td>
    <td width=70>고객등급</td>
    <td width=70>거주지역</td>
   </tr> 
    
  <c:forEach items="${li}" var="m">
   <tr align="center">
    <td id=td1><a href="${path}/getKorea.do?custno=${m.custno}">${m.custno}</a></td>
    <td>${m.custname}</td>
    <td>${m.phone}</td>
    <td >${m.address}</td>
    <td>
     	<fmt:parseDate  value="${m.joindate}" var="registered" pattern="yyyy-MM-dd" />
       	<fmt:formatDate value="${registered}" pattern="yyyy년MM월dd일" />
   </td>
    <td>
     <c:choose>
      <c:when test="${m.grade=='A' }">
       <c:out value="VIP"></c:out>
      </c:when>
      <c:when test="${m.grade=='B' }">
       <c:out value="일반"></c:out>
      </c:when>
      <c:when test="${m.grade=='C' }">
       <c:out value="직원"></c:out>
      </c:when>
     </c:choose>
    </td>
    <td>${m.city}</td>
   </tr>
   </c:forEach>
  </table>
  <br>
  <form action="${path }/selectKoreaAll.do">
  	<div align="center">
  		<select name=ch1>
  			<option value="custno">회원번호</option>
  			<option value="custname">회원이름</option>
  		</select>
  		<input type=text name=ch2>
  		<input type=submit value="검색"> 
 	</div>
 </form>
 <br>
</section>
<%@ include file ="/include/footer.jsp" %>
