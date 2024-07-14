<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/id_find.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<%-- top.jsp 페이지를 현재 페이지에 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<main>
		<section>
			<h1>회원님의 아이디를 찾았어요!</h1>
				<table id="table01">
					<tr>
						<td width="70">아이디 : </td><td>${dbMember.mem_id}</td>
<%-- 							<td><input type="text" name="id_name" value="${sessionScope.sId}" required="required" size="15"></td> --%>
					</tr>
					<tr>
						<td width="70">가입일 : </td><td>${dbMember.mem_sign_date}</td>
					</tr>	
				</table>
				<table id="table02">
					<tr>
						<td id="td04">
							<input type="button" value="로그인하러 가기" onclick="location.href='MemberLogin'">
<!-- 						<input type="button" value="다음" onclick="location.href='MemberJoin_two'"> -->
<!-- 						<input type="button" value="돌아가기" onclick="history.back()"> -->
						</td>
					</tr>
				</table>	
		</section>
	</main>
	<footer>
		<%-- 회사 소개 영역(inc/botto.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views//inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>












