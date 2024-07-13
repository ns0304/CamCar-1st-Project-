<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 : 차량 리스트</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<%-- 카카오지도 설치 스크립트 --%>
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.jsc"></script>

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

/* 아이콘 크기 지정 */
.icon {
	width: 15px; height: 15px;
}
/* ---------------------------------------------- */

/* ----------------- 차량상세 ------------------- */
/* ---- carDetail_top ---- */
.carDetail_image img {
	width: 100%;
	height: 400px;
	object-fit:cover;
}
.carDetail_images img {
	width: 120px; height: 70px;
	margin: 10px 0 20px 0;
	object-fit:cover;
}
/* 선택된 이미지 border 처리 */
.selected {
    border: 2px solid #ccc;
	box-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

.fuel, .persons, .carYear, .driverAge, .driverEx {
	border: 1px solid #ccc;
	border-radius: 12px;
	padding: 20px 10px;
	margin: 10px;
	width: 20%;
	box-sizing: border-box;
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
					<img src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image1}" id="mainImg">
				</div>
				<div class="carDetail_images" style="display: flex; justify-content: space-between;">
					<div><img src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image1}" id="img1" class="changeImg" selected></div>
					<div><img src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image2}" id="img2" class="changeImg"></div>
					<div><img src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image3}" id="img3" class="changeImg"></div>
					<div><img src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image4}" id="img4" class="changeImg"></div>
					<div><img src="${pageContext.request.contextPath}/resources/upload/${carDetail.car_image5}" id="img5" class="changeImg"></div>
				</div>
				<div class="carDetail_info">
					<p>차량 정보</p>
					<hr>
					<div style="display: flex;">
						<div class="fuel">
						<img class="icon" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/fuel.png">
						연료<br>
						가솔린
						</div>
						<div class="persons">
						<img class="icon" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/persons.png">
						승차인원<br>
						5명
						</div>
						<div class="carYear">
						<img class="icon" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/carYear.png">
						연식<br>
						2024
						</div>
						<div class="driverAge">
						<img class="icon" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/driverAge21.png">
						운전자나이<br>
						만 21세 이상
						</div>
						<div class="driverEx">
						<img class="icon" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/driverEx1.png">
						운전경력<br>
						1년 이상
						</div>
					</div>
					<br><br>
					<div class="carDetail_review">
					<p>이용자 리뷰</p>
					<hr>
					<div class="review1">
						<p>전체적으로 만족스러워요</p>
						<span><img class="icon" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/smile.png"></span>
					</div>
					<div class="review2">
						<p>차량 관리 상태가 좋아요</p>
						<span><img class="icon" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/smile.png"></span>
					</div>
					<div class="review3">
						<p>차량 옵션이 많아요</p>
						<span><img class="icon" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/smile.png"></span>
					</div>
					<div class="review4">
						<p>연비가 좋아요</p>
						<span><img class="icon" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/smile.png"></span>
					</div>
					<div class="review5">
						<p>차박용으로 딱이예요</p>
						<span><img class="icon" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/smile.png"></span>
					</div>
					
					<br><br>
					</div>
					<br>
					<br>
					<div class="carDetail_brc">
						<p>인수 및 반납장소</p>
						<hr>
						<c:choose>
							<%-- "캠핑갈카 부산본점" 일 경우 --%>
							<c:when test="${fn:trim(param.brc_rent_name) eq '캠핑갈카 부산본점'}">
								<div id="daumRoughmapContainer1720569672541" class="root_daum_roughmap root_daum_roughmap_landing"></div>
								<script charset="UTF-8">
									new daum.roughmap.Lander({
										"timestamp" : "1720569672541",
										"key" : "2jysz",
										"mapWidth" : "720",
										"mapHeight" : "360"
									}).render();
								</script>
								
							</c:when>
							
							<%-- "캠핑갈카 서울지점" 일 경우 --%>
							<c:otherwise>
								<div id="daumRoughmapContainer1720606882411" class="root_daum_roughmap root_daum_roughmap_landing"></div>
								<script charset="UTF-8">
									new daum.roughmap.Lander({
										"timestamp" : "1720606882411",
										"key" : "2kz7g",
										"mapWidth" : "720",
										"mapHeight" : "360"
									}).render();
								</script>
							</c:otherwise>
						</c:choose>
					
					</div>
					<br>
					
				</div>
			</div>
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
					<a><img class="icon" alt="pin.png" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/pin.png"> ${param.brc_rent_name}</a>
					<hr>
					<a><img class="icon" alt="calendar.png" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/calendar.png"> ${param.res_rental_date} ~ ${param.res_return_date}</a>
					<hr>
					<a><img class="icon" alt="campingcar.png" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/campingcar.png"> ${param.car_info}</a>
				</div>
				<div id="pay_wrap" >
					<h3>00,000원</h3>
				</div>
					<input type="hidden" name="car_info" value="${param.car_info}">
					<input type="hidden" name="brc_rent_name" value="${param.brc_rent_name}">
					<input type="hidden" name="res_rental_date" value="${param.res_rental_date}">
					<input type="hidden" name="res_return_date" value="${param.res_return_date}">
				<div class="center">
					<input type="submit" id="reservation" value="예약하기">
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