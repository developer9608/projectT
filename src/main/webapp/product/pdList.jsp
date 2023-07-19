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
	<td>번호</td>  
	<td>상품명</td>  
	<td>가격</td>  
    <td>설명</td>
    <td>이미지</td>
    <td>날짜</td>
   </tr> 
    
  <c:forEach items="${li}" var="m">
   <tr align="center">
    <td id=td1><a href="${path}/pdEdit.do?productId=${m.productId}">${m.productId}</a></td>
    <td>${m.productName}</td>
    <td> <fmt:formatNumber value="${m.productPrice}" pattern="#,##0" /></td>
    <td >${m.productDesc}</td>
    <td align=center><img src="${path}/product/files/${m.productImgStr}" width=100% height=100%></td>
    <td>
     	<fmt:parseDate  value="${m.productDate}" var="registered" pattern="yyyy-MM-dd" />
       	<fmt:formatDate value="${registered}" pattern="yyyy년MM월dd일" />
   </td>
   </tr>
   </c:forEach>
  </table>
  <br>
  <form action="${path }/pdList.do">
  	<div align="center">
  		<select name=ch1>
  			<option value="productId">상품번호</option>
  			<option value="productName">상품명</option>
  		</select>
  		<input type=text name=ch2>
  		<input type=submit value="검색"> 
 	</div>
 </form>
 <br>
</section>
<%@ include file ="/include/footer.jsp" %>
