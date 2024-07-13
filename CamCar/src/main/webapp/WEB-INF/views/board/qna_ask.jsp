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
		<section id="buttonArea">
		<%-- ============================================================================ --%>
		<%-- ======================= [ 게시물 검색 기능 추가 ] ========================== --%>
		<%-- 검색 기능을 위한 폼 생성 --%>
		<form action="qna_ask">
			<%-- 검색타입 목록(셀렉트박스), 검색어(텍스트박스) 추가(파라미터 있으면 해당 내용 표시) --%>
			<select name="searchType">
				<option value="inquery" <c:if test="${param.searchType eq 'inquery'}">selected</c:if>>제목</option>
				<option value="content" <c:if test="${param.searchType eq 'content'}">selected</c:if>>내용</option>
				<option value="inquery_content" <c:if test="${param.searchType eq 'inquery_content'}">selected</c:if>>제목+내용</option>
				<option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>작성자</option>
			</select>
			<input type="text" name="searchKeyword" value="${param.searchKeyword}">
			<input type="submit" value="검색">
			<input type="button" value="글쓰기" onclick="location.href='BoardWrite'" />
		</form>
		<%-- ============================================================================ --%>
	</section>
	<section id="listForm">
		<table>
			<tr id="tr_top">
				<td width="100px">번호</td>
				<td>제목</td>
				<td width="150px">작성자</td>
				<td width="150px">날짜</td>
				<td width="100px">조회수</td>
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
			<c:forEach var="qna" items="${qnaList}">
				<%-- boardList 에서 꺼낸 BoardBean 객체(board)에 저장된 멤버변수값(데이터) 출력 --%>
				<tr>
					<td>${qna.qna_number}</td>
					<td id="subject">
						<%-- ========= 답글 관련 처리 ======== --%>
						<%-- board_re_lev 값이 0 보다 크면 답글이므로 들여쓰기 후 이미지(re.gif) 표시 --%>
						<%-- ex) lev = 1 일 때 2칸, lev = 2 일 때 4칸 들여쓰기 --%>
						<c:if test="${qna.qna_re_lev > 0}">
							<c:forEach begin="1" end="${qna.qna_re_lev}">
								&nbsp;&nbsp;
							</c:forEach>
							<img src="img/re.gif">
						</c:if>
						<%-- 제목 클릭 시 하이퍼링크 설정(BoardDetail) --%>
						<%-- 파라미터 : 글번호(board_num), 페이지번호(pageNum) --%>
						<a href="BoardDetail?board_num=${qna.qna_number}&pageNum=${pageNum}">${qna.qna_inquery}</a>
					</td>
					<td>${qna.mem_id}</td>
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
						<fmt:formatDate value="${qna.qna_date}" pattern="yy-MM-dd HH:mm" />
					</td>
				</tr>
			</c:forEach>
			<c:if test="${empty qnaList}">
				<tr><td colspan="5">게시물이 존재하지 않습니다.</td></tr>
			</c:if>
		</table>
	</section>
	<%-- ========================== 페이징 처리 영역 ========================== --%>
	<section id="pageList">
		<%-- [이전] 버튼 클릭 시 BoardList 서블릿 요청(파라미터 : 현재 페이지번호 - 1) --%>
		<%-- 현재 페이지 번호(pageNum)가 URL 파라미터로 전달되므로 ${pageNum} 활용(미리 저장된 변수값) --%>
		<%-- 단, 현재 페이지 번호가 1 보다 클 경우에만 동작(아니면, 버튼 비활성화 처리) --%>
		<input type="button" value="이전" 
				onclick="location.href='qna_ask?pageNum=${pageNum - 1}'"
				<c:if test="${pageNum <= 1}">disabled</c:if>>
		
		<%-- 계산된 페이지 번호가 저장된 PageInfo 객체(pageInfo)를 통해 페이지 번호 출력 --%>
		<%-- 시작페이지(startPage = begin) 부터 끝페이지(endPage = end)까지 1씩 증가하면서 표시 --%>
		<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
			<%-- 각 페이지마다 BoardList.bo 하이퍼링크 설정(페이지번호를 pageNum 파라미터로 전달) --%>
			<%-- 단, 현재 페이지(i 값과 pageNum 파라미터값이 동일)는 하이퍼링크 없이 굵게 표시 --%>
			<c:choose>
				<c:when test="${i eq pageNum}">
					<b>${i}</b> <%-- 현재 페이지 번호 --%>
				</c:when>
				<c:otherwise>
					<a href="qna_ask?pageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<%-- [다음] 버튼 클릭 시 BoardList 서블릿 요청(파라미터 : 현재 페이지번호 + 1) --%>
		<%-- 현재 페이지 번호(pageNum)가 URL 파라미터로 전달되므로 ${param.pageNum} 활용 --%>
		<%-- 단, 현재 페이지 번호가 최대 페이지번호(maxPage)보다 작을 경우에만 동작(아니면, 버튼 비활성화 처리) --%>
		<%-- 두 가지 경우의 수에 따라 버튼을 달리 생성하지 않고, disabled 만 추가 여부 설정 --%>
		<%-- pageNum 파라미터값이 최대 페이지번호 이상일 때 disabled 속성 추가 --%>
		<input type="button" value="다음" 
				onclick="location.href='qna_ask?pageNum=${pageNum + 1}'"
				<c:if test="${pageNum >= pageInfo.maxPage}">disabled</c:if>>
	</section>
	</main>

	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>


