<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 공지사항 글 등록</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
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
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<!-- 게시판 등록 -->
		<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		<section>
			<div align="center">

				<article id="writeForm">
					<h1>공지사항 글 등록</h1>
					<form action="BoardWrite" name="writeForm" method="post" enctype="multipart/form-data">
					
						<table>
							<tr>
								<td class="write_td_left"><label for="bo_subject">제목</label></td>
								<td class="write_td_right"><input type="text"
									id="bo_subject" name="bo_subject" required="required" /></td>
							</tr>
							<tr>
								<td class="write_td_left"><label for="bo_content">내용</label></td>
								<td class="write_td_right"><textarea id="bo_content"
										name="bo_content" rows="15" cols="40" required="required"></textarea>
								</td>
							</tr>
							<tr>
								<td class="write_td_left"><label for="bo_file">파일첨부</label></td>
								<td class="write_td_right">
									<input type="file" name="file">
									<hr>
								</td>
							</tr>
						</table>
						<section id="commandCell">
							<input type="submit" value="등록">&nbsp;&nbsp;  
							<input type="button" value="취소" onclick="history.back()">
						</section>
					</form>
				</article>
			</div>
		</section>
	</main>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>








