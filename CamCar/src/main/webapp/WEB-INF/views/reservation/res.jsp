<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 날짜 등의 출력 형식 변경을 위한 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>

<style>
/* #schedule { */
/*     display:none; */
/* } */
/* #schedule_btn:visited>#schedule { */
/*  	display: block; */
/* } */

/* 지점선택 */
#seoul, #busan {display: none; margin: 10px;}	/* 라디오버튼 숨기기 */
.brc {
	margin: 15px;
	padding: 10px 50px 10px 50px;
	background-color: #e0e0e0;
	border-radius: 12px;
}
input[type=radio]:checked {
	background-color: #c2c2c2;
}

/* 일정선택 */
.schedule_btn {display: none;}	/* 체크박스 숨기기 */
.schedule {
     list-style-type: none; /* 리스트 스타일 제거 */
     padding: 0;
     margin: 0;
}
/* .schedule {display: none;} */
/* .schedule_btn:hover > .schedule {display: block;} */

/* 차량선택 */


</style>

<script type="text/javascript">

	$(function() {
		// 1. 지점 선택 이벤트(hidden에 값 저장하여 전달)
		$(".brc").checked(function() {	// 버튼 클릭 시 값 저장
			let brcInfo = $(this).val();
// 			$("#brcInfo").text(brcInfo);	// hidden 필드에 값 저장
// 			console.log("선택된 지점 : " + brcInfo);
		});	// 지점 선택 이벤트 끝
		
		
		// 2. 일정선택
		$("#schedule_btn").checked(function() {	// 버튼 클릭 시 값 저장
			console.log("checked");
		});	// 지점 선택 이벤트 끝
		
		// 3. 차종선택- 일반차량 선택 시 suv, 소형차 선택옵션 나타나기
		$("#generalCar").click(function() {
			let suv = $("#suv");
			let smallCar = $("#smallCar");
			if(suv.style.display == "none" && smallCar.style.display == "none") {
				schedule_btn.style.display == "block";
			} else {
				schedule_btn.style.display == "none"
			}
			
		});
		
		
		
		// 가입(submit) 클릭 시 이벤트 처리
		$("form").submit(function() {
// 			if($("#brc_rent_name").val() == "") {
// 				alert("지점을 선택해주세요!");
// 				return false;
				return true;
			}
			
			
		});	// 가입(submit) 이벤트 끝
		
		
		
		
	}); // ready 이벤트 끝
	
</script>

<form action="CarList" name="carList" method="post">
	<b>예약정보를 선택해주세요</b> &nbsp;&nbsp; 
	<input type="reset" value="↺"><br>
	&#127968; 지점 선택
	<span id="brcInfo"></span><br><br>
	<div class="center region" align="center">
<!-- 		<input type="hidden" id="brc_rent_name"> 숨겨진 입력 필드 -->
<!-- 		<input type="button" class="brc" value="서울"> -->
<!-- 		<input type="button" class="brc" value="부산"><br><hr> -->
		
		<input type="radio" name="brc_btn" id="seoul" value="서울"><label for="seoul" class="brc">서울</label>
		<input type="radio" name="brc_btn" id="busan" value="부산"><label for="busan" class="brc">부산</label><br><br>
		<input type="hidden" name="brc_rent_name">
	</div>
	
	<div>
		<input type="checkbox" class="schedule_btn" id="btn"><label for="btn">&#128467; 일정 선택</label>
		<ul class="schedule">
			<li><jsp:include page="/WEB-INF/views/reservation/calendar.jsp"></jsp:include></li>
		</ul>
	</div>
	
	<div id="schedule_btn">
<!-- 		&#128467; 일정 선택<br> -->
		대여일 <input type="text" id="res_rental_date" readonly><br>
		반납일 <input type="text" id="res_return_date" readonly><br>
		
<%-- 		<jsp:include page="/WEB-INF/views/reservation/calendar.jsp"></jsp:include> --%>
		<br><br>
	</div>
	
	&#128663; 차종 선택<br>
	<div class="center">
		<input type="button" name="car_type" value="캠핑차량">
		<input type="button" name="car_type_general" id="generalCar" value="일반차량"><br>
		<input type="button" name="car_type" id="suv" value="SUV">
		<input type="button" name="car_type" id="smallCar" value="소형차"><br><br>
		
		<input type="submit" id="inquiry" value="차량 조회하고 예약하기">
	</div>
</form>