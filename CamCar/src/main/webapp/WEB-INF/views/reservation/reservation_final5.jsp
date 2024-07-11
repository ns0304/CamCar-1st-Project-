<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카_최종예약</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/reservation_final.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
		<header>
			<!-- 메뉴 -->
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		<main>
		<section id ="contents">
			<h2>예약완료</h2>
			<div id ="reservationStep" >
				<ul class="reservationStepList">
					<li>
						예약
					</li>
					<li>
						부가상품
					</li>
					<li>
						결제
					</li>
					<li id="reservationStepNow">
						완료
					</li>
				</ul>
			</div>
			<div id="reservationComplete" class="clear">
				<div id="completeContent">
					예약번호 <span>XXXXX</span>
					<h3><span>OOO</span>님, 예약이 완료되었습니다</h3>
					<hr>
					<span>월 일 00:00 ~ 월 일 00:00</span>에 이용하실<br>
					<span>차량이름</span>예약이 완료되었습니다
				</div>
				<div id="completeBtn">
					<input type="button" value="예약 상세 조회">
					<input type="button" value="홈으로 가기"  onclick="location.href = './'" >
				</div>
			</div>


		</section>
		</main>
	    <div class="insurancePopUp">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>보장내용을 알아볼까요?</h2>
	   	             <span class="close" id="closePopup">&times;</span>
		        </div>
		        <div class="popUpMessage">
		        </div>		        
	        </fieldset>
	    </div>	
	    
	<!-- okokokkokok 카카오톡 1:1문의하기 okokokkokok-->		
		<aside class="chatBtn">
			<jsp:include page="/WEB-INF/views/kakaoLink.jsp"></jsp:include>
		</aside>
		
		
	<footer>
		<!-- 회사 소개 영역 -->
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>


