<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
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
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

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
	width: 420px; height: 200px;
	box-sizing: border-box;
	z-index: 10;
	
}

#research { /* 재검색 버튼 */
	width: 95%; height: 40px;
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
/* 필터버튼 */
.filter {
width: 60px;
}
.filter_result {
	position: relative;
    font-size: 12px;
    line-height: 18px;
    background: #4bb4bd;
    padding: 8px 16px;
    margin: 0 5px 10px 0;
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
    padding: 10px 0;
    margin: 0 10px;
    background-color: #59b9a9;
    color: white;
    border: none;
	border-radius: 5px;
    cursor: pointer;
	width: 80px;
	text-align: center;
}



/* 지점 상세 설명 팝업창 */
#res_detail {
	display: none;
	position: absolute;
	overflow: scroll;
    right: 8px;
    top: 90px;
	z-index: 30;
	background-color: #fff;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
  	border-radius: 12px;
  	width: 400px; height: 500px;
  	box-sizing: border-box;
}
#res_detail1, #res_detail2 {
  	padding: 20px;
  	margin: 5px;
  	border: 1px solid #ccc;
  	border-radius: 12px;
  	
}

/* 팝업창 내 버튼, 예약하기 버튼 */
#res_apply1, #res_apply2, #res_assembly {
    width: 95%;
    color: white;
    cursor: pointer;
    background-color: #59b9a9;
}
.map {
	width: 100%;
	height: 250px;
}
.close {
    cursor: pointer;
    font-size: 16px;
    float: right;
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
    overflow-x: hidden;
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

input[type=button], input[type=reset], #res_assembly {
    cursor: pointer;
	height: 40px;
	margin: 10px;
	border-radius: 5px;
	border: none;
}
input[type=button]:hover, input[type=reset]:hover, #res_assembly {
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

.car_idx, .rentalFee {
	display: none;
}

main>section {
	min-height: 600px;	/* 조회결과 없을 경우 최소 길이 */
}
</style>

<script type="text/javascript">
$(document).ready(function() {

	// 1. 각 지점 버튼 클릭 시 상세설명(레이어팝업) 열림/닫힘
    $("#update_res").click(function() {
    	event.preventDefault();	// href 링크로 이동하지 않도록 함
        // 상세 설명 창을 토글
        $("#res_detail").toggle();
        
        // 지도 컨테이너가 이미 존재하는지 확인
        if (!$("#daumRoughmapContainer1720494911728").children().length) {
            // 지도 노드가 존재하지 않으면 지도 렌더링
            new daum.roughmap.Lander({
                "timestamp" : "1720494911728",
                "key" : "2jyf3",
                "mapWidth" : "330",
                "mapHeight" : "250"
            }).render();
        }
        // 지도 컨테이너가 이미 존재하는지 확인
        if (!$("#daumRoughmapContainer1720495062115").children().length) {
            // 지도 노드가 존재하지 않으면 지도 렌더링
            new daum.roughmap.Lander({
                "timestamp" : "1720495062115",
                "key" : "2jyf4",
                "mapWidth" : "330",
                "mapHeight" : "250"
            }).render();
        }
	});
	// ------------------------------------------------------------------------
	
	// 2. 지점 선택 버튼 클릭 시 hidden에 value 값 저장되면서 상세설명 닫기
	$("#res_apply1").click(function() {
		let brcInfo = $("#res_apply1").val();
		let hidden = $("#brc_rent_name").val(brcInfo);	// hidden 필드에 값 저장
		$("#busan").css("border", "2px solid #ccc");
		$("#seoul").css("border", "none");
	    $("#res_detail").hide();
	});
	$("#res_apply2").click(function() {
		let brcInfo = $("#res_apply2").val();
		let hidden = $("#brc_rent_name").val(brcInfo);	// hidden 필드에 값 저장
	    $("#res_detail2").hide();
		$("#seoul").css("border", "2px solid #ccc");
		$("#busan").css("border", "none");
	    $("#res_detail").hide();
	});
	
	
	// 3. 레이어 팝업 hide, show
	// "필터" 버튼 클릭 시 레이어 팝업 표시
    $(".filter").click(function(event) {
        event.preventDefault();
        $(".layerPopup_wrap").toggle();
    });
    // "닫기(X)" 버튼 클릭 시 레이어 팝업 닫기
    $(".close").click(function() {
        $(".layerPopup_wrap").hide();
    });
    // "적용하기" 버튼 클릭 시 레이어 팝업 닫기
    $(".apply").click(function() {
        $(".layerPopup_wrap").hide();
    });
    
    
    // 4. "초기화" 버튼 클릭 이벤트
    $('.reset').click(function() {
        // 모든 체크박스 체크 해제
        $('input[type="checkbox"]').prop('checked', false);
    });
    
    
    // 5. 나이, 운전경력, 반려동물 동승 체크박스 한개만 선택되도록
	$('input[name="age_opt"]').change(function() {
	    $('input[name="age_opt"]').not(this).prop('checked', false);
	});
	$('input[name="drive_opt"]').change(function() {
	    $('input[name="drive_opt"]').not(this).prop('checked', false);
	});
	$('input[name="pet_opts"]').change(function() {
	    $('input[name="pet_opts"]').not(this).prop('checked', false);
	});
    
    
    // ---------------------
    // 6. 예약 버튼 클릭 시
    $(".resBtn").on("click", function() {
         // 모든 체크박스 언체크
         $("input[type='checkbox'].rentalFee").prop("checked", false);
         $("input[type='checkbox'].car_idx").prop("checked", false);
         // 클릭한 버튼의 부모 요소에서 체크박스 체크
         $(this).closest(".carList_bottom").find("input[type='checkbox'].rentalFee").prop("checked", true);	// 요금
         $(this).closest(".carList_bottom").find("input[type='checkbox'].car_idx").prop("checked", true);	// 차량코드
         // 폼 제출
         $("#carDetail").submit();
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
			<form action="CarDetail" name="carDetail" id="carDetail" method="post">
				<!-- ------------------- 필터 영역 ----------------------------------- -->
				<div class="top_filter_wrap">
					<div class="filter_result_wrap">
						<!-- 차종 선택 시 보이는 필터 -->
						<c:if test="${not empty car_typeList}">
							<c:forEach var="car_type" items="${car_typeList}">
								<span class="filter_result">${car_type}</span>
							</c:forEach>
						</c:if>
						<!-- 연료 선택 시 보이는 필터 -->
						<c:if test="${not empty car_fuel_typeList}">
							<c:forEach var="car_fuel_type" items="${car_fuel_typeList}">
								<span class="filter_result">${car_fuel_type}</span>
							</c:forEach>
						</c:if>
						<!-- 운전자 조건(나이) 선택 시 보이는 필터 -->
						<c:if test="${not empty car_age}">
							<c:choose>
							    <c:when test="${fn:contains(car_age, '21')}">
							        <span class="filter_result">만 21~25세</span>
							    </c:when>
							    <c:otherwise>
							        <span class="filter_result">만 26세 이상</span>
							    </c:otherwise>
							</c:choose>
						</c:if>
						<!-- 운전자 조건(운전경력) 선택 시 보이는 필터 -->
						<c:if test="${not empty car_career}">
							<c:choose>
							    <c:when test="${fn:contains(car_career, '1')}">
							        <span class="filter_result">1년~3년 미만</span>
							    </c:when>
							    <c:otherwise>
							        <span class="filter_result">3년 이상</span>
							    </c:otherwise>
							</c:choose>
						</c:if>
						<!-- 연식 선택 시 보이는 필터 -->
						<c:if test="${not empty car_oldList}">
					        <span class="filter_result">${car_oldList.startYear}~${car_oldList.endYear}</span>
						</c:if>
						<!-- 반려동물 동승 여부 선택 시 보이는 필터 -->
						<c:if test="${not empty pet_opt}">
							<c:choose>
							    <c:when test="${fn:contains(pet_opt, 'Y')}">
							        <span class="filter_result">가능</span>
							    </c:when>
							    <c:otherwise>
							        <span class="filter_result">불가능</span>
							    </c:otherwise>
							</c:choose>
						</c:if>
					</div>
					<div class="filter_btn">
						<input type="button" class="filter" value="필터">
					</div>
				</div>
				
				<!-- ---------- 차량 리스트 영역 --------------------------------------------------------------------------- -->
	            <c:choose>
	            	<c:when test="${not empty carList}">
						<c:forEach var="model" items="${carModelList}">
						    <%-- carList에 해당 모델이 있는지 확인하기 위한 플래그 초기화 --%>
						    <c:set var="isModelExist" value="false" />
						
						    <%-- carList에서 해당 모델이 존재하는지 확인 --%>
						    <c:forEach var="car" items="${carList}">
						        <c:if test="${model.car_model eq car.car_model}">
						            <c:set var="isModelExist" value="true" />
						        </c:if>
						    </c:forEach>
						
						    <%-- carList에 존재하는 모델만 렌더링 --%>
						    <c:if test="${isModelExist}">
						        <div class="carList_wrap">
						            <div class="carList_top">	<!-- 차량정보 상단 -->
						                <div class="carName">
						                    <!-- 로고사진 -->
						                    <img src="${pageContext.request.contextPath}/resources/upload/${model.car_logo_image}"><br>
						                    <a>${model.car_company}</a>
						                    <h3>${model.car_model}</h3>
						                </div>
						                <div class="carImage">
						                    <img src="${pageContext.request.contextPath}/resources/upload/${model.car_model_image}">
						                </div>
						            </div>
						            
						            <!-- ---------- 차량 상세 리스트 영역 ---------- -->
						            <c:forEach var="car" items="${carList}">
						                <c:if test="${model.car_model eq car.car_model}">
						                    <c:choose>
						                        <%-- 이미 예약된 차량일 경우 --%>
						                        <c:when test="${fn:contains(resCarList, car.car_idx)}">	
						                            <div class="carList_bottom" style="display: flex; background-color: gray;">
						                                <div class="carName_detail">
						                                    <p class="main_name">${car.car_model} ${car.car_fuel_type}</p>
						                                    <span style="width: 400px;">
						                                        ${car.car_old} / 
						                                        반려동물 동반 <c:if test="${car.pet_opt eq 'N'}">불가능</c:if>
						                                        <c:if test="${car.pet_opt eq 'Y'}">가능</c:if>  / 
						                                        정원 ${car.car_riding}명 / 
						                                        ${car.car_license} 이상
						                                    </span>
						                                    
						                                    <!-- 일정정보(대여일시) 전달  -->
						                                    <input type="hidden" name="res_rental_date" value="${param.res_rental_date}">
						                                    <input type="hidden" name="res_return_date" value="${param.res_return_date}">
						                                </div>
						                                <div class="pay_detail">
						                                    <input type="checkbox" name="rentalFee" class="rentalFee" value="${carFeeMap[car.car_idx]}">
						                                    <input type="checkbox" name="car_idx" class="car_idx" value="${car.car_idx}">
						                                    <span class="main_name" style="font-size: 20px;">
						                                        <fmt:formatNumber value="${carFeeMap[car.car_idx]}" pattern="#,###" />원
						                                    </span>
						                                    <input type="submit" value="예약불가" class="resBtn" disabled style="background-color: #ccc; cursor: default; width: 80px;">
						                                </div>
						                            </div>
						                        </c:when>
						                        <%-- 예약 가능한 차량일 경우 --%>
						                        <c:otherwise>
						                            <div class="carList_bottom" style="display: flex;">
						                                <div class="carName_detail">
						                                    <p class="main_name">${car.car_model} ${car.car_fuel_type}</p>
						                                    <span style="width: 400px;">
						                                        ${car.car_old} / 
						                                        반려동물 동반 <c:if test="${car.pet_opt eq 'N'}">불가능</c:if>
						                                        <c:if test="${car.pet_opt eq 'Y'}">가능</c:if>  / 
						                                        정원 ${car.car_riding}명 / 
						                                        ${car.car_license} 이상
						                                    </span>
						                                    
						                                    <!-- 일정정보(대여일시) 전달  -->
						                                    <input type="hidden" name="res_rental_date" value="${param.res_rental_date}">
						                                    <input type="hidden" name="res_return_date" value="${param.res_return_date}">
						                                </div>
						                                <div class="pay_detail">
						                                    <input type="checkbox" name="rentalFee" class="rentalFee" value="${carFeeMap[car.car_idx]}">
						                                    <input type="checkbox" name="car_idx" class="car_idx" value="${car.car_idx}">
						                                    <span class="main_name" style="font-size: 20px;">
						                                        <fmt:formatNumber value="${carFeeMap[car.car_idx]}" pattern="#,###" />원
						                                    </span>
						                                    <input type="submit" value="예약" class="resBtn">
						                                </div>
						                            </div>
						                        </c:otherwise>
						                    </c:choose>
						                </c:if>
						            </c:forEach>
						        </div>
						    </c:if>
						</c:forEach>
	            	</c:when>
	            	<c:otherwise>
	            		<div align="center">
	            			<br><br><br><br><br>
			            	<h3>선택한 조건에 해당하는<br>
							검색 결과가 없어요</h3>
							<p>조회 조건을 다시 확인해주세요</p>
	            		</div>
	            	</c:otherwise>
	            </c:choose>
				<!-- ---------------------------------------------------------------------------------------- -->
				
			</form>
		</section>
		
		<!-- 예약 일정 영역 -->
		<aside id="research_container">
			<form action="Reservation" name="reservation" method="post">
				<div>
					<b>
						<c:choose>
							<c:when test="${not empty sId}">${sId}님과 함께하는 여정</c:when>
							<c:otherwise>회원님과 함께하는 여정</c:otherwise>
						</c:choose>
					</b>
					<br><br>
				</div>
				<a><img alt="pin.png" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/pin.png"> ${param.brc_rent_name}</a>
<!-- 				<span style="float: right;"><a href="update_res" id="update_res">수정</a></span> -->
				<hr>
				<a><img alt="calendar.png" src="${pageContext.request.servletContext.contextPath}/resources/img/icon/calendar.png"> ${param.res_rental_date} ~ ${param.res_return_date}</a>
<!-- 				<span style="float: right;"><a href="update_cal" id="update_cal">수정</a></span> -->
				<div class="center">
<!-- 					<input type="reset" id="research" value="재검색"> -->
					<input type="button" id="research" value="일정 다시 선택하러 가기" onclick="location.href='./'">
				</div>
			</form>
		</aside>
		
	</main>

	
	
	<!-- ------ layerPopup(필터 팝업창) ---------------------------------------------------- -->
	<div class="layerPopup_wrap">
<!-- 		<form action="FilterCars" name="filterCars" method="post"> -->
		<form action="CarList" name="carList" method="post">

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
									<c:forEach var="car_type" items="${car_typeList}">
										<c:if test="${car_type eq '캠핑카'}"> checked</c:if>
									</c:forEach>
								><label for="campingCar">캠핑카</label></li>
								<li><input type="checkbox" name="car_opt" id="suv" value="SUV"
									<c:forEach var="car_type" items="${car_typeList}">
										<c:if test="${car_type eq 'SUV'}"> checked</c:if>
									</c:forEach>
								><label for="suv">SUV</label></li>
								<li><input type="checkbox" name="car_opt" id="smallCar" value="소형차"
									<c:forEach var="car_type" items="${car_typeList}">
										<c:if test="${car_type eq '소형차'}"> checked</c:if>
									</c:forEach>
								><label for="smallCar">소형차</label></li>
							</ul>
						</div>
					</li>
					<li class="filter_box">
						<h3>연료</h3>
						<div>
							<ul class="btn_group">
								<li><input type="checkbox" name="fuel_opt" id="electricity" value="전기"
									<c:forEach var="car_fuel_type" items="${car_fuel_typeList}">
										<c:if test="${car_fuel_type eq '전기'}"> checked</c:if>
									</c:forEach>
								><label for="electricity">전기</label></li>
								<li><input type="checkbox" name="fuel_opt" id="hybrid" value="하이브리드"
									<c:forEach var="car_fuel_type" items="${car_fuel_typeList}">
										<c:if test="${car_fuel_type eq '하이브리드'}"> checked</c:if>
									</c:forEach>
								><label for="hybrid">하이브리드</label></li>
								<li><input type="checkbox" name="fuel_opt" id="gasoline" value="가솔린"
									<c:forEach var="car_fuel_type" items="${car_fuel_typeList}">
										<c:if test="${car_fuel_type eq '가솔린'}"> checked</c:if>
									</c:forEach>
								><label for="gasoline">가솔린</label></li>
								<li><input type="checkbox" name="fuel_opt" id="diesel" value="디젤"
									<c:forEach var="car_fuel_type" items="${car_fuel_typeList}">
										<c:if test="${car_fuel_type eq '디젤'}"> checked</c:if>
									</c:forEach>
								><label for="diesel">디젤</label></li>
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
										<li><input type="checkbox" name="age_opt" id="under_25age" value="21"
											<c:if test="${fn:contains(car_age, '21')}"> checked</c:if>
										><label for="under_25age">만 21~25세</label></li>
										<li><input type="checkbox" name="age_opt" id="upper_26age" value="26"
											<c:if test="${fn:contains(car_age, '26')}"> checked</c:if>
										><label for="upper_26age">만 26세 이상</label></li>
									</ul>
								</li>
								<li>
									<p class="op_title">운전경력
										<span style="font-size: 10px;">*유효한 면허증의 취득일 기준</span>
									</p>
									<ul class="btn_group">
										<li><input type="checkbox" name="drive_opt" id="under_3year" value="1"
											<c:if test="${fn:contains(car_career, '1')}"> checked</c:if>
										><label for="under_3year">1년~3년 미만</label></li>
										<li><input type="checkbox" name="drive_opt" id="upper_3year" value="3"
											<c:if test="${fn:contains(car_career, '3')}"> checked</c:if>
										><label for="upper_3year">3년 이상</label></li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					
					<li class="filter_box">
						<h3>연식</h3>
						<div>
							<ul class="btn_group">
								<li><input type="checkbox" name="model_opt" id="model_20_21" value="2021"><label for="model_20_21">2020~2021</label></li>
								<li><input type="checkbox" name="model_opt" id="model_21_22" value="2022"><label for="model_21_22">2021~2022</label></li>
								<li><input type="checkbox" name="model_opt" id="model_22_23" value="2023"><label for="model_22_23">2022~2023</label></li>
								<li><input type="checkbox" name="model_opt" id="model_23_24" value="2024"><label for="model_23_24">2023~2024</label></li>
								<li><input type="checkbox" name="model_opt" id="model_24_25" value="2025"><label for="model_24_25">2024~2025</label></li>
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
								<li><input type="checkbox" name="pet_opts" id="pet_yes" value="Y"
									<c:if test="${fn:contains(pet_opt, 'Y')}"> checked</c:if>
								><label for="pet_yes">가능</label></li>
								<li><input type="checkbox" name="pet_opts" id="pet_no" value="N"
									<c:if test="${fn:contains(pet_opt, 'N')}"> checked</c:if>
								><label for="pet_no">불가능</label></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			
			<div class="layerPopup_btn">
				<!-- 일정정보(지점, 대여일시) 전달  -->
                <input type="hidden" name="brc_rent_name" value="${param.brc_rent_name}">
                <input type="hidden" name="res_rental_date" value="${param.res_rental_date}">
                <input type="hidden" name="res_return_date" value="${param.res_return_date}">
			
				<input type="button" name="reset" class="reset" value="초기화" style="background-color: #ccc;">
				<input type="submit" name="apply" class="apply" value="적용하기" style="background-color: #59b9a9;">
			</div>
		</form>
	</div>
	
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