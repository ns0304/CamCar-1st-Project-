<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<script type="text/javascript">
		function correction(){
			window.open('MemberInf', '_parent ', 'width=900px,height=900px,left=750, top=200');
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
			<div>
				<div align="center">
					<h1>현재 회원 목록</h1>
					<form action="memberList">
						<%-- 검색타입 목록(셀렉트박스), 검색어(텍스트박스) 추가(파라미터 있으면 해당 내용 표시) --%>
						
						<%--검색기능 처리 --%>
						<select name="searchType">
							<option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>이름</option>
							<option value="idx" <c:if test="${param.searchType eq 'idx'}">selected</c:if>>회원번호</option>
						</select>
						<input type="text" name="searchKeyword" value="${param.searchKeyword}">
						<input type="submit" value="검색">
					</form>
					
					<form action="MemberJoin" name="joinForm" method="post">
						<table border="1" class="graph">
							<tr>
								<th width="80px">회원번호</th>
								<th width="50px">이름</th>
								<th width="50px">생년월일</th>
								<th width="100px">이메일</th>
								<th width="80px">전화번호</th>
								<th width="80px">이용횟수</th>
								<th width="80px">계정상태</th>
								<th width="80px">가입일자</th>
								<th width="80px">탈퇴일정</th>
								<th width="80px">수정</th>
							</tr>
						
							
							<c:set var="pageNum" value="1"/>
							<c:if test="${not empty param.pageNum}">
								<c:set var="pageNum" value="${param.pageNum}"/>
							</c:if>
														
							
							
							<c:forEach var="member" items="${memberList}">
							<tr>
								<th>${member.mem_idx}</th>
								<th>${member.mem_name}</th>
								<th>
									<c:set var="jumin" value="${member.mem_jumin}"/>
										${fn:substring(jumin,0,6)}
								</th>
								<th>${member.mem_email }</th>
								<th>${member.mem_tel}</th>
								<th>이용횟수</th>
								<th>
									<c:choose>
									      <c:when test="${member.mem_status eq 1}">
									      		<c:out value="활동중"/>
									      </c:when> 
									      <c:when test="${member.mem_status eq 2}">
									      		<c:out value="휴면중"/>
									      </c:when> 
									      <c:when test="${member.mem_status eq 3}">
									      		<c:out value="탈퇴"/>
									      </c:when> 
									</c:choose> 
								</th>
								<th>${member.mem_sign_date}</th>
								<th>${member.mem_withdraw_date}</th>
								<th><input type="button" value="상세정보 보기" onclick="correction()"></th>
							</tr>
							</c:forEach>
						</table>
					</form>
				</div>
			</div>
			
			
			<%--페이징 처리 --%>
			<br>
			<div id="pageList" align="center">
			
				<input type="button" value="이전"
					onclick="location.href='memberList?pageNum=${pageNum - 1}'"
					<c:if test="${pageNum <= 1}">disabled</c:if>>
				<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
					<c:choose>
						<c:when test="${i eq pageNum}">
							<b>${i}</b>
						</c:when>
						<c:otherwise>
							<a href="memberList?pageNum=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<input type="button" value="다음"
						onclick="location.href='memberList?pageNum=${pageNum + 1}'"
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


