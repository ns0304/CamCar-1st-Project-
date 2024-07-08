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
#research_container {
	/* 	position: -webkit -sticky; */ /* IE버전 낮을경우 이 항목 추가 입력 */
	position: sticky;
	top: 100px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 12px;
	padding: 20px;
	margin-left: 15px;
	width: 420px; height: 400px;
	box-sizing: border-box;
	z-index: 10;
	
}

#research { /* 재검색 버튼 */
	width: 100%; height: 40px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	border: none;
}
#research:hover {
	box-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

#research_container img {
	width: 15px; height: 15px;
}


/* ---- 필터 영역 ---- */
.top_filter_wrap {
	display: flex;
    justify-content: space-between;
    align-items: center;
}
.filter_result {
	position: relative;
    font-size: 12px;
    line-height: 18px;
    background: #94cd86;
    padding: 8px 16px;
    margin-right:5px;
    color: #fff;
    border-radius: 15px;
}

/* ---- 차량 리스트 영역 ---- */
.carList_wrap {
	display: block;
	background-color: #ccc;
	border-radius: 12px;
    padding: 0 20px 20px;
    margin-top: 32px;
}

.carList_top {
	display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
}

.carName {
	box-sizing: border-box;
	vertical-align: baseline;
}

.carImage>img {
	width: 300px; height: 180px;
}

/* --------------------- */
.carList_bottom {
	display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px 10px 20px;
    background-color: #fff;
    border-radius: 12px;
    margin-top: 10px;
}
.pay_detail {
    vertical-align: middle;
}
.pay_detail input {	/* "예약" 버튼 */
    padding: 10px 25px;
    margin: 0 10px;
    background-color: #81C147;
    color: white;
    border: none;
	border-radius: 5px;
    cursor: pointer;
}
/* --------- 필터 팝업창 ---------- */
.filter_op_wrap, .driver_condition, .btn_group {
    list-style-type: none; /* 리스트 스타일 제거 */
    padding: 0;
    margin: 0;
}
.filter_box li, .driver_condition li, .btn_group li {
    display: inline; /* 리스트 항목들을 인라인으로 배치 */
    margin-right: 10px; /* 각 항목 사이의 간격 설정 */
}

.layerPopup_wrap {
	display: none;
	position: fixed;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 600px; height: 700px;
    background-color: #f1f3f5;
    border: 1px solid #ccc;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    z-index: 1000;
    overflow: scroll;
    border-radius: 12px;
}
.layerPopup_header {
	border-bottom: 1px solid gray;
    background-color: #fff;
}
.layerPopup_header>div {
	position: flex;
    padding: 20px 0 0 20px;
}

.filter_box {
	border: 1px solid gray;
	border-radius: 12px;
	padding: 10px 20px;
	margin: 15px 20px;
	background-color: #fff;
}
.driver_condition {
	display: flex;
	justify-content: space-around;
}

.layerPopup_content tr {
	background-color: #e0e0e0;
}
.layerPopup_header .close {
    cursor: pointer;
    font-size: 16px;
    float: right;
    margin-right: 20px;
}
.layerPopup_wrap table {
    width: 100%;
    border-collapse: collapse;
}
.layerPopup_wrap table, .layerPopup_wrap th, .layerPopup_wrap td {
    border: 1px solid #ccc;
}
.layerPopup_wrap th, .layerPopup_wrap td {
    padding: 8px;
    text-align: center;
}

.layerPopup_btn {
    text-align: center;
    margin-bottom: 10px;
}
.layerPopup_btn input {	/* "초기화", "적용하기" 버튼 */
    padding: 10px 25px;
    margin: 0 10px;
    color: white;
    border: none;
	border-radius: 5px;
    cursor: pointer;
}


	

</style>

<script type="text/javascript">
$(document).ready(function() {
	// "필터" 버튼 클릭 시 레이어 팝업 표시
    $(".filter").click(function(event) {
        event.preventDefault();
        $(".layerPopup_wrap").toggle();
    });

    // "닫기(X)" 버튼 클릭 시 레이어 팝업 닫기
    $(".close").click(function() {
        $(".layerPopup_wrap").hide();
    });
    
    // ******************************************************************
    // 수정 필요
    // "적용하기" 버튼 클릭 시 선택된 필터 적용시키고 레이어 팝업 닫기
    $(".apply").click(function() {
    	// 선택된 필터 텍스트를 저장할 배열
        let selectedFilters = [];

        // 체크된 필터 항목들을 반복하며 배열에 추가
        $('input[type="checkbox"]:checked').each(function() {
            selectedFilters.push($(this).val());
        });

        // 선택된 필터가 있는지 확인
        if (selectedFilters.length > 0) {
            // 필터 목록을 쉼표로 구분된 문자열로 변환
            let filterText = selectedFilters.join(', ');
            $('.filter_result_wrap').text(filterText);
        }
    	
    	
        $(".layerPopup_wrap").hide();
    });
    // ******************************************************************
    
    // "초기화" 버튼 클릭 이벤트
    $('.reset').click(function() {
        // 모든 체크박스 체크 해제
        $('input[type="checkbox"]').prop('checked', false);
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
			<!-- 필터 영역 -->
			<div class="top_filter_wrap">
				<div class="filter_result_wrap">
					<!-- 차종 선택 시 보이는 필터 -->
					<c:if test="${not empty car_optList}">
						<c:forEach var="car_opt" items="${car_optList}">
							<span class="filter_result">${car_opt}</span>
						</c:forEach>
					</c:if>
				</div>
				<div class="filter_btn">
					<input type="button" class="filter" value="필터">
				</div>
			</div>
			
			<!-- 차량 리스트 영역 -->
			<div class="carList_wrap">
				<div class="carList_top">	<!-- 차량정보 상단 -->
					<div class="carName">
						<a><img src="resources/img/logo/kia.svg"><br>
						제조사</a>
						<h3>차량이름</h3>
					</div>
					<div class="carImage">
						<img src="resources/img/car/kia_ray.png">
					</div>
				</div>
				<div class="carList_bottom" style="display: flex;">
					<form action="CarDetail" name="carDetail" id="carDetail" method="post">
						<div class="carName_detail">
							<p class="main_name">차량이름 연료</p>
							<span>연식 / 연료 / 탑승인원 / 운전자조건</span>
							
							<input type="hidden" name="car_info" value="차량이름 연료">
							<input type="hidden" name="brc_rent_name" value="${param.brc_rent_name}">
							<input type="hidden" name="res_rental_date" value="${param.res_rental_date}">
							<input type="hidden" name="res_return_date" value="${param.res_return_date}">
							
						</div>
						<div class="pay_detail">
							<span class="main_name" style="font-size: 20px;">00,000원</span>
							<input type="submit" value="예약">
<!-- 							<input type="button" value="예약"> -->
						</div>
					</form>
				</div>
				<div class="carList_bottom" style="display: flex;">
					<div class="carName_detail">
						<p class="main_name">차량이름 연료</p>
						<span>연식 / 연료 / 탑승인원 / 운전자조건</span>
					</div>
					<div class="pay_detail">
						<span class="main_name" style="font-size: 20px;">00,000원</span>
						<input type="button" value="예약">
					</div>
				</div>
			</div>
				
			
			<div>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>
		</section>
		
		<!-- 예약 일정 영역 -->
		<aside id="research_container">
			<form action="Reservation" name="reservation" method="post">
				<div>
					<b>회원님과 함께하는 여정</b><br><br>
				</div>
				<a><img alt="pin.png" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/pin.png"> ${param.brc_rent_name}</a>
				<hr>
				<a><img alt="calendar.png" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/calendar.png"> ${param.res_rental_date} ~ ${param.res_return_date}</a>
				<div class="center">
					<input type="reset" id="research" value="재검색">
				</div>
			</form>
		</aside>
		
	</main>
	
	<!-- layerPopup(필터 팝업창) -->
	<div class="layerPopup_wrap">
		<div class="layerPopup_header">
			<div>
				<b style="font-size: 20px;">필터</b>
				<span class="close">&times;</span>
				<p style="font-size: 14px;">선택한 항목이 적용된 차량을 보여줘요</p>
			</div>
		</div>
			
		<div class="layerPopup_content">
			<ul class="filter_op_wrap">
				<li class="filter_box">
					<h3>차종</h3>
					<div>
						<ul class="btn_group">
							<li><input type="checkbox" name="car_opt" id="campingCar" value="캠핑카"
							<c:forEach var="car_opt" items="${car_optList}">
								<c:if test="${car_opt.equals('캠핑카')}"> checked</c:if>
							</c:forEach>
							><label for="campingCar">캠핑카</label></li>
							<li><input type="checkbox" name="car_opt" id="suv" value="SUV"
							<c:forEach var="car_opt" items="${car_optList}">
								<c:if test="${car_opt.equals('SUV')}"> checked</c:if>
							</c:forEach>
							><label for="suv">SUV</label></li>
							<li><input type="checkbox" name="car_opt" id="smallCar" value="소형차"
							<c:forEach var="car_opt" items="${car_optList}">
								<c:if test="${car_opt.equals('소형차')}"> checked</c:if>
							</c:forEach>
							><label for="smallCar">소형차</label></li>
						
<!-- 							<li><input type="button" id="campingCar" value="캠핑카"></li> -->
<!-- 							<li><input type="button" id="suv" value="SUV"></li> -->
<!-- 							<li><input type="button" id="smallCar" value="소형차"></li> -->
						</ul>
					</div>
				</li>
				<li class="filter_box">
					<h3>연료</h3>
					<div>
						<ul class="btn_group">
							<li><input type="checkbox" name="fuel_opt" id="electricity" value="전기"><label for="electricity">전기</label></li>
							<li><input type="checkbox" name="fuel_opt" id="hybrid" value="하이브리드"><label for="hybrid">하이브리드</label></li>
							<li><input type="checkbox" name="fuel_opt" id="gasoline" value="가솔린"><label for="gasoline">가솔린</label></li>
							<li><input type="checkbox" name="fuel_opt" id="diesel" value="디젤"><label for="diesel">디젤</label></li>
						</ul>
					</div>
				</li>
				
				<li class="filter_box">
					<h3>운전자 조건</h3>
					<div>
						<ul class="driver_condition">	<!-- display: flex; -->
							<li>
								<p class="op_title">나이</p>
								<ul class="btn_group">
									<li><input type="checkbox" name="age_opt" id="under_25age" value="만 21~25세"><label for="under_25age">만 21~25세</label></li>
									<li><input type="checkbox" name="age_opt" id="upper_26age" value="만 26세 이상"><label for="upper_26age">만 26세 이상</label></li>
								</ul>
							</li>
							<li>
								<p class="op_title">운전경력
									<span style="font-size: 10px;">*유효한 면허증의 취득일 기준</span>
								</p>
								<ul class="btn_group">
									<li><input type="checkbox" name="drive_opt" id="under_3year" value="1년~3년 미만"><label for="under_3year">1년~3년 미만</label></li>
									<li><input type="checkbox" name="drive_opt" id="upper_3year" value="3년 이상"><label for="upper_3year">3년 이상</label></li>
								</ul>
							</li>
						</ul>
					</div>
				</li>
				
				<li class="filter_box">
					<h3>연식</h3>
					<div>
						<ul class="btn_group">
							<li><input type="checkbox" name="model_opt" id="model_20_21" value="2020~2021"><label for="model_20_21">2020~2021</label></li>
							<li><input type="checkbox" name="model_opt" id="model_21_22" value="2021~2022"><label for="model_21_22">2021~2022</label></li>
							<li><input type="checkbox" name="model_opt" id="model_22_23" value="2022~2023"><label for="model_22_23">2022~2023</label></li>
							<li><input type="checkbox" name="model_opt" id="model_23_24" value="2023~2024"><label for="model_23_24">2023~2024</label></li>
							<li><input type="checkbox" name="model_opt" id="model_24_25" value="2024~2025"><label for="model_24_25">2024~2025</label></li>
						</ul>
					</div>
				</li>
				<li class="filter_box">
					<h3>반려동물 동승</h3>
					<p style="font-size: 12px;"><b>※ 주의</b><br>
					다른 이용 고객에게 위해(알레르기 등)를 끼칠 우려가 있어 반려동물의 동승을 허용하는 차량이 구분되어 있습니다.<br>
					또한 반려동물 동반 탑승 시 크리닝 비용(보험미적용/실비청구)이 추가 발생할 수 있습니다.</p>
					<div>
						<ul class="btn_group">
							<li><input type="checkbox" name="pet_opt" id="pet_yes" value="가능"><label for="pet_yes">가능</label></li>
							<li><input type="checkbox" name="pet_opt" id="pet_no" value="불가능"><label for="pet_no">불가능</label></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		
		<div class="layerPopup_btn">
			<input type="button" name="reset" class="reset" value="초기화" style="background-color: gray;">
			<input type="button" name="apply" class="apply" value="적용하기" style="background-color: #81C147;">
		</div>
	</div>
	
	<footer>
		<!-- 회사 소개 영역 -->
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>