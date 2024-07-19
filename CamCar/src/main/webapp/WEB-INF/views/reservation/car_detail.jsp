<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 : ${carDetail.car_model} 상세정보</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script
	src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<%-- 카카오지도 설치 스크립트 --%>
<script charset="UTF-8" class="daum_roughmap_loader_script"
	src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
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
	width: 420px;
	height: 340px;
	box-sizing: border-box;
	z-index: 10;
}

#schedule_wrap {
	border: 1px solid #ccc;
	border-radius: 12px;
	padding: 20px 10px;
}

#reservation {
	width: 100%;
	height: 40px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	border: none;
	background-color: #59b9a9;
	color: white;
}

#reservation:hover {
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

/* 아이콘 크기 지정 */
.icon {
	width: 15px;
	height: 15px;
}
/* ---------------------------------------------- */

/* ----------------- 차량상세 ------------------- */
/* ---- carDetail_top ---- */
.carDetail_image img {
	width: 100%;
	height: 400px;
	object-fit: cover;
}

.carDetail_images img {
	width: 120px;
	height: 70px;
	margin: 10px 0 20px 0;
	object-fit: cover;
}
/* 선택된 이미지 border 처리 */
.selected {
	border: 2px solid #ccc;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.fuel, .persons, .carYear, .driverAge, .driverEx {
	border: 1px solid #ccc;
	border-radius: 12px;
	padding: 20px 10px;
	margin: 10px;
	width: 20%;
	box-sizing: border-box;
}

/* 이용자 리뷰 */
.rev {
	margin-top:10px;
	border: 1px solid #ccc;
	border-radius: 12px;
	padding: 0 30px;
	margin: 10px;
}
.rev, .userRev {
	display: flex;
	height: 50px;
	justify-content: space-between;
}
.rev span:not(.total) {
	padding-top: 10px;
/* 	color: #59b9a9; */
}
.total {
	padding: 25px 10px 0 0;
	font-size: 12px;
	
}

/* 지도 크기 */
.mapImg {
	width: 720px;
	height: 360px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		// 첫 번째 이미지에 selected 클래스 추가
		$("#img1").addClass("selected");

		$(".changeImg").click(function() {
			let newSrc = $(this).attr('src');
			$("#mainImg").attr('src', newSrc);

			// 모든 changeImg 클래스 요소에서 selected 클래스를 제거
			$(".changeImg").removeClass("selected");

			// 클릭된 이미지에 selected 클래스 추가
			$(this).addClass("selected");
		});

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
			<div class="title_wrap">
				<h2>${carDetail.car_model}</h2>
			</div>
			<div class="carDetail">
				<div class="carDetail_image">
					<img
						src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image1}"
						id="mainImg">
				</div>
				<div class="carDetail_images"
					style="display: flex; justify-content: space-between;">
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image1}"
							id="img1" class="changeImg" selected>
					</div>
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image2}"
							id="img2" class="changeImg">
					</div>
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image3}"
							id="img3" class="changeImg">
					</div>
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image4}"
							id="img4" class="changeImg">
					</div>
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image5}"
							id="img5" class="changeImg">
					</div>
				</div>
				<div class="carDetail_info">
					<p style="font-size: 18px;">차량 정보</p>
					<hr>
					<div style="display: flex;">
						<div class="fuel">
							<img class="icon"
								src="${pageContext.request.servletContext.contextPath}/resources/img/icon/fuel.png">
							연료<br> ${carDetail.car_fuel_type}
						</div>
						<div class="persons">
							<img class="icon"
								src="${pageContext.request.servletContext.contextPath}/resources/img/icon/persons.png">
							승차인원<br> ${carDetail.car_riding}명
						</div>
						<div class="carYear">
							<img class="icon"
								src="${pageContext.request.servletContext.contextPath}/resources/img/icon/carYear.png">
							연식<br> ${carDetail.car_old}
						</div>
						<div class="driverAge">
							<img class="icon"
								src="${pageContext.request.servletContext.contextPath}/resources/img/icon/driverAge21.png">
							운전자나이<br> 만 ${carDetail.car_age}세 이상
						</div>
						<div class="driverEx">
							<img class="icon"
								src="${pageContext.request.servletContext.contextPath}/resources/img/icon/driverEx1.png">
							운전경력<br> ${carDetail.car_career}년 이상
						</div>
					</div>
					<br>
					<br>
					<div class="carDetail_review">
						<div class="userRev">
							<p style="font-size: 18px;">이용자 리뷰</p>
							<span class="total"><b style="color: red;">87%</b>가 만족했어요</span>
						</div>
						<hr>
						<div class="review_wrap">
							<div class="review1 rev">
								<p>전체적으로 만족스러워요</p>
								<span>&#128516; 12</span>
							</div>
							<div class="review2 rev">
								<p>차량 관리 상태가 좋아요</p>
								<span>&#128516; 7&nbsp;</span>
							</div>
							<div class="review3 rev">
								<p>차량 옵션이 많아요</p>
								<span>&#128516; 5&nbsp;</span>
							</div>
							<div class="review4 rev">
								<p>연비가 좋아요</p>
								<span>&#128516; 4&nbsp;</span>
							</div>
							<div class="review5 rev">
								<p>차박용으로 딱이예요</p>
								<span>&#128516; 11</span>
							</div>
						</div>

						<br>
						<br>
					</div>
					<br> <br>
					<div class="carDetail_brc">
						<p style="font-size: 18px;">인수 및 반납장소</p>
						<hr>
						<c:choose>
							<%-- "캠핑갈카 부산본점" 일 경우 --%>
							<c:when test="${carDetail.brc_idx eq 5101}">
								<div id="daumRoughmapContainer1720976634983"
									class="root_daum_roughmap root_daum_roughmap_landing"></div>
								<script charset="UTF-8">
									new daum.roughmap.Lander({
										"timestamp" : "1720976634983",
										"key" : "2k2bw",
										"mapWidth" : "720",
										"mapHeight" : "360"
									}).render();
								</script>
								<br>
								<b style="font-size: 18px;">캠핑갈카 부산본점</b>
								<p>
									<b>주소</b><br> 
									부산 부산진구 동천로 109 삼한골든게이트 1층<br><br>
									<b>전화</b><br>
									051-1234-5678<br><br> 
									<b>이용 가능한 시간</b><br>
									대여 07:00 ~ 22:30<br>반납 06:00 ~ 21:30
								</p>
							</c:when>

							<%-- "캠핑갈카 서울지점" 일 경우 --%>
							<c:otherwise>
								<div id="daumRoughmapContainer1720976586469"
									class="root_daum_roughmap root_daum_roughmap_landing"></div>
								<script charset="UTF-8">
									new daum.roughmap.Lander({
										"timestamp" : "1720976586469",
										"key" : "2k2bv",
										"mapWidth" : "720",
										"mapHeight" : "360"
									}).render();
								</script>
								<br>
								<b style="font-size: 18px;">캠핑갈카 서울지점</b>
								<p>
									<b>주소</b><br> 
									서울 용산구 한강대로 350 갑을빌딩 1층<br><br>
									<b>전화</b><br>
									02-1234-5678<br><br> 
									<b>이용 가능한 시간</b><br>
									대여 07:00 ~ 22:30<br>반납 06:00 ~ 21:30
								</p>
							</c:otherwise>
						</c:choose>
						<hr>
						<p>
							<b>인수 및 반납 규정</b><br>
							- 인수 및 반납은 지점별 이용 가능한 시간 내 가능해요<br>
							- 예약자(제1운전자) 뿐 아니라 사전에 등록된 제2운전자와 제3운전자도
							인수 및 반납이 가능해요<br>
							- 차량 인수 시, 운전면허 지참은 필수예요<br>
							&nbsp;&nbsp;(도로교통법상 유효한 운전면허 소지자)
						</p>

					</div>
					<br>

				</div>
			</div>
		</section>

		<!-- 예약 일정 영역 -->
		<aside id="schedule_container">
			<form action="Reservation" name="reservation" method="post">
				<input type="hidden" name="car_model_image" value="${car_model_image }">
				<div>
					<b> <c:choose>
							<c:when test="${not empty sId}">${sId}님과 함께하는 여정</c:when>
							<c:otherwise>회원님과 함께하는 여정</c:otherwise>
						</c:choose>
					</b> <br>
					<br>
				</div>
				<div id="schedule_wrap">
					<a><img class="icon" alt="pin.png"
						src="${pageContext.request.servletContext.contextPath}/resources/img/icon/pin.png">
						<c:choose>
							<c:when test="${carDetail.brc_idx eq 5101}">캠핑갈카 부산본점</c:when>
							<c:otherwise>캠핑갈카 서울지점</c:otherwise>
						</c:choose> </a>
					<hr>
					<a><img class="icon" alt="calendar.png"
						src="${pageContext.request.servletContext.contextPath}/resources/img/icon/calendar.png">
						${param.res_rental_date} ~ ${param.res_return_date}</a>
					<hr>
					<a><img class="icon" alt="campingcar.png"
						src="${pageContext.request.servletContext.contextPath}/resources/img/icon/campingcar.png">
						${carDetail.car_model}</a>
				</div>
				<div id="pay_wrap">
					<h3>
						<fmt:formatNumber value="${param.rentalFee}" pattern="#,###" />
						원
					</h3>
				</div>
				<input type="hidden" name="res_rental_date"
					value="${param.res_rental_date}"> <input type="hidden"
					name="res_return_date" value="${param.res_return_date}"> <input
					type="hidden" name="car_idx" value="${carDetail.car_idx}">
				<input type="hidden" name="rentalFee" value="${param.rentalFee}">
				<div class="center">
					<input type="submit" id="reservation" value="예약하기">
				</div>
			</form>
		</aside>

	</main>
	
		<!-- 카카오톡 채팅 문의 -->	
	<aside class="chatBtn">
		<jsp:include page="/WEB-INF/views/kakaoLink.jsp"></jsp:include>
	</aside>

	<footer>
		<!-- 회사 소개 영역 -->
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>