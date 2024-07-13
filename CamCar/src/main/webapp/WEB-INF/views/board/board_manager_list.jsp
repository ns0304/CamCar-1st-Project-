<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 날짜 등의 출력 형식 변경을 위한 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 공지사항</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/manager_default.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>

</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		<section>
			<div align="center">
				<!-- 게시판 리스트 -->
				<h2>캠핑갈카 공지사항</h2>
				<section id="listForm">
					<table>
						<tr id="tr_top">
							<td>공지 사항 제목</td>
							<td width="150px">날짜</td>
						</tr>

						<c:set var="pageNum" value="1" />
						<c:if test="${not empty param.pageNum}">
							<c:set var="pageNum" value="${param.pageNum}" />
						</c:if>
						<%-- JSTL 과 EL 활용하여 글목록 표시 작업 반복(boardList 객체 활용) --%>
						<c:forEach var="bo" items="${boardList}">
							<%-- boardList 에서 꺼낸 BoardBean 객체(board)에 저장된 멤버변수값(데이터) 출력 --%>
							<tr>
								<td>${bo.bo_content}</td>
								<td><fmt:formatDate value="${bo.bo_sysdate}"
										pattern="yy-MM-dd HH:mm" /></td> 
							</tr>
						</c:forEach>
					</table>
				</section>

				<%-- ========================== 페이징 처리 영역 ========================== --%>
				<section id="pageList">
					<input type="button" value="이전"
						onclick="location.href='BoardList?pageNum=${pageNum - 1}'"
						<c:if test="${pageNum <= 1}">disabled</c:if>>

					<c:forEach var="i" begin="${pageInfo.startPage}"
						end="${pageInfo.endPage}">
						<c:choose>
							<c:when test="${i eq pageNum}">
								<b>${i}</b>
								<%-- 현재 페이지 번호 --%>
							</c:when>
							<c:otherwise>
								<a href="BoardList?pageNum=${i}">${i}</a>
								<%-- 다른 페이지 번호 --%>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<input type="button" value="다음"
						onclick="location.href='BoardList?pageNum=${pageNum + 1}'"
						<c:if test="${pageNum >= pageInfo.maxPage}">disabled</c:if>>
				</section>
				<section id="BoardWrite">
					<input type="button" value="공지사항 글 등록"
						onclick="location.href='BoardWrite'">
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













