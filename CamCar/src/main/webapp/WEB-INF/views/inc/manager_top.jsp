<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div id="member_area">
	<%-- 홈페이지 로고. 메인페이지로 이동 --%>
	<nav class="header_menu">
		<ul class="logo">
			<li><a href="./"><img src="${pageContext.request.contextPath}/resources/images/logo.png"></a></li>
		</ul>

		<ul class="menu">
			<li><a href="member_management">회원관리</a></li>
			<li><a href="car_management">차량관리</a></li>
			<li><a href="board_management">게시글관리</a></li>
		</ul>
	
		<%-- 로그인 여부(= 세션 아이디 존재 여부) 판별하여 각각 다른 링크 표시 --%>
		<%-- EL 의 sessionScope 내장 객체에 접근하여 "sId" 속성값 존재 여부 판별 --%>
		<ul class="member">
			<li><a>ooo님 안녕하세요</a></li>
		</ul>
	</nav>
	<hr>
</div>