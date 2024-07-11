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
			<h2>부가상품</h2>
			<div id ="reservationStep" >
				<ul class="reservationStepList">
					<li>
						예약
					</li>
					<li id="reservationStepNow">
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
			<div id="addItem" class="clear">
				<div class="addItem1">
					<h3>캠핑아이템</h3>
					<div id="campingItem">
						<div id="campingSet">
						<h4>추천 세트</h4>
						테이블 + 인원별(체어+매트+식기류)<br>
							<div id ="campingSetBtn">
								<input type="button" value="2인" id="campingSetBtn1">
								<input type="button" value="3인" id="campingSetBtn2">
								<input type="button" value="4인" id="campingSetBtn3">
							</div>
						</div>
						<br>
						<h4>개별</h4>
						테이블 + 인원별(체어+매트+식기류)<br>
						<div id="campingEtc">
							<div id="campingEtcRow1">
								<input type="button" value="퍼니처" id="campingEtc1">
								<input type="button" value="침낭/매트" id="campingEtc2">
								<input type="button" value="화로/BBQ" id="campingEtc3">
								<input type="button" value="기타" id="campingEtc4">
							</div>
							<div id="campingEtcRow2">
								<input type="button" value="라이팅" id="campingEtc5">
								<input type="button" value="계절용품" id="campingEtc6">
								<input type="button" value="기타" id="campingEtc7">
							</div>
						</div>
					</div>
				</div>	
				<div class="addItem2">
					<h3>기본아이템</h3>
					<div id="basicItem">
						<div id ="basicBtn">
							<input type="button" value="카시트" id="basicBtn1">
							<input type="button" value="유모차" id="basicBtn2">
							<input type="button" value="휠체어" id="basicBtn3">
						</div>
					</div>
				</div>
			</div>

		</section>
				
		<!-- 오른쪽 사이드 영역 -->
		<aside id="sideContent">
<%-- 			<jsp:include page="/WEB-INF/views/reservation/sideContent.jsp"></jsp:include> --%>
			<form action="ReservationPay" name="reservation" method="post">
				<img src="${pageContext.request.servletContext.contextPath}/resources/img/campingcarImage.png" id="campingcarImage" height="120px">
					<div class="sideDiv">
						000님의 여정       
						<a href="#" class="right">수정</a>
						<div class="clear">
							<a>XX</a>지점
					          <hr>
							<a>mm:dd yy:MM ~ mm:dd yy:MM</a>
					          <hr>
							<a>차량종류</a>
						</div>
					</div>
					<div class="sideDiv">	
						운전자      
						<a href="#" class="right">수정</a>
						<div class="clear">
							<a>운전자이름</a><br>
							<a>면허종류</a>/<a>생년월일</a>
						</div>
					</div>	
					<div class="sideDiv">	
						결제금액<br>
						표준가<a>000</a>원
						<hr>
						보험료<a>000</a>원
						<hr>
						총 결제금액<a>000</a>원
					</div>	
		          <button type="submit">다음</button>		
			</form>
		</aside>
		</main>

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


