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
    <td class="bold" width=20>순번</td>
    <td width=150>충전소명</td>
    <td width=400>주소</td>
    <td width=30>종류</td>
    <td width=50>충전속도</td>

   </tr> 
    
  <c:forEach items="${li}" var="m">
   <tr align="center">
    <td id=td1>${m.idx}</td>
    <td >${m.csNm}</td>
    <td>${m.addr}</td>
    <td>${m.cpStat }</td>    
    <td>${m.cpNm}</td>

   </tr>
   </c:forEach>
  </table>
</section>
<%@ include file ="/include/footer.jsp" %>
