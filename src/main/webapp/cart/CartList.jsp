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
    <td class="bold" width=80>CartId</td>
    <td width=100>ProductId</td>
    <td width=100>ProductName</td>
    <td width=100>ProductPrice</td>
    <td width=250>Amount</td>
   	<td width=100>productImgStr</td>
    
   </tr> 
    
  <c:forEach items="${li}" var="q">
   <tr align="center">
	    <td>${q.cartId}</td>
	    <td>${q.productId}</td>
	    <td>${q.productName}</td>
	    <td>${q.productPrice}</td>
	    <td>${q.amount}</td>	    
	    <td>${q.productImgStr}</td>
    </tr>
   </c:forEach>
  </table>
  <br>
  <form action="${path }/CartList.do">
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
