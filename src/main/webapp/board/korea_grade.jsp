<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/top.jsp" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<section>
<br>
<div align="center"><h2> 회원매출조회</h2></div>
<br>
 <form>
  <table border=1 width=800 align="center">
   <tr align="center" style="font-weight: bold;">
    <td class="bold">회원번호</td>
    <td>회원성명</td>
    <td>고객등급</td>
    <td>매출</td>
   </tr> 
    
  <c:forEach items="${li}" var="m">
   <c:if test="${m.sum > 0}"> 
    <tr align="center">
     <td>${m.custno}</td>
     <td>${m.custname}</td>
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
     <td>${m.sum}</td>
    </tr>
   </c:if>
   </c:forEach>
  </table>
 </form>
</section>
<%@ include file ="/include/footer.jsp" %>
