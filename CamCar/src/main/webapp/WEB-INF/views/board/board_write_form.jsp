<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- 오목이란 5개가 한줄이 되게 하면 이기는 게임입니다. -->
<style type="text/css">
table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 20px;
}
table th, table td {
    padding: 8px;
    text-align: left;
    border: 1px solid #ddd;
    font-size: 14px;
    background-color: #f9f9f9;
}
table th {
    background-color: #f2f2f2;
    color: #333;
}
table tr:hover {
    background-color: #f2f2f2;
}
table th, table td:nth-child(3) {
    white-space: nowrap; /* 생년월일 칼럼 텍스트가 너무 길 때 줄이지 않도록 설정 */
}
table input[type="button"] {
    padding: 5px 10px;
    background-color: #00838f;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s;
}
table input[type="button"]:hover {
    background-color: #006064;
}
</style>
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








