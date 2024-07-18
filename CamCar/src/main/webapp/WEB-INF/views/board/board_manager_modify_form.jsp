<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
#articleForm {
	width: 500px;
	margin: auto;
}

.img_btn_delete {
	width: 10px;
	height: 10px;
}

table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 20px;
}

table th, table td {
	padding: 8px;
	text-align: center;
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
<script type="text/javascript">
	function deleteFile(bo_idx, bo_file) {
		console.log(bo_idx + ", " + bo_file);
		if (confirm("파일을 삭제하시겠습니까?")) {
			location.href = "BoardDeleteFile?bo_idx=" + bo_idx + "&bo_file="
					+ bo_file;
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<aside>
			<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		</aside>
		<section id="articleForm">
			<div align="center">

				<!-- 공지글 수정 -->
				<article>
					<h1>공지사항 글 수정</h1>
					<form action="BoardModify" name="modifyForm" method="post"
						enctype="multipart/form-data">
						<%-- 입력받지 않은 글번호, 페이지번호는 input 태그의 hidden 속성으로 파라미터에 포함시키기 --%>
						<input type="hidden" name="bo_idx" value="${bo.bo_idx}"> <input
							type="hidden" name="pageNum" value="${param.pageNum}">
						<table>
							<%-- 제목, 내용 입력란은 DB에서 조회된 데이터(BoardBean 객체)를 표시 --%>
							<tr>
								<td class="td_left"><label for="bo_subject">제목</label></td>
								<td class="td_right"><input type="text" id="bo_subject"
									name="bo_subject" value="${bo.bo_subject}" required /></td>
							</tr>
							<tr>
								<td class="td_left"><label for="bo_file">첨부 파일</label></td>
								<td class="td_right"><c:choose>
										<c:when test="${not empty bo.bo_file}">
								${bo.bo_file}
								<a href="javascript:deleteFile(${bo.bo_idx},'${bo.bo_file}')">
												<img
												src="${pageContext.request.contextPath}/resources/img/icon/delete-icon.png"
												class="img_btn_delete" title="파일삭제">
											</a>
										</c:when>
										<c:otherwise>
											<input type="file" id="bo_file" name="file"
												value="${bo.bo_file}" required />
										</c:otherwise>
									</c:choose></td>

							</tr>
							<tr>
								<td class="td_left"><label for="bo_content">내용</label></td>
								<td class="td_right"><textarea id="bo_content"
										name="bo_content" rows="15" cols="40" required>${bo.bo_content}</textarea>
								</td>
							</tr>
						</table>
						<section id="commandCell">
							<input type="submit" value="수정">&nbsp;&nbsp; <input
								type="reset" value="다시쓰기">&nbsp;&nbsp; <input
								type="button" value="취소" onclick="history.back()">
						</section>
					</form>
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
