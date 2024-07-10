<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>

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
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/MVC_Board = webapp) 이므로 inc 디렉토리의 top.jsp 지정 --%>
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		<section>
			<div align="center">
				<h1>1:1 문의 상담 내역</h1>
				<form action="MemberJoin" name="joinForm" method="post">
					<table border="1" class="graph">
						<tr id="tr_top">
							<td width="250px" align="center">1:1 문의 내역 리스트</td>
							<td width="100px" align="center">답변 유무</td>
							<td width="100px" align="center">답변 달기</td>
						</tr>
						<c:set var="pageNum" value="1" />
						<c:if test="${not empty param.pageNum}">
							<c:set var="pageNum" value="${param.pageNum}" />
						</c:if>
						<c:forEach var="board" items="${boardList}">
							<tr>
								<td>${board.board_num}</td>
								<td id="subject"><c:if test="${board.board_re_lev > 0}">
										<c:forEach begin="1" end="${board.board_re_lev}">
								&nbsp;&nbsp;
							</c:forEach>
										<img src="images/re.gif">
									</c:if> <a
									href="BoardDetail.bo?board_num=${board.board_num}&pageNum=${pageNum}">${board.board_subject}</a>
								</td>
								<td>${board.board_name}</td>
								<td><fmt:formatDate value="${board.board_date}"
										pattern="yy-MM-dd HH:mm" /></td>
								<td>${board.board_readcount}</td>
							</tr>
						</c:forEach>

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


