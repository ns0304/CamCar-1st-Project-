<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- 
<style type="text/css">
	#writeForm {
		width: 500px;
		height: 450px;
		margin: auto;
	}
	
	#writeForm > table {
		margin: auto;
		width: 450px;
	}
	
	.write_td_left {
		width: 150px;
		background: orange;
		text-align: center;
	}
	
	.write_td_right {
		width: 300px;
		background: skyblue;
	}
</style>--%>
</head>
<body>
	<%-- 로그인하지 않은 사용자 접근 시 "회원만 글쓰기가 가능합니다" 출력 후 로그인 페이지로 이동 --%>
	<%-- 미로그인 = 세션에 저장된 "sId" 속성값이 비어있음 --%>
<%-- 	<c:if test="${empty sessionScope.sId}"> --%>
		<%-- <script type="text/javascript"> 
 			alert("회원만 글쓰기가 가능합니다");
 			location.href = "MemberLoginForm.me";
		</script>
		--%>
<%-- 	</c:if> --%>
	<header>
		<%-- inc/top.jsp 페이지 삽입(jsp:include 액션태그 사용 시 / 경로는 webapp 가리킴) --%>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<!-- 게시판 등록 -->
	<article id="writeForm">
		<h1>1:1 문의하기</h1>
		<form action="InquiryWritePro" name="writeForm" method="post">
			<table>
<!-- 				<tr> -->
<!-- 					<td class="write_td_left"><label for="board_name">글쓴이</label></td> -->
<!-- 					<td></td> -->
<%-- 					글쓴이(작성자)는 세션 아이디값 그대로 출력(읽기 전용) --%>
<%-- 					<td class="write_td_right"><input type="text" name="board_name" value="${sessionScope.sId}" required="required" /></td> --%>
<!-- 				</tr> -->
					<tr>
						<td >유형&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성자 아이디</td>
					</tr>
					<tr>
						<td>
							<select name="category">
							<option value="예약/계약상담">예약/계약상담</option>
							<option value="차량인도">차량인도</option>
							<option value="정비/사고">정비/사고</option>
							<option value="결제">결제</option>
							<option value="계약변경/종료">계약변경/종료</option>
							<option value="기타">기타</option>
							</select>
<%-- 						<td class="write_td_right"><input type="text" name="board_name" value="${sessionScope.sId}" required="required" /></td> --%>
							<input type="text" name="mem_id" value="${sessionScope.sId}" required="required" size="15" readonly="readonly">
						</td>
					</tr>
				<%-- 세션 아이디를 사용하여 작성자를 구별하므로 비밀번호는 불필요 --%>
<!-- 				<tr> -->
<!-- 					<td class="write_td_left"><label for="board_pass">비밀번호</label></td> -->
<!-- 					<td class="write_td_right"> -->
<!-- 						<input type="password" name="board_pass" required="required" /> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<td class="write_td_left"><label for="qna_inquery">제목</label></td>
				</tr>
				<tr>
					<td class="write_td_right"><input type="text" id="qna_inquery" size="35" placeholder="한글 기준 2자 ~ 50자 사이로 입력해주세요" name="qna_inquery" required="required" /></td>
				</tr>
				<tr>
					<td class="write_td_left"><label for="qna_content">내용</label></td>
				</tr>
				<tr>
					<td class="write_td_right">
						<textarea id="qna_content" name="qna_content" rows="15" cols="40" placeholder="한글 기준 10자 이상 입력해주세요" required="required"></textarea>
					</td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="등록">&nbsp;&nbsp;
				<input type="button" value="취소" onclick="history.back()">
			</section>
		</form>
	</article>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>








