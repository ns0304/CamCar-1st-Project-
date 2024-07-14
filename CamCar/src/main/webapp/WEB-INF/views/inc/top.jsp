<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	// 로그아웃 여부를 확인할 confirmLogout() 함수 정의
	function confirmLogout() {
		// 확인창(confirm 다이얼로그)를 통해 "로그아웃하시겠습니까?" 에 대한 확인 작업 수행
		let isLogout = confirm("로그아웃하시겠습니까?"); // true/false 리턴
		
		// isLogout 변수값이 true 일 경우 로그아웃 작업을 수행할 "MemberLogout" 서블릿 요청
		if(isLogout) {
			location.href = "MemberLogout";
		}
	}
</script>

<div id="member_area">
	<%-- 홈페이지 로고. 메인페이지로 이동 --%>
	<div class="header_menu">
		<ul class="logo">
			<li><a href="./"><img src="${pageContext.request.contextPath}/resources/img/camcar_logo.png"></a></li>
		</ul>

		<ul class="menu">
			<li><a href="./">예약</a></li>
			<li><a href="ReservationList">예약확인</a></li>
			<li><a href="Service">서비스</a></li>
			<li><a href="Customer">고객센터</a></li>
		</ul>
	
		<%-- 로그인 여부(= 세션 아이디 존재 여부) 판별하여 각각 다른 링크 표시 --%>
		<%-- EL 의 sessionScope 내장 객체에 접근하여 "sId" 속성값 존재 여부 판별 --%>
		<ul class="member">
			<c:choose>
				<c:when test="${empty sessionScope.sId}"> <%-- 로그인 상태가 아닐 경우("sId" 속성값이 없을 경우) --%>
					<%-- 로그인, 회원가입 링크 표시 --%>
					<li><a href="MemberLogin">로그인</a></li>
					<li><a href="MemberJoin">회원가입</a></li>
				</c:when>
				<c:otherwise> <%-- 로그인 상태일 경우 --%>
					<%-- 회원 아이디, 로그아웃 링크 표시 --%>
					<%-- 아이디 클릭 시 회원 상세정보 조회를 위한 "MemberInfo" 서블릿 요청 --%>
					<li><a href="MemberInfo">${sessionScope.sId}</a> 님</li>
					<%-- 하이퍼링크 상에서 자바스크립트 함수 호출 시 "javascript:함수명()" 형태로 호출 --%>
					<li><a href="javascript:confirmLogout()">로그아웃</a></li>
					<c:if test="${sessionScope.sId eq 'admin'}">
					<li><a href="ManagerMain">관리자메인</a></li>
					</c:if>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<hr>
</div>