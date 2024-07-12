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
						<%-- JSTL 과 EL 활용하여 글목록 표시 작업 반복(boardList 객체 활용) --%>
						<c:forEach var="qna" items="${qnaList}">
							<%-- boardList 에서 꺼낸 BoardBean 객체(board)에 저장된 멤버변수값(데이터) 출력 --%>
							<tr>
								<td>${qna.qna_inquery}</td>
								<td id="subject">
									<%-- ========= 답글 관련 처리 ======== --%>
									<%-- board_re_lev 값이 0 보다 크면 답글이므로 들여쓰기 후 이미지(re.gif) 표시 --%>
									<%-- ex) lev = 1 일 때 2칸, lev = 2 일 때 4칸 들여쓰기 --%>
									<c:if test="${board.board_re_lev > 0}">
										<c:forEach begin="1" end="${board.board_re_lev}">
											&nbsp;&nbsp;
										</c:forEach>
										<img src="images/re.gif">
									</c:if>
									<%-- 제목 클릭 시 하이퍼링크 설정(BoardDetail) --%>
									<%-- 파라미터 : 글번호(board_num), 페이지번호(pageNum) --%>
									<a href="BoardDetail?board_num=${board.board_num}&pageNum=${pageNum}">${board.board_subject}</a>
								</td>
								<td>${board.board_name}</td>
								<td>
									<%--
									JSTL - format(fmt) 라이브러리를 활용하여 날짜 및 시각 형식(포맷) 변경
									1) <fmt:formatDate> : Date 등의 날짜 및 포맷 객체의 날짜 형식 변경
									   => <fmt:formatDate value="${날짜 및 시각 객체}" pattern="표현패턴">
									   => 자바의 SimpleDateFormat 등의 포맷팅 클래스와 동일한 역할 수행
									2) <fmt:parseDate> : String 객체의 날짜 형식 변경
									----------------------------------------------------------------------
									[ 날짜 및 시각 형식을 지정하는 패턴 문자 ]
									y : 연도(yy : 연도 2자리, yyyy : 연도 4자리)
									M : 월(MM : 월 2자리)
									d : 일(dd : 일 2자리)
									H : 시(HH : 24시간제, hh : 12시간제)
									m : 분(mm : 분 2자리)
									s : 초(ss : 초 2자리) 
									--%>
									<fmt:formatDate value="${board.board_date}" pattern="yy-MM-dd HH:mm" />
								</td>
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


