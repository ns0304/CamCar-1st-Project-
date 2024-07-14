<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 게시물</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#articleForm {
		width: 500px;
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
		height: auto;
		text-align: center;
	}
	
	#board_file {
		height: auto;
		font-size: 12px;
	}
	
	#articleContentArea {
		background: orange;
		margin-top: 10px;
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
		// 삭제 버튼 클릭 시 확인창(confirm dialog)을 통해 "삭제하시겠습니까?" 출력 후
		// 다이얼로그의 확인 버튼 클릭 시 "BoardDelete.bo" 서블릿 요청
		// => 파라미터 : 글번호, 페이지번호
		if(confirm("삭제하시겠습니까?")) {
			location.href = "QnaDelete?qna_number=${qna.qna_number}&pageNum=${param.pageNum}";
		}
	}
</script>
</head>
<body>
	<header>
		<!-- Login, Join 링크 표시 영역 -->
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<main>
		<aside>
			<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		</aside>
		<!-- 게시판 상세내용 보기 -->
		<section id="articleForm">
			<form action="QnaReplyPro" name="QnaReplyPro" method="post">
				<h2>1:1 문의글 상세내용 보기</h2>
				<div id="basicInfoArea">
					<table border="1">
					<tr><th width="70">제 목</th><td colspan="3">${qna.qna_inquery}</td></tr>
					<tr>
						<td>qna_number</td><td>${qna.qna_number}</td>
						<th width="70">작성자</th><td>${qna.mem_id}</td>
						<%-- 작성일시 출력 형식은 ex) 2024-06-04 12:30 --%>
						<th width="70">작성일시</th>
						<td><fmt:formatDate value="${qna.qna_date}" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<th colspan="4">문의내용</th>
					</tr>
					<tr>
						<td colspan="4" style="height: 100px;">${qna.qna_content}</td>
					</tr>
					</table>
				</div>
				<!-- 답변 영역 -->
				<%-- 답글, 수정, 삭제 버튼은 로그인 한 사용자에게만 표시 --%>
				<%-- 단, 수정, 삭제 버튼은 세션 아이디와 작성자 아이디가 일치할 경우에만 표시 --%>
				<c:if test="${sessionScope.sId eq 'admin'}">
					<div id="articleReplyArea">
						<b>답변</b>
						<textarea rows="10" cols="67" name="qna_reply "></textarea>
						<input type="submit" value="등록">
						<input type="button" value="돌아가기" onclick="history.back()">
					</div>
				</c:if>
			</form>
		</section>
	</main>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
















