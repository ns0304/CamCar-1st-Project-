<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 : 차량 리스트</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/reservation.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>

</head>
<body>
	<header>
		<!-- 메뉴 -->
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	
	<main>
		<section>
			<div>
			
			</div>
		</section>
		
		<!-- 예약 -->
		<aside id="research_container">
			<form action="Reservation" name="reservation" method="post">
				<div class="center">
					<b>000님과 함께하는 여정</b><br><br>
				</div>
				<a href="">&#127968; 캠핑갈카지점 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수정</a><br>
				<a href="">&#128467; 06.13(금) 18:30 ~ 06.15(일) 16:30 <br>&nbsp;&nbsp;&nbsp;수정</a><br><br>
				<div class="center">
					<input type="reset" id="research" value="재검색">
				</div>
			</form>
		</aside>
		
	</main>
	
	<footer>
		<!-- 회사 소개 영역 -->
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>