<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/include/top.jsp"/>
<section>
<br>
<div align="center"><h2> 우수중소기업 리스트 </h2></div>
<br>
  <table border=1 width=800 align="center">
   <tr align="center" style="font-weight: bold;">
    <td width=40>순번</td>
    <td width=100>회사대표</td>
    <td width=200>회사명</td>
    <td width=280>대표상품</td>
    <td width=170>주소</td>
    <td width=80>위도</td>
    <td width=80>경도</td>
   </tr> 
    
  <c:forEach items="${li}" var="m">
   <tr align="center">
    <td>${m.idx}</td>
    <td>${m.rprsntvNm}</td>
    <td>${m.entrprsNm}</td>
    <td>${m.mainGoods}</td>
    <td>${m.rdnmadr}</td>
    <td>${m.latitude }</td>
    <td>${m.logitude}</td>
   </tr>
   </c:forEach>
  </table>
</section>
<%@ include file ="/include/footer.jsp" %>
