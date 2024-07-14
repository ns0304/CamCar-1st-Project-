<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
<script type="text/javascript">
	function confirmDelete() {
		// 삭제 버튼 클릭 시 확인창을 통해 "삭제하시겠습니까?" 출력 후
		// 다이얼로그의 확인 버튼 클릭 시 "BoardDelete.bo" 서블릿 요청
		// => (파라미터  : 글번호, 페이지번호)
		
		if(confirm("삭제하시겠습니까?")) {
			location.href = "BoardDelete?bo_idx=${bo.bo_idx}&pageNum=${param.pageNum}";
		}
		
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		<section>
		<div align="center">
		
	<!-- 게시판 상세내용 보기 -->
	<article id="articleForm">
		<h2>글 상세내용 보기</h2>
		<section id="basicInfoArea">
			<table border="1">
			<tr><th width="280">제 목</th>
			<tr><td width="400" align="center">${bo.bo_subject}</td><tr></tr>
			<tr><th width="280">작성일시</th></tr>
			<tr><td width="400" align="center"><fmt:formatDate value="${bo.bo_sysdate}" pattern="yyyy-MM-dd HH:mm" /></td></tr>
			<tr><th width="280">공지사항 내용</th></tr>
			<tr><td width="400" align="center" height="480">${bo.bo_content}</td></tr>
			</table>
			<br>
		</section>
	<section id="commandCell">
		<%-- 답변, 수정, 삭제는 로그인 한 사용자에게만 표시 --%>
		<%-- 단, 수정 삭제 버튼은 세션 아이디와 작성자 아이디가 일치할 경우에만 표시 --%>
		<c:if test="${not empty sessionScope.sId}">
				<input type="button" value="수정" onclick="location.href='BoardModify?bo_idx=${bo.bo_idx}&pageNum=${param.pageNum}'">
				<%-- 임시) 삭제 버튼 클릭 시 BoardDeleteForm.bo 서블릿 요청(삭제 폼 페이지 포워딩) --%>
<%-- 				<input type="button" value="삭제" onclick="location.href='BoardDeleteForm.bo?boardNum=${board.board_num}'"> --%>
				<%-- 삭제 버튼 클릭 시 패스워드 확인 없이 사용자에게 삭제 확인만 받기 위해서 --%>
				<%-- 자바스크립트 confirmDelete() 메서드 호출하여 확인 후 비즈니스 로직 요청 --%>
				<input type="button" value="삭제" onclick="confirmDelete()">
		</c:if>
	</section>
	<br>
	</article>
	</div>
	</section>
	</main>
	<br>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
















