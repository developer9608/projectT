<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:import url="/include/top.jsp" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function delK(k){
		var path = "${path}";
		var dataStr = {
			productId: k
		};	  
		// 알림 메시지를 표시하여 삭제 여부 확인
		if (confirm("정말로 삭제하시겠습니까?")) {
			$.ajax({
				type: "post",
				url: path + "/pdDelete.do",
				data: dataStr,
				success: function(data) {		
					location.replace(path + "/pdList.do");  	
				}
			});
		}	  
	} 
	
	function listK(){
		location.href="${path}/pdList.do"
	}
</script>

<section>
	<br>
	<div align=center>
	<h2>쇼핑몰 상품등록 하기</h2>
		<form action=${path}/insertCart.do method="post" enctype="multipart/form-data" >
			<input type=text name=productId value="${o.productId}"/>
			<input type=text name=custNo value="${m.custno}"/>
			<table border=1 width=800 height=350 style="font-weight: bold;">
				<tr>
			  		<td align="center" width=100>번호</td>  
			   		<td> &emsp;<input type=text value="${o.productId}"/> </td>
			   		<td align=center rowspan=4><img src="${path}/product/files/${o.productImgStr}" width=100% height=90%></td></tr> 
				<tr>
			  		<td align="center">상품명</td>  
			   		<td> &emsp;<input type=text name=productName value="${o.productName}"/> </td></tr> 
			  	<tr>
				  	<td align="center">가격</td>  
					<td>&emsp;<input type=text name=productPrice value="${o.productPrice}"/> </td></tr>
  			  	<tr>
	  			  	<td align="center">설명</td>  
				   	<td> &nbsp;<textarea cols=40  rows=9 name=productDesc readonly>${o.productDesc} </textarea> </td></tr>
				<tr>
	  			  	<td align="center">수량</td>  
				   	<td> &nbsp;<input type=text name=amount min=1 max=5/></td></tr>
			  	<tr>
				  	<td align="center">등록날짜</td>  
	   				<td colspan=2>&emsp;<input type=text name=productDate value="${o.productDate}"/> </td></tr>
			  	<tr>
					<td colspan=3  align="center"> 
						<input  type=submit value="상품구매" >&emsp;
					    <input  type=button value="목록보기"onClick="listK()">&emsp;
					    <input  type=button value="상품삭제" onClick="delK('${o.productId}')">
				  	</td>
				</tr>
			</table>
		</form>
	</div>
	<br>
</section>
<c:import url="/include/footer.jsp" />

