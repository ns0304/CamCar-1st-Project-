<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/MVC_Board = webapp) 이므로 inc 디렉토리의 top.jsp 지정 --%>
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		<section>
			<div align="center">
				<h1>신규 차량 등록</h1>
				<form action="MemberJoin" name="joinForm" method="post">
					<table border="1">
						<tr>
							<th rowspan="14"><img src="resources/img/car.jpg" width="200" height="400" ></th>
							<th>차량 코드</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<th>차량 번호</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<th>제조사</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<th>모델명</th>
							<th><select>
									<option>진성민</option>
									<option>옥혜지</option>
									<option>최지민</option>
									<option>최민석</option>
									<option>하지형</option>
							</select></th>
						</tr>
						<tr>
							<th>연식</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<th>정원</th>
							<th><select>
									<option>2인승</option>
									<option>5인승</option>
									<option>7인승</option>
							</select></th>
						</tr>
						<tr>
							<th>나이 제한</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<th>운전경력제한</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<th>주중 대여료</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<th>주말 대여료</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<th>차량 지점 코드</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<th>차종</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<th>변속 타입</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<th>연료</th>
							<th><input type="text"></th>
						</tr>
						<tr>
							<td class="write_td_right" colspan="2">
								<label for="board_file">차량 사진 첨부 파일</label>
							</td>
							<td class="write_td_left">
								<input type="file" name="file" multiple=>
							</td>
						</tr>
					</table>
					<div align="right">
						<input type="button" value="등록하기">
					</div>
				</form>
			</div>
		</section>
	</main>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>


