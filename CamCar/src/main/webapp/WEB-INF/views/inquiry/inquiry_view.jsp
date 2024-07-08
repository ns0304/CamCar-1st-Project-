<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 하기</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#articleForm {
		width: 500px;
		height: 550px;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		border: 1px solid black;
		border-collapse: collapse; 
	 	width: 500px;
	}
	
	th {
		text-align: center;
	}
	
	td {
		width: 150px;
		text-align: center;
	}
	
	#basicInfoArea {
		height: 70px;
		text-align: center;
	}
	
	#articleContentArea {
		background: orange;
		margin-top: 20px;
		height: 350px;
		text-align: center;
		overflow: auto;
		white-space: pre-line;
	}
	
	#commandList {
		margin: auto;
		width: 500px;
		text-align: center;
	}
</style>
<script type="text/javascript">
	function confirmDelete() {
		// 삭제 버튼 클릭 시 확인창을 통해 "삭제하시겠습니까?" 출력 후
		// 다이얼로그의 확인 버튼 클릭 시 "BoardDelete.bo" 서블릿 요청
		// => (파라미터  : 글번호, 페이지번호)
		
		if(confirm("삭제하시겠습니까?")) {
			location.href = "BoardDelete.bo?board_num=${board.board_num}&pageNum=${param.pageNum}";
			
		}
		
	}
</script>
</head>
<body>
	<header>
		<!-- Login, Join 링크 표시 영역 -->
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<!-- 게시판 상세내용 보기 -->
	<article id="articleForm">
		<h2>1:1 문의 하기</h2>
		<section id="basicInfoArea">
			<table border="1">
			<tr><th width="70">제 목</th><td colspan="3">${board.board_subject}</td></tr>
			<tr>
				<th width="70">작성자</th><td>${board.board_name}</td>
				<%-- 작성일시 출력 형식은 ex) 2024-06-04 12:30 --%>
				<th width="70">작성일시</th><td><fmt:formatDate value="${board.board_date}" pattern="yyyy-MM-dd HH:mm" /></td>
			</tr>
			<tr>
				<th width="70">작성자IP</th><td>${board.board_writer_ip}</td>
				<th width="70">조회수</th><td>${board.board_readcount}</td>
			</tr>
			</table>
		</section>
		<%-- 게시글 본문 출력 영역 --%>
		<section id="articleContentArea">
			${board.board_content}
		</section>
	<section id="commandCell">
		<%-- 답변, 수정, 삭제는 로그인 한 사용자에게만 표시 --%>
		<%-- 단, 수정 삭제 버튼은 세션 아이디와 작성자 아이디가 일치할 경우에만 표시 --%>
		<c:if test="${not empty sessionScope.sId}">
			<input type="button" value="답변" onclick="location.href='BoardReplyForm.bo?board_num=${board.board_num}&pageNum=${param.pageNum}'">
			<c:if test="${sessionScope.sId eq board.board_name}">
				<input type="button" value="수정" onclick="location.href='BoardModifyForm.bo?board_num=${board.board_num}&pageNum=${param.pageNum}'">
				<%-- 임시) 삭제 버튼 클릭 시 BoardDeleteForm.bo 서블릿 요청(삭제 폼 페이지 포워딩) --%>
<%-- 				<input type="button" value="삭제" onclick="location.href='BoardDeleteForm.bo?boardNum=${board.board_num}'"> --%>
				<%-- 삭제 버튼 클릭 시 패스워드 확인 없이 사용자에게 삭제 확인만 받기 위해서 --%>
				<%-- 자바스크립트 confirmDelete() 메서드 호출하여 확인 후 비즈니스 로직 요청 --%>
				<input type="button" value="삭제" onclick="confirmDelete()">
			</c:if>
		</c:if>
		
		<%-- 목록 버튼 클릭시 BoardList.bo 서블릿 요청(파라미터 : 페이지번호) --%>
		<input type="button" value="목록" onclick="location.href='BoardList.bo?pageNum=${param.pageNum}'">
	</section>
	</article>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
















