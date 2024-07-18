<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
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
						<b>완료</b>
					</li>
				</ul>
			</div>
			<div id="reservationComplete" class="clear">
				<div id="completeContent">
					예약번호 No.<span>${pay_idx}</span>
					<h3><b><span>${sId}</span>님, 예약이 완료되었습니다</b></h3>
					
					<a>${param.rental_date} ~ ${param.return_date}</a> 에 이용하실<br>
					<a>${carDetail.car_model}</a> 예약이 완료되었습니다
				</div>
				<div id="completeBtn">
					<input type="button" class="completeBtnAll" value="예약 상세 조회" >
					<input type="button" class="completeBtnAll" value="홈으로 가기"  onclick="location.href = './'" >
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


