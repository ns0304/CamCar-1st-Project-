<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/pw_find.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<%-- top.jsp 페이지를 현재 페이지에 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<article>
			<form action="PwFindPro" method="post">
				<section id="sec01">
					<table>
						<tr>
							<td id="td01">비밀번호 재설정</td>
						</tr>
						<tr>
							<td id="td02">찾고자 하는 아이디를 입력해주세요</td>
						</tr>
					</table>
				</section>	
				<section id="sec02">
					<table>
						<tr>
							<td id="td03">아이디</td>
							<td><input type="text" name="mem_id" id="mem_id" size="10"></td>
						</tr>
						
						<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
						<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
						<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
						<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
						<tr>
						<td id="td04">
							<input type="submit" value="다음">
<!-- 						<input type="button" value="다음" onclick="location.href='MemberJoin_two'"> -->
<!-- 						<input type="button" value="돌아가기" onclick="history.back()"> -->
						</td>
					</tr>
					</table>
				</section>
			</form>	
	</article>
	<footer>
		<%-- 회사 소개 영역(inc/botto.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views//inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>












