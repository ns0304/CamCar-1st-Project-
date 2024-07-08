<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function brcInfo() {
		let brc = $(".brc").val()
		if (brc == "서울") {
			
		}
	}
</script>

<form action="Reservation" name="reservation" method="post">
	<b>예약정보를 선택해주세요</b> &nbsp;&nbsp; 
	<input type="reset" value="↺"><br>
	&#127968; 지점 선택<br>
	<div class="center region">
		<input type="button" class="brc" value="서울" onclick="brcInfo()">
		<input type="button" class="brc" value="부산" onclick="brcInfo()"><br><hr>
	</div>
	&#128467; 일정 선택<br>
	대여 <input type="datetime-local"><br>
	반납 <input type="datetime-local"><br><hr>
	&#128663; 차종 선택<br>
	<div class="center">
		<input type="button" name="car_type" value="캠핑차량">
		<input type="button" name="car_type_general" value="일반차량"><br>
		<input type="button" name="car_type" value="SUV">
		<input type="button" name="car_type" value="소형차"><br><br>
		<input type="submit" id="inquiry" value="차량 조회하고 예약하기">
	</div>
</form>