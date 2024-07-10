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
				<form action="CarList">
						<%-- 검색타입 목록(셀렉트박스), 검색어(텍스트박스) 추가(파라미터 있으면 해당 내용 표시) --%>
						
						<%--검색기능 처리 --%>
						<select name="searchType">
							<option value="car_idx" <c:if test="${param.searchType eq 'car_idx'}">selected</c:if>>차량 코드</option>
							<option value="car_status" <c:if test="${param.searchType eq 'car_model'}">selected</c:if>>차량 모델</option>
						</select>
						<input type="text" name="searchKeyword" value="${param.searchKeyword}">
						<input type="submit" value="검색">
				</form>
				<form action="CarListWrite" name="joinForm" method="post">
					<div id="info_car">	
					</div>
					<table border="1">
						<tr>
							<th>차량 코드</th>
							<th>차량 번호</th>
							<th>모델명</th>
							<th>연식</th>
							<th>차량 지점 코드</th>
							<th><input type="button" value="수정" onclick="correction()"></th>
							<th><input type="button" value="삭제" onclick="correction()"></th>
						</tr>
					
					
						<c:set var="pageNum" value="1"/>
							<c:if test="${not empty param.pageNum}">
								<c:set var="pageNum" value="${param.pageNum}"/>
							</c:if>
														
							
							
							<c:forEach var="car" items="${carList}">
							<tr>
								<th>${car.car_idx}</th>
								<th>${car.car_number}</th>
								<th>${car.car_model}</th>
								<th>${car.car_old}</th>
								<th>${car.brc_idx}</th>
							</tr>
							</c:forEach>
							
					</table>
				</form>
			</div>
			<br><%-- 페이징 처리 --%>
			<div id="pageList" align="center">
				<input type="button" value="이전"
					onclick="location.href='CarList?pageNum=${pageNum - 1}'"
					<c:if test="${pageNum <= 1}">disabled</c:if>>
				<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
					<c:choose>
						<c:when test="${i eq pageNum}">
							<b>${i}</b>
						</c:when>
						<c:otherwise>
							<a href="CarList?pageNum=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<input type="button" value="다음"
						onclick="location.href='CarList?pageNum=${pageNum + 1}'"
						<c:if test="${pageNum >= pageInfo.maxPage}">disabled</c:if>>
			</div>			
		</section>
	</main>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>


