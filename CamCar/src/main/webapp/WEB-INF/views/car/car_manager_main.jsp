<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 관리자</title>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/manager_default.css"
	rel="stylesheet" type="text/css">
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style type="text/css">
#articleForm {
	width: 900px;
	margin: auto;
}

table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 20px;
}

table th, table td {
	padding: 8px;
	text-align: center;
	border: 1px solid #ddd;
	font-size: 14px;
	background-color: #f9f9f9;
}

table th {
	background-color: #f2f2f2;
	color: #333;
}

table tr:hover {
	background-color: #f2f2f2;
}

table th, table td:nth-child(3) {
	white-space: nowrap; /* 생년월일 칼럼 텍스트가 너무 길 때 줄이지 않도록 설정 */
}

table input[type="button"] {
	padding: 5px 10px;
	background-color: #00838f;
	color: #fff;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
}

table input[type="button"]:hover {
	background-color: #006064;
}
</style>
<script type="text/javascript">
        function correction(car_idx) {
            var url = 'CarDetailView?car_idx=' + car_idx;
            window.location.href = url;
        }
    </script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<aside>
			<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		</aside>
		<section id="articleForm">
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
							<th>차량 상태</th>
							<th>상세조회</th>
						</tr>

						<c:set var="pageNum" value="1" />
						<c:if test="${not empty param.pageNum}">
							<c:set var="pageNum" value="${param.pageNum}" />
						</c:if>

						<c:forEach var="car" items="${carList}">
							<tr>
								<td>${car.car_idx}</td>
								<td>${car.car_number}</td>
								<td>${car.car_model}</td>
								<td>${car.car_old}</td>
								<td>${car.brc_idx}</td>
								<td>${car.car_status}</td>
								<td><input type="button" value="조회"
									onclick="correction(${car.car_idx})"></td>
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
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
