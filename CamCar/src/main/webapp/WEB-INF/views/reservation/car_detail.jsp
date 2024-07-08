<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 : 차량 리스트</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>

<style type="text/css">
/* ---- 우측 예약 일정 영역 ---- */
#schedule_container {
	/* 	position: -webkit -sticky; */ /* IE버전 낮을경우 이 항목 추가 입력 */
	position: sticky;
	top: 100px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 12px;
	padding: 20px;
	margin-left: 15px;
	width: 420px; height: 300px;
	box-sizing: border-box;
	z-index: 10;
}

#schedule_wrap {
	border: 1px solid #ccc;
	border-radius: 12px;
	padding: 20px 10px;
	
}

#reservation {
	width: 100%; height: 40px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	border: none;
}
#reservation:hover {
	box-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

#schedule_container img {
	width: 15px; height: 15px;
}


</style>

<script type="text/javascript">
$(document).ready(function() {
    
    
});
</script>

</head>
<body>
	<header>
		<!-- 메뉴 -->
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	
	<main>
		<section>
			
			<div>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>
		</section>
		
		<!-- 예약 일정 영역 -->
		<aside id="schedule_container">
			<form action="Reservation" name="reservation" method="post">
				<div>
					<b>회원님과 함께하는 여정</b><br><br>
				</div>
				<div id="schedule_wrap">
					<a><img alt="pin.png" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/pin.png"> ${param.brc_rent_name}</a>
					<hr>
					<a><img alt="calendar.png" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/calendar.png"> ${param.res_rental_date} ~ ${param.res_return_date}</a>
					<hr>
					<a><img alt="campingcar.png" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/campingcar.png"> ${param.car_info}</a>
				</div>
				<div id="pay_wrap" >
					<h3>00,000원</h3>
				</div>
				
				<div class="center">
					<input type="submit" id=reservation value="예약하기">
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