<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<%-- top.jsp 페이지를 현재 페이지에 삽입 --%>
		<jsp:include page="/WEB-INF/views//inc/top.jsp"></jsp:include>
	</header>
	<article>
		<h1>회원 상세정보</h1>
		<table border="1">
			<tr>
				<th>이름</th>
				<%--
				request 객체에 저장된 "member" 속성에 접근하여 회원 상세정보 출력
				=> EL 활용하며, request 객체(requestScope) 생략하고 member 라는 속성명으로 바로 접근
				=> ${member.멤버변수명} 형식으로 접근(실제로는 Getter 메서드 호출됨)
				--%>
				<td>${member.name}</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${member.id}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${member.post_code} / ${member.address1} ${member.address2}</td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td>${member.email}</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>${member.job}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${member.gender}</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>${member.hobby}</td>
			</tr>
			<tr>
				<th>가입동기</th>
				<td>${member.motivation}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${member.reg_date}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</article>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views//inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>












