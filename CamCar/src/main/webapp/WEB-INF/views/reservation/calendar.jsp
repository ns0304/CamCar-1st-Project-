<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
#schedule {
	display: none;
	position: absolute;
    right: 8px;
    top: 145px;
	background-color: #fff;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    z-index: 1000;
  	border-radius: 12px;
	width: 400px; height:auto;
	
 	padding: 15px;
	box-sizing: border-box;
/* 	overflow: scroll; */
}

/* #schedule::-webkit-scrollbar {display: none;} */

#calendar {
	table-layout:fixed;
 	width: 350px;
	line-height: 30px;
}

#res_timeTable {
	text-align: center;
}
#res_timeTable>select {
	width: 40%;
}

.sche_btn input {
	width: 40%;
	background-color: #f1f3f5;
}
</style>


<script type="text/javascript">



// ---------------------- 캘린더 생성하기 ----------------------
// 오늘 날짜 불러오기
let today = new Date();
// today 보조(고정)
let date = new Date();
// 선택된 셀 객체 저장
let selectRentalCell;
let selectReturnCell;
//오늘 기준의 월, 일 객체
let realMonth = date.getMonth()+1;
let realToDay = date.getDate();
// 선택된 일자의 월, 일 객체
let selectedMonth = null;
let selectedDate = null;

// 선택된 예약일 저장 객체(출력)
let clickRental = null;
let clickReturn = null;

let cell;

//이전달 이동
function prevCalendar(){
	// 지금날짜 기준 이전달 이동불가
	if(today.getMonth() < realMonth) {
		return false;
	} else {
		today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
		buildCalendar();
	}
}

// 다음달 이동
function nextCalendar(){
	if(today.getMonth() >= realMonth + 2) {	// today.getMonth() + 1 >= realMonth + 3
		alert("예약은 금일기준 90일 이후까지만 가능합니다.");
		return false;
	} else {
		today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
		buildCalendar();
	}
}

// 이번달 기준 캘린더
function buildCalendar(){
	let row = null;
	let cnt = 0;

	// 이번달의 첫날, 마지막날
	let firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
	let lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
	
	// 현재 참조중인 월
	nowMonth = today.getMonth() + 1;
	// 이번달이면 0, 다음달이면 1 리턴
// 	monthEquals = thisMonth(nowMonth, realMonth);
	
	let calendar = document.getElementById("calendar");	// 달력 객체
	let calendarTitle = document.getElementById("calendarTitle");	// 달력의 타이틀 객체
	calendarTitle.innerHTML = today.getFullYear()+"년"+ nowMonth +"월";	// 타이틀 수정
	
	// 테이블 초기화
	// => calendarTitle, days 들어갈 공간 비움(3번째 행부터 시작)
	while(calendar.rows.length > 2){
		calendar.deleteRow(calendar.rows.length -1);
	}
	
	row = calendar.insertRow();	// calendar 테이블에 행 추가
	// 달의 첫 날 전까지 빈 셀 채우기
	for(i = 0; i < firstDate.getDay(); i++){
		cell = row.insertCell();
		cnt += 1;
	}
	
	// 달력 채우기(요일 입력)
	for(i = 1; i <= lastDate.getDate(); i++){
		// 예약하지 못하는 조건일 경우 +1씩 되므로 noCount가 0일 시에만 클릭함수 적용
		noCount = 0;
		cell = row.insertCell();
		
	    cell.setAttribute('id', i);	// cell id
		cell.innerHTML = i;
// 		cell.innerHTML = '<label onclick="prevCalendar()">' + i + '</label>';
		cell.align = "center";
		
		cnt += 1;	// 셀 생성 후 count 증가
	
	    if (cnt % 7 == 1) {	// 일요일
	    	cell.innerHTML = "<font color=red>" + i + "</font>";
	    }
	
	    if (cnt % 7 == 0){	// 토요일
	    	cell.innerHTML = "<font color=blue>" + i + "</font>";
	    	row = calendar.insertRow();	// 다음행으로 개행
	    }
	    
	    // 예약불가일(오늘 이전 또는 90일 이후 일 경우)
// 	    let etp = exchangeToPossibleDay(cnt)*1;
	    
	    if(nowMonth == realMonth && i < realToDay) {	// 오늘 이전일 경우
	    	noCount += 1;
	    } else if(nowMonth >= (realMonth + 3) && i >= realToDay) {	// 90일 이후일 경우
	    	noCount += 1;
	    }
	    
	    if (noCount > 0){	// 예약 불가일 색상 변경
			cell.innerHTML = "<font color='#C6C6C6' >" + i + "</font>";
		} else {	// 예약 가능일 클릭 이벤트
			cell.onclick = function(){
				selectedTimeAndTotalPriceInit();
				// 선택된 날의 연, 월, 일 계산 (일자의 경우 id속성(i) 참조)
// 				let clickYear = today.getFullYear();	// 년
				let clickMonth = (today.getMonth() + 1);	// 월
				clickMonth = clickMonth >= 10 ? clickMonth : '0' + clickMonth;
				let clickDate = this.getAttribute('id');	// 일(i)
				clickDate = clickDate >= 10 ? clickDate : '0' + clickDate;
				
				let week = ['일', '월', '화', '수', '목', '금', '토'];	// 0 ~ 6
				let clickWeek = week[today.getDay()];	// 요일
				
				clickRental = clickMonth + "." + clickDate + "(" + clickWeek + ")";	// 대여일 ex) 7/1(월)
				clickReturn = clickMonth + "." + clickDate + "(" + clickWeek + ")";	// 반납일 ex) 7/19(금)
				
				// 대여일
				inputRental = document.getElementById("res_rental_date");
				inputRental.value = clickRental;
				// 반납일
				inputReturn = document.getElementById("res_return_date");
				inputReturn.value = clickReturn;
				
				// 선택된 월, 일 변수 저장
				selectedMonth = today.getMonth() + 1;
				selectedDate = this.getAttribute('id');
				
				// 선택된 셀 색 변화
				if(selectRentalCell != null){
					selectRentalCell.bgColor = "#FFFFFF";
				}
				selectRentalCell = this;
				this.bgColor = "#fbedaa";
				//time table 생성
				buildTimeTable(today.getMonth() + 1,this.getAttribute('id'));
			}
		}
	    
	} // 이번달 캘린더 끝
	
	// 마지막날 뒤 빈 셀 채우기
	if(cnt % 7 != 0){
		for(i = 0; i < 7 - (cnt % 7); i++){
	  		cell = row.insertCell();
	  	}
	}
}


// ======================================================================
// ---------------------- 예약 시간 선택 ----------------------
let startTime = "6";
let endTime = "22";
// //선택된 시간중 가장 빠른, 늦은 시간;
// let selectedFirstTime = 24*1;
// let selectedFinalTime = 0*1;
// //예약시간표를 만들 table객체 획득

// function buildTimeTable(selectedMonth, selectedDate){
// 	let row = null;
// 	let month = selectedMonth;
// 	let date = selectedDate;
// 	let timeTable = document.getElementById("timeTable");
	
// 	//테이블 초기화
// 	while(timeTable.rows.length > 0){
// 		timeTable.deleteRow(timeTable.rows.length-1);
// 	}
	
// 	for (let i = 0; i < endTime - startTime; i++) {
// 		//곱해서 숫자타입으로 변환
// 		cellTime = startTime*1 + i;
		
// 		cellStartTimeText = cellTime + ":00";
// 		cellEndTimeText = (cellTime + 1) + ":00";
// 		inputCellText = cellStartTimeText + " ~ " +  cellEndTimeText;
		
// 		//셀 입력을 위해 테이블 개행
// 		row = timeTable.insertRow();
// 		//해당 row의 셀 생성
// 		cell = row.insertCell();
// 		//cell에 id 부여
// 		cell.setAttribute('id', cellTime);
// 		//셀에 입력
// 		cell.innerHTML = inputCellText;
// 		//selectRentalCell.bgColor = "#FFFFFF";
// 		//cell.innerHTML = "<font color='#C6C6C6' >" + inputCellText + "</font>";
// 		//클릭이벤
// 		cell.onclick = function(){
// 			cellTime = this.getAttribute('id');
// 			cellTime = cellTime*1;
// 			console.log("first : " + selectedFirstTime + ", selectedFinalTime : " + selectedFinalTime + ", selected : " + cellTime);
// 			//예약일시 입력처리
// 			if (selectedFirstTime != 24 && selectedFinalTime != 0){
// 				if(cellTime < selectedFirstTime - 1){
// 					alert("연속한 시간만 예약가능합니다.");
// 					return false;
// 				}
// 				if (cellTime > selectedFinalTime + 1){
// 					alert("연속한 시간만 예약가능합니다.");
// 					console.log(cellTime + ">" + selectedFinalTime + 1)
// 					return false;
// 				}
// 			}
// 			this.bgColor = "#fbedaa";
// 			if (cellTime < selectedFirstTime) {
// 				selectedFirstTime = cellTime
// 			}
// 			if (cellTime > selectedFinalTime) {
// 				selectedFinalTime = cellTime
// 			}
			
// 			//하단의 예약일시에 시간 표시
// 			resTime  = selectedFirstTime + ":00 ~ " + (selectedFinalTime + 1) + ":00";
		
// 			resTimeForm = document.getElementById("selectedTime");
// 			resTimeForm.value = resTime;
			
// 			//하단의 결제정보에 가격정보 표시
// 			useTime = (selectedFinalTime + 1) - selectedFirstTime;
			
// 			useTimeForm = document.getElementById("totalPrice");
// 			useTimeForm.value = useTime * price;
			
// 		}
// 	}
// 	//JSON으로 테이블 td 핸들링
// 	//이번달 0 다음달 1
// 	nowMonth = today.getMonth()+1;
// 	checkMonth = thisMonth(nowMonth, realMonth);
// 	var json = [];
// 	if(checkMonth == 0){
<%-- 		json = <%=thisMonthResData%>; --%>
// 	} else {
<%-- 		json = <%=nextMonthResData%>; --%>
// 	}
// 	for(i = 0; i < Object.keys(json).length; i++){
// 		if (date == json[i].date){
// 			jsonObject = json[i];
// 			for(j = 0; j < jsonObject.startNum.length; j++){
// 				startNum = jsonObject.startNum[j];
// 				shareTime = jsonObject.shareTime[j];
// 				console.log("startNum: " + startNum + ", shareTime : " + shareTime);
// 				for(k = startNum; k < startNum*1 + shareTime; k++){
// 					cell = timeTable.rows[k].cells[0];
// 					cell.style.backgroundColor = "#E0E0E0";
// 					cell.style.color = '#C6C6C6';
// 					cell.onclick = function(){};
// 				}
// 			}
// 		}
// 	}
// }

// select박스 선택 시 날짜 + 시간 형태로 value 값 저장
function rentalTime(RentalTime) {
	clickRental += RentalTime;
	alert(RentalTime);
}
function returnTime(returnTime) {
	clickReturn += returnTime;
}



// 모두 선택 완료 시 일정선택 완료 disabled 해제

// 일정선택 완료 클릭 시 text상자에 대여일, 반납일 value값 넣기 (clickRental, clickReturn)
$(document).ready(function() {
	$("#schedule_apply").click(function() {
// 		let rentalDate = clickRental.val();
// 		$("#res_rental_date").attr(clickRental);

		$("#schedule").hide();
	});
});

</script>

<div id="schedule">
	<span class="close" style="margin-right: 30px;">&times;</span><br>
	<form action="Schedule" name="schedule" method="post">
		<!-- 캘린더 출력 테이블 -->
		<table id="calendar" align="center">
			<tr>
				<td align="center"><label onclick="prevCalendar()">&lt;</label></td>
				<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
				<td align="center"><label onclick="nextCalendar()">&gt;</label></td>
			</tr>
			<tr id="days">
				<td align="center" style="color: red">일</td>
				<td align="center">월</td>
				<td align="center">화</td>
				<td align="center">수</td>
				<td align="center">목</td>
				<td align="center">금</td>
				<td align="center" style="color: blue">토</td>
			</tr>
		</table>
		<!-- 대여, 반납 시간 선택 -->
		<div id="res_timeTable" align="center">
			<select name="rentalTime" onchange="rentalTime(this.value)">
				<option value="">대여시간 선택</option>
				<c:forEach var="i" begin="7" end="22" step="1">
					<c:forEach var="j" begin="00" end="30" step="30">
						<option value="<fmt:formatNumber value='${i}' pattern='00'></fmt:formatNumber>:<fmt:formatNumber value='${j}' pattern='00'></fmt:formatNumber>">
							<fmt:formatNumber value="${i}" pattern="00"></fmt:formatNumber>:
							<fmt:formatNumber value="${j}" pattern="00"></fmt:formatNumber>
						</option>
					</c:forEach>
				</c:forEach>
			</select>
			<select name="returnTime" onchange="returnTime(this.value)">
				<option value="">반납시간 선택</option>
				<c:forEach var="i" begin="6" end="21" step="1">
					<c:forEach var="j" begin="00" end="30" step="30">
						<option value="<fmt:formatNumber value='${i}' pattern='00'></fmt:formatNumber>:<fmt:formatNumber value='${j}' pattern='00'></fmt:formatNumber>">
							<fmt:formatNumber value="${i}" pattern="00"></fmt:formatNumber>:
							<fmt:formatNumber value="${j}" pattern="00"></fmt:formatNumber>
						</option>
					</c:forEach>
				</c:forEach>
			</select>
		</div>
		<div class="sche_btn" align="center">
			<input type="reset" value="초기화">
<!-- 			<input type="button" value="일정선택완료" disabled onclick="completeSchedule"> -->
			<input type="button" id="schedule_apply" value="일정선택완료" onclick="completeSchedule">
		</div>
	</form>
</div>
<script type="text/javascript">buildCalendar();</script>