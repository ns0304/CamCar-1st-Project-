<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 날짜 등의 출력 형식 변경을 위한 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 공지사항</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#listForm {
		width: 1024px;
		max-height: 610px;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 1024px;
	}
	
	#tr_top {
		background: orange;
		text-align: center;
	}
	
	table td {
		text-align: center;
	}
	
	#pageList {
		margin: auto;
		width: 1024px;
		text-align: center;
	}
	
	#emptyArea {
		margin: auto;
		width: 1024px;
		text-align: center;
	}
	
	#buttonArea {
		margin: auto;
		width: 1024px;
		text-align: right;
	}
	
	/* 하이퍼링크 밑줄 제거 */
	a {
		text-decoration: none;
	}
	
	/* 제목 열 좌측 정렬 및 여백 설정 */
	#subject {
		text-align: left;
		padding-left: 20px;
	}
</style>
</head>
<body>
	<header>
		<%-- inc/top.jsp 페이지 삽입(jsp:include 액션태그 사용 시 / 경로는 webapp 가리킴) --%>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>

	<!-- 게시판 리스트 -->
	<h2>캠핑갈카 공지사항</h2>
	<section id="buttonArea">
		<input type="text" placeholder="검색어를 입력해주세요">
		<input type="button" value="검색">
		<br><br>
<!-- 		<input type="button" value="글쓰기" onclick="location.href='BoardWriteForm'" /> -->
	</section>
	<section id="listForm">
		<table>
			<tr id="tr_top">
				<td width="100px">번호</td>
				<td>제목</td>
				<td width="150px">작성자</td>
				<td width="100px">조회수</td>
				<td width="150px">날짜</td>
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
	</section>
	<%-- ========================== 페이징 처리 영역 ========================== --%>
	<section id="pageList">
		<%-- [이전] 버튼 클릭 시 BoardList.bo 서블릿 요청(파라미터 : 현재 페이지번호 - 1) --%>
		<%-- 현재 페이지 번호(pageNum)가 URL 파라미터로 전달되므로 ${pageNum} 활용(미리 저장된 변수값) --%>
		<%-- 단, 현재 페이지 번호가 1 보다 클 경우에만 동작(아니면, 버튼 비활성화 처리) --%>
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${param.pageNum > 1}"> --%>
<%-- 				<input type="button" value="이전" onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}'"> --%>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<input type="button" value="이전" onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}'" disabled> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
		<%-- 두 가지 경우의 수에 따라 버튼을 달리 생성하지 않고, disabled 만 추가 여부 설정 --%>
		<%-- pageNum 파라미터값이 1 이하일 때 disabled 속성 추가 --%>
		<input type="button" value="이전" 
				onclick="location.href='BoardList?pageNum=${pageNum - 1}'"
				<c:if test="${pageNum <= 1}">disabled</c:if>
		>
		
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
					<a href="BoardList?pageNum=${i}">${i}</a> <%-- 다른 페이지 번호 --%>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<%-- [다음] 버튼 클릭 시 BoardList.bo 서블릿 요청(파라미터 : 현재 페이지번호 + 1) --%>
		<%-- 현재 페이지 번호(pageNum)가 URL 파라미터로 전달되므로 ${param.pageNum} 활용 --%>
		<%-- 단, 현재 페이지 번호가 최대 페이지번호(maxPage)보다 작을 경우에만 동작(아니면, 버튼 비활성화 처리) --%>
		<%-- 두 가지 경우의 수에 따라 버튼을 달리 생성하지 않고, disabled 만 추가 여부 설정 --%>
		<%-- pageNum 파라미터값이 최대 페이지번호 이상일 때 disabled 속성 추가 --%>
		<input type="button" value="다음" 
				onclick="location.href='BoardList?pageNum=${pageNum + 1}'"
				<c:if test="${pageNum >= pageInfo.maxPage}">disabled</c:if>
		>
	</section>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>













