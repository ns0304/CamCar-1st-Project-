<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카_최종예약</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- <link href="${pageContext.request.servletContext.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css"> --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/reservation_final.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style type="text/css">
.insurancePopUp {
    display: none;
    position: fixed;
    left: 50%;
    top: 40%;
    transform: translate(-50%, -50%);
    width: 600px;
    background-color: #fff;
    border: 1px solid #ccc;
    padding: 20px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    z-index: 1000;
}

.popUpHeader {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.popUpHeader h2 {
    margin: 0;
    font-size: 16px;
}

.popUpHeader .close {
    cursor: pointer;
    font-size: 16px;
}

.popUpField { 
     margin: 1px 0;
     margin-bottom: 1px; 
     margin-top: 1px; 
 } 
 
</style>
<script type="text/javascript">

$(document).ready(function() {
	
	// 보장 내용 알아보기 팝업창
	$("#insuranceDetail").click(function(event) {
	    event.preventDefault();
	    $(".insurancePopUp").show();
	});
	
	// 팝업 닫기
	$(".insurancePopUp .close").click(function() {
	    $(".insurancePopUp").hide();
	});

});
</script>
</head>
<body>
<!-- 	<div id="container"> -->
		<header>
			<!-- 메뉴 -->
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		<main>
		<section id ="contents">
			<h2>예약</h2>
			<div id ="reservationStep" >
				<ul class="reservationStepList">
					<li id="reservationStepNow">
						예약
					</li>
					<li>
						부가상품
					</li>
					<li>
						결제
					</li>
					<li>
						완료
					</li>
				</ul>
			</div>
			<div id="insurance" class="clear">
				<h3>보험선택</h3>
					<div id="insuranceWrap">
						<section id="insurance1" class="insuranceList">
						<h3>선택 안함</h3>
						
						사고 시 본인 부담금<br>
						<input type="button" value="금액" id="insuranceBtn1">
						</section>
						<section id="insurance2" class="insuranceList">
						<h3>일반 자차</h3>
						
						사고 시 본인 부담금<br>
						<input type="button" value="금액" id="insuranceBtn2">
						</section>
						<section id="insurance3" class="insuranceList">
						<h3>완전 자차</h3>
						
						사고 시 본인 부담금<br>
						<input type="button" value="금액" id="insuranceBtn3">
						</section>
					</div>
					<div id="insuranceDetail" class="clear">
						<a href="#" insuranceDetail>보장 내용 알아보기</a>	
					</div>
			</div>
			<div id="driverInfo"  class="clear">
				<form id="driverInfoForm">
					<h3>운전자 정보 입력</h3>
					<a href="#">내 정보에서 불러오기</a>
					<div id="driverInfoList">
						<div id="driverInfo1" class="clear">
							<h4>기본정보</h4>
							이름<br>
							<input type="text" placeholder="이름을 입력해주세요"><br><br>
							휴대폰번호<br>
							<input type="text" placeholder="01012345678"><br><br>
							생년월일<br>
							<input type="text" placeholder="YYYYMMDD"><br><br>
							주소<br>
							<input type="text" placeholder="주소검색을 통해 입력해주세요"><br>
							<input type="button" value="주소검색">
						</div>
						<div id="driverInfo2">
							<h4>운전면허정보</h4>
							<img src="${pageContext.request.servletContext.contextPath}/resources/img/driverImage.png"  id="driverImage" height="120px"><br>
							면허종류<br>
							<select>
								<option></option>
							</select><br>
							면허번호<br>
							<input type="text" placeholder="-를 뺀 면허정보를 입력해주세요"><br>
							발급일자<br>
							<input type="text" placeholder="YYYYMMDD"><br>
							만료일자<br>
							<input type="text" placeholder="YYYYMMDD"><br>	
						</div>
					</div>
					<div id="driverInfoSubmit"><input type="submit" value="입력완료"></div>
				</form>		
			</div>
		</section>
		
		<aside id="sideContent">
<%-- 			<jsp:include page="/WEB-INF/views/reservation/sideContent.jsp"></jsp:include> --%>
			<form action="ReservationAdd" name="reservation" method="post">
				<img src="${pageContext.request.servletContext.contextPath}/resources/img/campingcarImage.png" id="campingcarImage" height="120px">
					<h5>000님의 여정</h5>     
					<a href="#">수정</a>
			          <h4>XX 지점---</h4>
			          <hr>
			          <h4>mm:dd yy:MM ~ mm:dd yy:MM</h4>
			          <hr>
			          <h4>XX 지점</h4>
			          
			          <button type="submit">다음</button>			
			</form>
		</aside>
		</main>
		
<!-- 		보장내용 알아보기 팝업 -->
	    <div class="insurancePopUp">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>보장내용을 알아볼까요?</h2>
	   	             <span class="close" id="closePopup">&times;</span>
		        </div>
		        <div class="popUpMessage">
		            <h3>자동차보험 꼭 가입해야 하나요?</h3>
		            캠핑갈카 모든 차량이 ‘자동차 종합보험’에 가입되어 있으니<br>
					보험 가입하고 든든하게 보장받으세요.<br>
					<h3>‘일반자차’와 ‘완전자차’ 차이점을 알고싶어요</h3>
					‘고객부담금’을 제외한 나머지 보장 내용이 같아요.<br>
					 단, 보험을 선택하지 않으면 사고 시 모든 비용을 부담해야 해요.<br>
					<table border="1">
						<tr>
							<td>구분</td>
							<td>선택안함</td>
							<td>일반자차</td>
							<td>완전자차</td>
						</tr>
						<tr>
							<td>고객 부담금<br>(자차 수리비)</td>
							<td>전액</td>
							<td>30만원</td>
							<td>면제</td>
						</tr>
						<tr>
							<td>대인</td>
							<td colspan="3">무한대</td>
						</tr>
						<tr>
							<td>대물</td>
							<td colspan="3">건당 2천만원까지</td>
						</tr>
						<tr>
							<td>자손</td>
							<td colspan="3">인당 1천 5백만원까지</td>
						</tr>
					</table> 
					 &#128712; 자손 : 나의 신체가 다친 경우
					 &#128712; 대물 : 다른 사람의 물건(차량)에 손해를 입힌 경우
					 &#128712; 대인 : 다른 사람의 신체를 다치게 한 경우
		            <h3>휴차보상료가 뭔가요?</h3>	
		            차량 사고시 수리 기간 동안 할인이 적용되지 않은 표준대여료(24시간 기준)의 50%를 고객(임차인)에게 청구하는데<br>
					이 요금을 휴차보상료(또는 휴차료)라고 해요.<br><br>
					- ‘완전 자차’ 보험 가입 시 단순 사고일 경우 휴차보상료가 면제 돼요.<br>
					-  단, ‘완전 자차’ 보험을 가입했어도 전손 처리 혹은 폐차 시 휴차보상료가 부과 돼요.<br>
					 &#128712; 임대차 계약서 > 보험 보상 관련 약관에서 확인 가능	
					 <h3>보험 가입 후 사고 났을 때 어떻게 처리되나요?</h3>	
					 한 번의 사고만 보장해요. 운전 중 사고가 났다면 캠핑갈카 고객센터 (1599-9111)로 전화주세요.<br>
					 -----이미지삽입-----
		        </div>		        
	        </fieldset>
	    </div>		
	<!-- okokokkokok 카카오톡 1:1문의하기 okokokkokok-->		
		<aside class="chatBtn">
		 <nav>
		  <a href="#sec01">
		  <img src="${pageContext.request.servletContext.contextPath}/resources/img/chat.png"><br>
		  채팅상담</a>
		 </nav>
		</aside>		
		
		
	<footer>
		<!-- 회사 소개 영역 -->
<%-- 		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include> --%>
	</footer>
<!-- 	</div> -->
</body>
</html>


