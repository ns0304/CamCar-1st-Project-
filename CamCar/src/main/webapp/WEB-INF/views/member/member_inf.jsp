<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/manager_default.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<header>
	</header>
	<main>
		<section>
			<div>
				<div align="center">
					<h1>회원 상세정보</h1>
					<table border="1">
						
							<tr>
								<th>이름</th>
								<td>${member.mem_name}</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td>${member.mem_id}</td>
							</tr>
							<tr>
								<th>주소</th>
							    <td>${member.mem_add2}</td>
							</tr>
							<tr>
								<th>우편번호</th>
								<td>${member.mem_post_code}</td>
							</tr>	
							<tr>
								<th>E-Mail</th>
								<td>${member.mem_email}</td>
							</tr>
							<tr>
								<th>가입일</th>
								<td>${member.mem_sign_date}</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<c:set var="jumin" value="${member.mem_jumin}"/>
										${fn:substring(jumin,0,6)}
								</td>
							</tr>
								<th>전화번호</th>
								<td>${member.mem_tel}</td>
							</tr>
						
					</table>
				</div>
			</div>
		</section>
	</main>
	
	
	<footer>
		<jsp:include page="/WEB-INF/views//inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>












