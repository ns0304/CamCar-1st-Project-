<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 관리자</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/manager_default.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style type="text/css">
table {
	border-collapse: collapse;
}
table th, table td {
	padding: 10px;
	text-align: center;
}
</style>
</head>
<script type="text/javascript">
		function correction(car_idx){
			window.open('CarDetailView?car_idx=' + car_idx, '_parent ', 'width=900px,height=900px,left=750, top=200');
		}
		
</script>
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
			<!-- 차량 목록 조회 -->
				<h1>차량 목록 조회</h1>
				<form action="CarListBoard" name="joinForm" method="get">
					<div id="info_car"></div>
					<table border="1">
						<tr>
							<th>차량 코드</th>
							<th>차량 번호</th>
							<th>모델명</th>
							<th>연식</th>
							<th>차량 지점 코드</th>
							<th>상세조회</th>
						</tr>

						<c:set var="pageNum" value="1" />
						<c:if test="${not empty param.pageNum}">
							<c:set var="pageNum" value="${param.pageNum}" />
						</c:if>
						
					<c:forEach var="car" items="${carList}">
						<tr>
								<th>${car.car_idx}</th>
								<th>${car.car_number}</th>
								<th>${car.car_model}</th>
								<th>${car.car_old}</th>
								<th>${car.brc_idx}</th>
								<th><input type="button" value="조회" onclick="correction(${car.car_idx})"></th>
						</tr>
					</c:forEach>
					</table>
				</form>
			<br>
			<%-- 페이징 처리 --%>
			<section id="pageList">
				<input type="button" value="이전"
					onclick="location.href='CarListBoard?pageNum=${pageNum - 1}'"
					<c:if test="${pageNum <= 1}">disabled</c:if>>
				<c:forEach var="i" begin="${pageInfo.startPage}"
					end="${pageInfo.endPage}">
					<c:choose>
						<c:when test="${i eq pageNum}">
							<b>${i}</b>
						</c:when>
						<c:otherwise>
							<a href="CarListBoard?pageNum=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<input type="button" value="다음"
					onclick="location.href='CarListBoard?pageNum=${pageNum + 1}'"
					<c:if test="${pageNum >= pageInfo.maxPage}">disabled</c:if>>
			</section>
			</div>
		</section>
	</main>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>


