<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/login_form.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<%-- top.jsp 페이지를 현재 페이지에 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<article>
			<h1>로그인</h1>
			<form action="MemberLoginPro" method="post">
				<section>
					<table>
						<tr>
							<td>아이디</td>
						</tr>
						<tr>
							<td><input type="text" name="mem_id" required size="18"></td>
							<th id="th01" align="left" colspan="3" rowspan="3"><input type="submit" value="로그인" style="height: 70px;width: 170px;"></th>
						</tr>
						<tr>
							<td id="td01"><input type="checkbox" name="rememberId">아이디 저장</td>
							<!-- checkbox 생성 시 value 속성 지정하지 않으면 체크값이 "on", 미체크 시 null -->
						</tr>	
						<tr>
							<td>비밀번호</td>
						</tr>
						<tr>
							<td><input type="password" name="mem_passwd" size="18" required></td>
							<td id="td02" onclick="location.href='MemberJoin'">회원가입&nbsp;&nbsp;&nbsp;&nbsp;</td>
<!-- 							<td></td> -->
							<td id="td03"  onclick="location.href='Id_find'">아이디 찾기/</td>
							<td id="td04" onclick="location.href='Passwd_find'">비밀번호 찾기</td>
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












