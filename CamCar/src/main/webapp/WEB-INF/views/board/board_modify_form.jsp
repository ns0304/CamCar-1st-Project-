<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#modifyForm {
		width: 500px;
		height: 450px;
		margin: auto;
	}
	
	h1 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 450px;
	}
	
	.td_left {
		width: 150px;
		background: orange;
		text-align: center;
	}
	
	.td_right {
		width: 300px;
		background: skyblue;
	}
	
	#commandCell {
		text-align: center;
	}
</style>
</head>
<body>
	<header>
		<!-- Login, Join 링크 표시 영역 -->
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<!-- 게시판 글 수정 -->
	<article id="modifyForm">
		<h1>게시판 글 수정</h1>
		<form action="BoardModifyPro.bo" name="modifyForm" method="post">
		<%-- 입력받지 않은 글번호, 페이지번호는 input 태그의 hidden 속성으로 파라미터에 포함시킬 수 있음 --%>
			<input type="hidden" name="board_num" value="${board.board_num}">
			<input type="hidden" name="pageNum" value="${param.pageNum}">
			<table>
				<tr>
					<td class="td_left"><label for="board_name">글쓴이</label></td>
					<td class="td_right">
						<%-- 글쓴이(작성자)는 세션 아이디값 그대로 출력(읽기 전용) --%>
						<input type="text" name="board_name" value="${sessionScope.sId}" readonly required />
					</td>
				</tr>
				<%-- 제목, 내용 입력란은 DB에서 조회된 데이터(BoardBean 객체)를 표시 --%>
				<tr>
					<td class="td_left"><label for="board_subject">제목</label></td>
					<td class="td_right">
						<input type="text" id="board_subject" name="board_subject" value="${board.board_subject}" required />
					</td>
				</tr>
				<tr>
					<td class="td_left"><label for="board_content">내용</label></td>
					<td class="td_right">
						<textarea id="board_content" name="board_content" rows="15" cols="40" required>${board.board_content}</textarea>
					</td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="수정">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기">&nbsp;&nbsp;
				<input type="button" value="취소" onclick="history.back()">
			</section>
		</form>
	</article>
</body>
</html>








