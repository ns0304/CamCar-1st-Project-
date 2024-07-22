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
    // 오늘 날짜와 내일 날짜를 설정합니다.
    let today = new Date();
    let todayFormatted = $.datepicker.formatDate('yy-mm-dd', today);
    let tomorrow = new Date(today);
    tomorrow.setDate(today.getDate() + 1);
    let tomorrowFormatted = $.datepicker.formatDate('yy-mm-dd', tomorrow);

    // 90일 후 날짜를 계산합니다.
    let maxDate = new Date();
    maxDate.setDate(maxDate.getDate() + 90);

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
            // 도착일의 최소, 최대 날짜를 설정합니다.
            let endDateMin = new Date(startDate);
            endDateMin.setDate(startDate.getDate() + 1); // 출발일 다음 날부터
            let endDateMax = new Date(startDate);
            endDateMax.setDate(startDate.getDate() + 30); // 출발일로부터 최대 30일까지

            $('#end_date').datepicker('option', 'minDate', endDateMin);
            $('#end_date').datepicker('option', 'maxDate', endDateMax);

            // 출발일이 오늘일 경우, 출발 시간을 동적으로 설정
            if (startDate.toDateString() === today.toDateString()) {
                setMinStartTime();
            } else {
            	// 오늘이 아닌 경우에는 모든 시간을 보이도록함
                $("#start_time option").show();
            }

            // 숨겨진 필드에 출발일 업데이트
            updateRentalDateTime();
        }
    });

    // 도착일 선택 시
    $("#end_date").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: '+1d', // 출발일 다음 날부터 선택 가능
        maxDate: '+30d', // 출발일로부터 최대 30일까지 선택 가능
        beforeShow: function(input, inst) {
            setTimeout(setDatepickerZIndex, 0); // 캘린더 열릴 때 z-index 설정
        },
        onSelect: function(selectedDate) {
            // 숨겨진 필드에 도착일 업데이트
            updateReturnDateTime();
        }
    });

    // 출발 시간 선택 시 숨겨진 필드 업데이트
    $("#start_date, #start_time").on("change", function() {
        updateRentalDateTime();
    });

    // 도착 시간 선택 시 숨겨진 필드 업데이트
    $("#end_date, #end_time").on("change", function() {
        updateReturnDateTime();
    });

    // 출발일 시간 선택 가능 범위를 설정하는 함수
    function setMinStartTime() {
        let now = new Date();
        now.setMinutes(now.getMinutes() + 60); // 현재 시간보다 1시간 뒤로 설정
        let currentHour = now.getHours();
        let currentMinute = now.getMinutes();

     // 시간 옵션을 숨기거나 보이도록 설정
        $("#start_time option").each(function() {
            let [optionHour, optionMinute] = $(this).val().split(':').map(Number);
            if (optionHour < currentHour || (optionHour === currentHour && optionMinute < currentMinute)) {
                $(this).hide(); // 현재 시간보다 이전 시간은 숨김
            } else {
                $(this).show(); // 현재 시간 이후는 보이도록함
            }
        });

        // 현재 시간보다 이전 시간을 선택할 수 없음
        $("#start_time").prop('disabled', false);
    }

    // 공통 설정(캘린더를 맨앞으로 이동)
    function setDatepickerZIndex() {
        $('.ui-datepicker').css('z-index', 9999);
    }

    // 출발일, 도착일 초기값 설정
    $("#start_date").val(todayFormatted);
    $("#end_date").val(tomorrowFormatted);
    
	// 페이지가 처음 로드될 때 출발일이 오늘일 경우 시간 옵션을 동적으로 설정
    if ($("#start_date").val() === todayFormatted) {
        setMinStartTime();
    }
    
    // 출발일과 출발 시간 숨겨진 필드 업데이트
    function updateRentalDateTime() {
        let date = $("#start_date").val();
        let time = $("#start_time").val();
        if (date && time) {
            let dateTime = date + " " + time;
            $("#res_rental_date").val(dateTime);
        }
    }

    // 도착일과 도착 시간 숨겨진 필드 업데이트
    function updateReturnDateTime() {
        let date = $("#end_date").val();
        let time = $("#end_time").val();
        if (date && time) {
            let dateTime = date + " " + time;
            $("#res_return_date").val(dateTime);
        }
    }
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