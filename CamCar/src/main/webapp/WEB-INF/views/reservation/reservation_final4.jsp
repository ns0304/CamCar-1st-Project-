<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카_최종예약</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- <link href="${pageContext.request.servletContext.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css"> --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/reservation_final.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
<!-- 	<div id="container"> -->
		<header>
			<!-- 메뉴 -->
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		<main>
		<section id ="contents">
			<h2>결제</h2>
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
					<li>
						완료
					</li>
				</ul>
			</div>
			<div id="paymentContent" class="clear">
				<div class="payment" >
					<h3>결제방법</h3>
					<div id="paymentOption">
						<div id ="paymentBtn">
							<input type="button" value="신용/체크카드" id="paymentBtn1">
							<input type="button" value="카카오페이" id="paymentBtn2">
							<input type="button" value="네이버페이" id="paymentBtn3">
						</div>
					</div>
				</div>	
				<div class="userAgreement">
					<h3>이용약관 동의</h3>
					<div id="userAgreementCheck">
						<input type="checkbox"> 모든 필수/선택 약관을 확인하고 전체 동의합니다. <br>
						<hr>
						<input type="checkbox"> 고유식별정보 수집 및 이용 동의(필수)<a href="#" class="detail">보기</a> <br>
						<input type="checkbox"> 대여자격 확인 및 동의(필수)<a href="#" class="detail">보기</a><br>
						<input type="checkbox"> 개인정보 수집 및 이용 동의(필수)<a href="#" class="detail">보기</a><br>
						<input type="checkbox"> 개인정보 제3자 제공 동의(필수)<a href="#" class="detail">보기</a><br>
						<input type="checkbox"> 고유식별정보 제3자 제공에 관한 동의(필수) <a href="#" class="detail">보기</a><br>
						<input type="checkbox"> 자동차 표준 대여약관(필수) <a href="#" class="detail">보기</a><br>
						<input type="checkbox"> 취소 및 위약금 규정 동의(필수)<a href="#" class="detail">보기</a>
					</div>
				</div>
			</div>

		</section>
		<aside id="sideContent">
<!-- 		<aside id="reservation_container"> -->
			<jsp:include page="/WEB-INF/views/reservation/sideContent.jsp"></jsp:include>
		</aside>
		</main>

	<!-- okokokkokok 카카오톡 1:1문의하기 okokokkokok-->		
		<aside class="chatBtn">
		 <nav>
		  <a href="#sec01">
		  <img src="${pageContext.request.servletContext.contextPath}/resources/img/main/chat.png"><br>
		  채팅상담</a>
		 </nav>
		</aside>	
		
		
	<footer>
		<!-- 회사 소개 영역 -->
<%-- 		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include> --%>
	</footer>
<!-- 	</div> -->
</body>
</html>


