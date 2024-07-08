<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<%-- top.jsp 페이지를 현재 페이지에 삽입 --%>
		<jsp:include page="/WEB-INF/views//inc/top.jsp"></jsp:include>
	</header>
	<article>
		<h1>회원 가입 완료</h1>
		<br>
		<div align="center">
		<input type="button" value="홈으로" onclick="location.href='./'">
		<input type="button" value="로그인" onclick="location.href='MemberLogin'">
		</div>
	</article>
	<footer>
		<%-- 회사 소개 영역(inc/botto.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views//inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>












