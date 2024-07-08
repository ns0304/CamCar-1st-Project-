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
	<article>
			<form action=IdFindPro method="post">
				<section id="sec01">
					<table>
						<tr>
							<td id="td01">아이디 찾기</td>
						</tr>
						<tr>
							<td id="td02">회원정보에 등록한 휴대전화 번호 입력한 전화번호가 같아야 인증번호를 받을 수 있습니다.</td>
						</tr>
					</table>
				</section>	
				<section id="sec02">
					<table>
						<tr>
							<td id="td03">휴대전화번호</td>
						</tr>
						<tr>
							<td>
								<select name="CountryCode">
									<option value="+82">+82</option>
								</select>
							</td>
							<td><input type="text" id="mem_tel" name="mem_tel" size="10"></td>
							<th id="th01" align="left"><input type="submit" value="인증번호 받기" ></th>
						</tr>	
						<tr>
							<td><input type="text" name="name" placeholder="인증번호 입력" size="8"></td>
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












