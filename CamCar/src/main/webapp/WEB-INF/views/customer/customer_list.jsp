<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 날짜 등의 출력 형식 변경을 위한 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/customer.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
<header>
	<%-- top.jsp 페이지를 현재 페이지에 삽입 --%>
	<jsp:include page="/WEB-INF/views//inc/top.jsp"></jsp:include>
</header>

	<div align="left">
		<h1>고객센터</h1>
		<p>캠핑가볼카 렌터카 고객센터입니다.</p>		
		<p>무엇을 도와드릴까요?</p>
		<section>
			<table>
				<tr>
					<td id="td01"><b><p>자주 찾는 질문</p></b></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td> -->
<!-- 						<input type="button" value="예약하기" onclick="location.href='Question'"> -->
<!-- 						<input type="button" value="예약확인 / 변경" onclick="location.href='Question'"> -->
<!-- 						<input type="button" value="보험" onclick="location.href='Question'"> -->
<!-- 						<input type="button" value="고장 / 사고" onclick="location.href='Question'"> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<td>
						<input type="button" value="예약 / 변경" onclick="location.href='Question_reserve'">
						<input type="button" value="운전자" onclick="location.href='Question_drivers'">
						<input type="button" value="보험" onclick="location.href='Question_insurance'">
						<input type="button" value="고장 / 사고" onclick="location.href='Question_accident'">
					</td>
				</tr>
			</table>
		</section>
		<section>
			<table border="1">
				<tr>
					<td><b><p>공지사항 게시판</p></b></td>
					
					<td><a href="board_list">더보기</a></td>
				</tr>
			</table>
		</section>
		<section id="listForm">
			<table border="1">
			<tr id="tr_top">
				<td width="40px">번호</td>
				<td width="40px">제목</td>
				<td width="50px">작성자</td>
				<td width="50px">조회수</td>
				<td width="40px">날짜</td>
			</tr>
			<%-- ================================================ --%>
			<%-- 페이지번호(pageNum 파라미터) 가져와서 저장(없을 경우 기본값 1로 설정) --%>
			<c:set var="pageNum" value="1" />
			<%-- pageNum 파라미터 존재할 경우(= 비어있지 않음) 판별 --%>
			<c:if test="${not empty param.pageNum}">
				<%-- pageNum 변수에 pageNum 파라미터값 저장 --%>
				<c:set var="pageNum" value="${param.pageNum}" />
			</c:if>
			<%-- ================================================ --%>
			<%-- JSTL 과 EL 활용하여 글목록 표시 작업 반복(boardList 객체 활용) --%>
			<c:forEach var="board" items="${boardList}">
				<%-- boardList 에서 꺼낸 BoardBean 객체(board)에 저장된 멤버변수값(데이터) 출력 --%>
				<tr>
					<td>${board.board_num}</td>
					<td id="subject">
						<%-- ========= 답글 관련 처리 ======== --%>
						<%-- board_re_lev 값이 0 보다 크면 답글이므로 들여쓰기 후 이미지(re.gif) 표시 --%>
						<%-- ex) lev = 1 일 때 2칸, lev = 2 일 때 4칸 들여쓰기 --%>
						<c:if test="${board.board_re_lev > 0}">
							<c:forEach begin="1" end="${board.board_re_lev}">
								&nbsp;&nbsp;
							</c:forEach>
							<img src="${pageContext.request.contextPath}/resources/images/re.gif">
						</c:if>
						<%-- 제목 클릭 시 하이퍼링크 설정(BoardDetail.bo) --%>
						<%-- 파라미터 : 글번호(board_num), 페이지번호(pageNum) --%>
						<a href="BoardDetail?board_num=${board.board_num}&pageNum=${pageNum}">${board.board_subject}</a>
					</td>
					<td>${board.board_name}</td>
					<td>
						<fmt:formatDate value="${board.board_date}" pattern="yy-MM-dd HH:mm" />
					</td>
					<td>${board.board_readcount}</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<hr>
		<section>
			<table border="1">
				<tr>
					<td><b><p>더 자세한 상담이 필요한가요?</p></b></td>
					<td>
						<input type="button" value="1:1 문의 하기" onclick="location.href='Inquiry'">
					</td>
				</tr>
				<tr>
					<td>캠핑갈카 전화상담 운영시간</td>
				</tr>
				<tr>
					<td>전화 : <b>1111 - 2222</b></td>
				</tr>
				<tr>
					<td>평일 09:00 ~ 18:00<b>(공휴일 휴무)</b></td>
				</tr>
			</table>
		</section>
	</div>

	<footer>
	<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
	<jsp:include page="/WEB-INF/views//inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>