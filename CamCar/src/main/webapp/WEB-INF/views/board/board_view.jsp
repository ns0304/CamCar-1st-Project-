<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 공지사항 게시판</title>
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
</head>
<body>
	<header>
		<!-- Login, Join 링크 표시 영역 -->
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<!-- 게시판 상세내용 보기 -->
	<main>
	<section id="articleForm">
		<h2>글 상세내용 보기</h2>
		<section id="basicInfoArea">
			<table border="1">
			<tr><th width="70">제 목</th><td colspan="3">${bo.bo_subject}</td></tr>
			<tr>
				<%-- 작성일시 출력 형식은 ex) 2024-06-04 12:30 --%>
				<th width="70">작성일시</th><td><fmt:formatDate value="${bo.bo_sysdate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th width="70">조회수</th><td>${bo.bo_readcount}</td>
			</tr>
			</table>
		</section>
		<%-- 게시글 본문 출력 영역 --%>
		<section id="articleContentArea">
			${bo.bo_content}
		</section>
	<section id="commandCell">
		<%-- 목록 버튼 클릭시 BoardList.bo 서블릿 요청(파라미터 : 페이지번호) --%>
		<input type="button" value="목록" onclick="location.href='board_list?pageNum=${param.pageNum}'">
	</section>
	</section>
	</main>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
















