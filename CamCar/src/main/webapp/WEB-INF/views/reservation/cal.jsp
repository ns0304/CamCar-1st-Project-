<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    
    
<script>
$(document).ready(function() {
    $(function() {
        // 오늘 날짜
        let today = new Date();
        let todayFormatted = $.datepicker.formatDate('yy-mm-dd', today);
        // 내일 날짜 설정
		let tomorrow = new Date(today);
		tomorrow.setDate(today.getDate() + 1);
		
		// 내일 날짜를 'yyyy-MM-dd' 형식으로 포맷
		let tomorrowFormatted = $.datepicker.formatDate('yy-mm-dd', tomorrow);

        // 90일 후 날짜 계산
        let maxDate = new Date();
        maxDate.setDate(maxDate.getDate() + 90);

        // 공통 설정(캘린더를 맨앞으로 이동)
        function setDatepickerZIndex() {
            $('.ui-datepicker').css('z-index', 9999);
        }

        // 출발일 선택 시
        $("#start_date").datepicker({
            dateFormat: 'yy-mm-dd',
            minDate: today, // 오늘 날짜부터
            maxDate: maxDate, // 90일 후까지
            beforeShow: function(input, inst) {
                setTimeout(setDatepickerZIndex, 0); // 캘린더 열릴 때 z-index 설정
            },
            onSelect: function(selectedDate) {
                let startDate = $(this).datepicker('getDate');
                // 도착일의 최소, 최대 날짜 설정
                let endDateMin = new Date(startDate);
                endDateMin.setDate(startDate.getDate() + 1); // 출발일 다음 날부터
                let endDateMax = new Date(startDate);
                endDateMax.setDate(startDate.getDate() + 30); // 출발일로부터 30일까지

                $('#end_date').datepicker('option', 'minDate', endDateMin);
                $('#end_date').datepicker('option', 'maxDate', endDateMax);

                // 숨겨진 필드에 출발일 넣기
                updateRentalDateTime();
            }
        });

        // 도착일 선택 시
        $("#end_date").datepicker({
            dateFormat: 'yy-mm-dd',
            minDate: '+1d', // 출발일 다음날부터 선택 가능
            maxDate: '+30d', // 출발일로부터 최대 30일까지 선택 가능
            beforeShow: function(input, inst) {
                setTimeout(setDatepickerZIndex, 0); // 캘린더 열릴 때 z-index 설정
            },
            onSelect: function(selectedDate) {
                // 숨겨진 필드에 도착일 넣기
                updateReturnDateTime();
            }
        });

        // 출발 시간 선택 시 숨겨진 필드 업데이트(yyyy-MM-dd HH:mm)
        $("#start_date, #start_time").on("change", function() {
        	updateRentalDateTime();
//         	let dateTime = $("#start_date").val() + " " + $("#start_time").val();
//             $("#res_rental_date").val(dateTime);
        });

        // 도착 시간 선택 시 숨겨진 필드 업데이트(yyyy-MM-dd HH:mm)
        $("#end_date, #end_time").on("change", function() {
        	updateReturnDateTime();
//         	let dateTime = $("#end_date").val() + " " + $("#end_time").val();
//             $("#res_return_date").val(dateTime);
        });

        function updateRentalDateTime() {
            let date = $("#start_date").val();
            let time = $("#start_time").val();
            if (date && time) {
                let dateTime = date + " " + time;
                $("#res_rental_date").val(dateTime);
            }
        }

        function updateReturnDateTime() {
            let date = $("#end_date").val();
            let time = $("#end_time").val();
            if (date && time) {
                let dateTime = date + " " + time;
                $("#res_return_date").val(dateTime);
            }
        }
        
		// 출발일, 도착일 초기값 설정
        $("#start_date").val(todayFormatted);
        $("#end_date").val(tomorrowFormatted);
        
    });
    
});
</script>

<!-- 출발일시 선택 -->
<label for="start_date">출발일 </label>
<input type="text" id="start_date" readonly="readonly" placeholder="출발일 선택">
<select id="start_time">
	<option value="">대여시간 선택</option>
	<c:forEach var="i" begin="7" end="22" step="1">
		<c:forEach var="j" begin="00" end="30" step="30">
			<option value="<fmt:formatNumber value='${i}' pattern='00' />:<fmt:formatNumber value='${j}' pattern='00' />">
				<fmt:formatNumber value="${i}" pattern="00" />:
				<fmt:formatNumber value="${j}" pattern="00" />
			</option>
		</c:forEach>
	</c:forEach>
</select>
<br>

<!-- 도착일시 선택 -->
<label for="end_date">도착일 </label>
<input type="text" id="end_date" readonly="readonly" placeholder="도착일 선택">
<select id="end_time">
	<option value="">반납시간 선택</option>
	<c:forEach var="i" begin="6" end="21" step="1">
		<c:forEach var="j" begin="00" end="30" step="30">
			<option value="<fmt:formatNumber value='${i}' pattern='00' />:<fmt:formatNumber value='${j}' pattern='00' />">
				<fmt:formatNumber value="${i}" pattern="00" />:
				<fmt:formatNumber value="${j}" pattern="00" />
			</option>
		</c:forEach>
	</c:forEach>
</select>
<br>

<!-- 출발일(날짜+시간), 도착일(날짜+시간) 전달 -->
<input type="hidden" id="res_rental_date" name="res_rental_date" readonly>
<input type="hidden" id="res_return_date" name="res_return_date" readonly>