<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/manager_default.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<header>
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/MVC_Board = webapp) 이므로 inc 디렉토리의 top.jsp 지정 --%>
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		<section>
			<div align="center">
				<h1>차량 목록 조회</h1>
				<form action="MemberJoin" name="joinForm" method="post">
					<div id="info_car">	
					<input type="text" id="text" placeholder="차량 검색" >
					<button>검색</button>
					</div>
					<table border="1">
						<tr>
							<th>차량 리스트</th>
							<th>차량 현황</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th><input type="button" value="수정"></th>
							<th><input type="button" value="삭제"></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th><input type="button" value="수정"></th>
							<th><input type="button" value="삭제"></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th><input type="button" value="수정"></th>
							<th><input type="button" value="삭제"></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th><input type="button" value="수정"></th>
							<th><input type="button" value="삭제"></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th><input type="button" value="수정"></th>
							<th><input type="button" value="삭제"></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th><input type="button" value="수정"></th>
							<th><input type="button" value="삭제"></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th><input type="button" value="수정"></th>
							<th><input type="button" value="삭제"></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th><input type="button" value="수정"></th>
							<th><input type="button" value="삭제"></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th><input type="button" value="수정"></th>
							<th><input type="button" value="삭제"></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th><input type="button" value="수정"></th>
							<th><input type="button" value="삭제"></th>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</main>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>


