<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 날짜 등의 출력 형식 변경을 위한 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 관리자</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
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
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		<section>
			<div align="center">
				<!-- 게시판 리스트 -->
				<h2>캠핑갈카 1:1 문의</h2>
				<section id="listForm">
					<table border="1">
						<tr id="tr_top">
							<td>작성자</td>
							<td>문의유형</td>
							<td>제목</td>
							<td width="90px">답변유무</td>
							<td width="90px">날짜</td>
							<td>상세보기</td>
						</tr>

						<c:set var="pageNum" value="1" />
						<c:if test="${not empty param.pageNum}">
							<c:set var="pageNum" value="${param.pageNum}" />
						</c:if>
						<%-- JSTL 과 EL 활용하여 글목록 표시 작업 반복(qnaList 객체 활용) --%>
						<c:forEach var="qna" items="${qnaList}">
							<%-- qnaList 에서 꺼낸 BoardBean 객체(board)에 저장된 멤버변수값(데이터) 출력 --%>
							<tr>
								<td>${qna.mem_id}</td>
								<td>
									<c:choose>
										<c:when test="${qna.qna_type_idx eq 1}">예약/예약상담</c:when>
										<c:when test="${qna.qna_type_idx eq 2}">차량인도</c:when>
										<c:when test="${qna.qna_type_idx eq 3}">정비/사고</c:when>
										<c:when test="${qna.qna_type_idx eq 4}">결제</c:when>
										<c:when test="${qna.qna_type_idx eq 5}">계약변경/종료</c:when>
										<c:when test="${qna.qna_type_idx eq 6}">기타</c:when>
									</c:choose>
								</td>
								<%-- 
								<td>
								<fmt:parseDate value="${orderTicket.order_ticket_date}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDateTime}"/>
								</td>--%>
								<td>${qna.qna_inquery}</td>
								<c:if test="${not empty qna.qna_reply}">
								<td><b>답변완료</b></td>
								</c:if>
								<c:if test="${empty qna.qna_reply}">
								<td>답변대기</td>
								</c:if>
								<td><fmt:formatDate value="${qna.qna_date}"
										pattern="yyyy-MM-dd" /></td>
								<td><input type="button" value="수정"
									onclick="location.href='QnaDetail?qna_number=${qna.qna_number}'"></td>
							</tr>
						</c:forEach>
					</table>
				</section>
				<br>
				<%-- ========================== 페이징 처리 영역 ========================== --%>
				<section id="pageList">
					<input type="button" value="이전"
						onclick="location.href='qna_ask?pageNum=${pageNum - 1}'"
						<c:if test="${pageNum <= 1}">disabled</c:if>>

					<c:forEach var="i" begin="${pageInfo.startPage}"
						end="${pageInfo.endPage}">
						<c:choose>
							<c:when test="${i eq pageNum}">
								<b>${i}</b>
								<%-- 현재 페이지 번호 --%>
							</c:when>
							<c:otherwise>
								<a href="qna_ask?pageNum=${i}">${i}</a>
								<%-- 다른 페이지 번호 --%>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<input type="button" value="다음"
						onclick="location.href='qna_ask?pageNum=${pageNum + 1}'"
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