<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style type="text/css">
#service {
	width: 700px;
	height: 400px;
}
/* 글자 위아래 간격 조절 */
p {
	line-height: 2;
}

.place {
	background-color: #f1f3f5;
	padding: 10px;
}
#service {
	border-radius: 8px;
}
.placeLetter {
	padding: 10px;
}

#products, #equipment {
	background-color: rgba(255, 255, 255, 0.5);
	padding: 0 10px;
	border-radius: 8px;
}
</style>
</head>
<body>
	<header>
		<!-- 메뉴 -->
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<main>
		<section>
			<div id="place1">
				<h2>🚗캠핑 차박 추천 장소!</h2>
				<p>🏕 캠핑갈카 차박(부산) - 녹산고향동산</p>
				<div class="place">
					<img src="${pageContext.request.servletContext.contextPath}/resources/img/service/녹산고향동산.png" id="service">
					<p>🙆‍♀️ 시원한 강뷰 추천장소!</p>
					<div class="placeLetter">
						<p>녹산고향동산은 시원한 강뷰를 보면서 넓은 들판에 차박을 할 수 있는 곳입니다.
						피크닉도 하기 좋아 피크닉 명소로도 알려져 있습니다. 봄이되면 벚꽃이 피어나 벚꽃캠핑까지 할 수 있는 곳이지만
						취사가 가능하지 않아 간단한 차박 정도만 가능한 곳이에요. 근처에 화장실 및 편의점도 있어서 편안하게 차박을
						할 수 있는 곳입니다.</p>
					</div>
				</div>
			</div>
			<br><br><br><br><br>
			
			<div id="place2">
				<p>🏕 캠핑갈카 차박(부산) - 동백방파제</p>
				<div class="place">
					<img src="${pageContext.request.servletContext.contextPath}/resources/img/service/동백방파제.png" id="service">
					<p>🙆‍♀️ 쾌적하고 편한 장소 추천!</p>
					<div class="placeLetter">
						<p>동백방파제는 다른 방파제에 비해 넓은 구조로 캠핑하기 좋은 곳입니다. 방파제 특성상 화장실도 위치하고 있어
							쾌적하게 사용할 수 있고 방파제근처로 가면 공터가 많아 공터에도 바다뷰를 가지고 있어 차박하기 좋습니다.</p><br><br>
						<p>기장에는 워낙 차박을 많이 하는곳이다 보니 주변 편의점에서 차박 용품을 판매하고 있어 쉽게 구입도 가능합니다.
							방파제인만큼 파도가 높고 날씨가 흐릴경우에는 들어 갈 수 없고 캠핑은 삼가하는것이 좋습니다.</p>
					</div>
				</div>
			</div>
			<br><br><br><br><br>
			
			<div id="place3">
				<p>🏕 캠핑갈카 차박(부산) - 삼락생태공원</p>
				<div class="place">
					<img src="${pageContext.request.servletContext.contextPath}/resources/img/service/삼락생태공원.jpg" id="service">
					<p>🙆‍♀️ 다양한 꽃들을 보고 싶은 장소 추천!</p>
					<div class="placeLetter">
						<p>그 어디에 차를 세워 두어도 푸름을 즐길 수 있는 곳이 있다. 그곳은 바로 부산 사상구의 삼락생태공원입니다.
							삼락생태공원은 낙동강하구 둔치 중 가장 넓은 습지이며, 다양한 자연환경과 편의시설을 갖춘 부산의 대표적인 공원입니다.
							대부분 삼락생태공원이라 하면 4월의 벚꽃길을 제일 먼저 떠올리지만, 5, 6월의 삼락공원은 더 다양한 꽃들과 푸름으로
							더 아름다운 경관을 볼 수 있습니다.</p>
					</div>
				</div>
			</div>
			<br><br><br><br><br>
			
			<div id="place4">
				<p>🏕 <b>초보 캠퍼가 알아야 할 것</b></p>
				<div class="place">
					<img src="${pageContext.request.servletContext.contextPath}/resources/img/service/문동방파제.jpg" id="service">
					<div class="placeLetter">
						<p>허가를 받지 않거나 지정된 장소를 제외한 산이나 강 등지에서 이루어지는 야영과 불을 피우는 취사 행위는 금지되어 있다.
						 차 밖에 텐트를 치는 행위 또한 원칙적으로는 불가하다. 가장 좋은 방법은 합법적인 '오토캠핑장'을 이용하거나
						  자동차 내부에 에어매트를 깔고 취침하는 것. 오토캠핑장 관련 정보는 한국관광공사가 운영하는 고캠핑에서 제공하고 있으니 참고하자.</p><br>
						<div id="products">
							<p>1️⃣ 캠핑 & 차박 준비물</p>
							<p><b>🏕필수템 :</b> 텐트, 방수포, 의자, 랜턴, 침낭 또는 두터운 담요나 이불, 에어매트, 버너, 코펠(냄비), 나이프, 아이스박스, 발열제,
							 간단 조리식품, 상비약, 테이블&의자, 화롯대, 타프, 베개, 도마, 휴대용 스피커(음량 조절 필수) 등</p>
							<p><b>🏕낭만템 :</b> 반짝반짝 알전구, 알록달록 가렌드와 바람개비 같은 소품을 활용하여 장식 추천</p>
						</div>
					</div>
				</div>
			</div>
			<br><br>
			
			<div id="place5">
				<div class="place">
					<img src="${pageContext.request.servletContext.contextPath}/resources/img/service/다대포해수욕장.jpg" id="service">
					<div class="placeLetter">
						<div id="equipment">
							<p>2️⃣ 장비 용어</p>
							<p><b>타프 :</b> 햇볕, 비, 눈 등을 막는 넓다란 천으로 전실(거실 공간)을 구성.
							 특히 여름철에 나무 그늘 아래에서 수액과 벌레를 차단하고, 땡볕의 열기를 차단하기 위해 사용</p>
							<p><b>팩 :</b> 텐트 및 타프를 바닥에 고정할 때 사용하는 용도</p>
							<p><b>사이트 :</b> 텐트를 구축할 수 있는 바닥의 구역. 나무데크, 파쇄석, 잔디 등으로 구분</p>
							<p><b>그라운드시트 :</b> 냉기, 습기 차단 및 오염 등을 방지하고자 텐트 설치 전에 바닥에 까는 방수포</p>
							<p><b>파워뱅크 :</b> 일명 '파뱅'. 고용량 배터리</p>
							<p><b>코펠 :</b> 음식을 담거나 조리할 때 사용하는 냄비 등의 장비</p>
							<p><b>토치 :</b> 가스연료를 사용해 숯이나 장작에 불을 피우는 도구</p>
							<p><b>스토브(버너) :</b> 취사를 위해 야외에서 사용하는 휴대용 연소기기</p>
							<p><b>자충 :</b> 구멍을 열면 자동으로 공기가 들어가는 구조를 가진 베개나 매트에 쓰이는 용어</p>
							<p><b>발열제 :</b> 간단하게 라면을 끓이거나 햇반, 레토르트 식품을 데울 때 쓰이는 휴대용 팩연료</p>
						</div>
					</div>
				</div>
			</div>
		</section>
	
		<!-- 예약정보 선택 영역 -->
		<aside id="reservation_container">
			<jsp:include page="/WEB-INF/views/reservation/reservation.jsp"></jsp:include>
		</aside>
	</main>


 
	
	
	<footer>
		<!-- 회사 소개 영역 -->
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
