<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<!-- 웹의 경로를 잡아준다. -->
 <c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
 <c:set var="key" value="acbf7cf09baefca054efcea77a16114d" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/include/top.css" rel="stylesheet" type="text/css"  />
<style type="text/css">

</style>
</head>
<body>
<div align="center">
<header>쇼핑몰 회원 관리 ver1.0</header>
</div>
<nav>
	&emsp;&emsp; <a href="${path}/selectKoreaMax.do">회원등록</a>&emsp;
	&emsp;&emsp;<a href="${path}/selectKoreaAll.do">회원목록조회/수정</a>&emsp;
	&emsp;&emsp;<a href="${path}/selectGradeKorea.do">회원매출조회</a>&emsp; 
	<c:if test="$user=='admin'">
	&emsp;&emsp;<a href="${path}/EvList.do">전기차충전소</a>&emsp;
	&emsp;&emsp;<a href="${path}/EvMap.do">전기차충전소지도</a>&emsp;
	&emsp;&emsp;<a href="${path}/ComList.do">우수중소기업</a>&emsp;
	&emsp;&emsp;<a href="${path}/ComMap.do">우수중소기업지도</a>&emsp;
	</c:if> <br>
	&emsp;&emsp;&emsp;<a href="${path}/product/pdForm.jsp">상품등록</a>&emsp;  
	&emsp;&emsp;&emsp;<a href="${path}/pdList.do">상품목록</a>&emsp;  
	&emsp;&emsp;&emsp;<a href="${path}/CartList.do?custNo=${m.custno}">장바구니목록</a>&emsp;
	<c:if test="${empty m.custno}">
	&emsp;&emsp;&emsp;<a href="${path}/login/login.jsp">로그인</a>&emsp;
	</c:if>
	<c:if test="${!empty m.custno}">  
	&emsp;&emsp;&emsp;<a href="${path}/logout.do?custno=${m.custno}">${m.custname}로그아웃</a>&emsp;  
	</c:if>
	&emsp;&emsp;&emsp;<a href="${path}/index.jsp">홈으로</a>&emsp;  
	
</nav>