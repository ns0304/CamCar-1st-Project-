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
.agreementPopUp1, .agreementPopUp2, .agreementPopUp3, .agreementPopUp4, .agreementPopUp5, .agreementPopUp6, .agreementPopUp7 {
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

	// 체크박스 전체선택 선택/해제
function checkbox_allCheck() { 	
	for(let check of document.fr.cb) {
		check.checked = document.fr.all_check.checked;
	}
}

$(document).ready(function() {
	
	// 이용약관 팝업창1 열기
	$("#detail1").click(function(event) {
	    event.preventDefault();
	    $(".agreementPopUp1").show();
	});
	
	// 이용약관 팝업창1 닫기
	$(".agreementPopUp1 .close1, .agreementPopUp1 .agreementConfirm").click(function() {
	    $(".agreementPopUp1").hide();
	});
	
	// 이용약관 팝업창2 열기
	$("#detail2").click(function(event) {
	    event.preventDefault();
	    $(".agreementPopUp2").show();
	});
	
	// 이용약관 팝업창2 닫기
	$(".agreementPopUp2 .close2").click(function() {
	    $(".agreementPopUp2").hide();
	});
	
	// 이용약관 팝업창3 열기
	$("#detail3").click(function(event) {
	    event.preventDefault();
	    $(".agreementPopUp3").show();
	});
	
	// 이용약관 팝업창3 닫기
	$(".agreementPopUp3 .close3").click(function() {
	    $(".agreementPopUp3").hide();
	});
	
	// 이용약관 팝업창4 열기
	$("#detail4").click(function(event) {
	    event.preventDefault();
	    $(".agreementPopUp4").show();
	});
	
	// 이용약관 팝업창4 닫기
	$(".agreementPopUp4 .close4").click(function() {
	    $(".agreementPopUp4").hide();
	});
	
	// 이용약관 팝업창5 열기
	$("#detail5").click(function(event) {
	    event.preventDefault();
	    $(".agreementPopUp5").show();
	});
	
	// 이용약관 팝업창5 닫기
	$(".agreementPopUp5 .close5").click(function() {
	    $(".agreementPopUp5").hide();
	});
	
	// 이용약관 팝업창6 열기
	$("#detail6").click(function(event) {
	    event.preventDefault();
	    $(".agreementPopUp6").show();
	});
	
	// 이용약관 팝업창6 닫기
	$(".agreementPopUp6 .close6").click(function() {
	    $(".agreementPopUp6").hide();
	});
	
	// 이용약관 팝업창7 열기
	$("#detail7").click(function(event) {
	    event.preventDefault();
	    $(".agreementPopUp7").show();
	});
	
	// 이용약관 팝업창7 닫기
	$(".agreementPopUp7 .close7").click(function() {
	    $(".agreementPopUp7").hide();
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
			<h2>결제</h2>
			<div id ="reservationStep" >
				<ul class="reservationStepList">
					<li>
						예약
					</li>
					<li>
						부가상품
					</li>
					<li id="reservationStepNow">
						결제
					</li>
					<li>
						완료
					</li>
				</ul>
			</div>
			<div id="paymentContent" class="clear">
				<div class="payment" >
					<h3>결제방법</h3>
					<div id="paymentOption">
						<div id ="paymentBtn">
							<input type="button" value="신용/체크카드" id="paymentBtn1">
							<input type="button" value="카카오페이" id="paymentBtn2">
							<input type="button" value="네이버페이" id="paymentBtn3">
						</div>
					</div>
				</div>	
				<div class="userAgreement">
					<h3>이용약관 동의</h3>
					<form name="fr">
						<div id="userAgreementCheck">
							<input type="checkbox" name="all_check" onclick="checkbox_allCheck()" > 모든 필수/선택 약관을 확인하고 전체 동의합니다. <br>
							<hr>
							<input type="checkbox" name="cb"> 고유식별정보 수집 및 이용 동의(필수)<a class="detail" id="detail1">보기</a> <br>
							<input type="checkbox" name="cb"> 대여자격 확인 및 동의(필수)<a class="detail" id="detail2">보기</a><br>
							<input type="checkbox" name="cb"> 개인정보 수집 및 이용 동의(필수)<a class="detail" id="detail3">보기</a><br>
							<input type="checkbox" name="cb"> 개인정보 제3자 제공 동의(필수)<a class="detail" id="detail4">보기</a><br>
							<input type="checkbox" name="cb"> 고유식별정보 제3자 제공에 관한 동의(필수) <a class="detail" id="detail5">보기</a><br>
							<input type="checkbox" name="cb"> 자동차 표준 대여약관(필수) <a class="detail" id="detail6">보기</a><br>
							<input type="checkbox" name="cb"> 취소 및 위약금 규정 동의(필수)<a class="detail" id="detail7">보기</a>
						</div>
					</form>
				</div>
			</div>

		</section>
		<aside id="sideContent">
			<form action="ReservationFin" name="reservation" method="post">
				<img src="${pageContext.request.servletContext.contextPath}/resources/img/campingcarImage.png" id="campingcarImage" height="120px">
					<h5>000님의 여정</h5>     
					<a href="#">수정</a>
			          <h4>XX 지점</h4>
			          <hr>
			          <h4>mm:dd yy:MM ~ mm:dd yy:MM</h4>
			          <hr>
			          <h4>XX 지점</h4>
			          
			          <button type="submit">다음</button>			
			</form>
		</aside>
		</main>
		
		<!-- 팝업1 -->
	    <div class="agreementPopUp1">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>고유식별정보 수집 및 이용 동의(필수)</h2>
	   	             <span class="close1" id="closePopup">&times;</span>
		        </div>
		        <div class="popUpMessage">
		        	<table border="1">
		        		<tr>
		        			<td>수집항목</td>
		        			<td>이용목적</td>
		        			<td>보유 및 이용기간
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>운전면허번호</td>
		        			<td>차량 대여 자격 확인</td>
		        			<td>계약에 따른 거래 관계의 종료 후 5년</td>
		        		</tr>
		        	</table>
		        	위의 고유식별정보 처리에 대한 동의를 거부할 권리가 있습니다. 
		        	그러나 동의를 거부할 경우 차량 대여 자격 확인 불가에 따른 차량 예약이 불가합니다.<br>
		        	<input type="button" value="확인했어요" class="agreementConfirm">
		        </div>		        
	        </fieldset>
	    </div>	
	    
	    <!-- 팝업2 -->
	    <div class="agreementPopUp2">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>대여자격 확인 동의(필수)</h2>
	   	             <span class="close2" id="closePopup">&times;</span>
		        </div>
		        <div class="popUpMessage">
			        제주/내륙 예약 시<br>
					1. 한국인(외국영주권자 포함)<br>
					9인승 이하 내연차 / 전기차 (프리미엄 전기차 제외) : 만 21세 이상, 2종 보통면허 이상, 운전경력 1년 이상(운전경력 재취득 포함)<br>
					수입 내연차 / 프리미엄 전기차 : 만 26세 이상, 2종 보통면허 이상, 운전경력 3년 이상(운전경력 재취득 포함)<br>
					11인승 이상 내연차 : 만 26세 이상, 1종 보통면허 이상, 운전경력 3년 이상(운전경력 재취득 포함)<br>
					※ 운전경력 인정기준 : 현 유효한 면허증의 면허취득일 기준(유효한 면허 이전의 모든 면허 경력 인정 불가)<br>
					2.외국인<br>
					승차인원 9명 이하<br>
					- 만21세 이상, 교환된 한국 운전면허증 일반2종 이상, 국제운전면허증(IDP) Class "B“, 주한미군 자동차운전면허증<br>
					※ 한국운전면허증 : 국내 취득 면허 - 발급 후 1 년 이상 경과 / 국내 교환 면허 - 운전경력 조항 면제(*별도서류 확인 필수)<br>
					승차인원 10명 이상<br>
					- 만26세 이상, 교환된 한국 운전면허증 일반1종 이상, 국제운전면허증(IDP) Class "D"<br>
					※ 한국운전면허증 : 국내 취득 및 교환 모두 발급 후 3년 이상 경과<br>
					- 외국 운전면허증에서 한국 운전면허증으로 교환된 면허는 발급 후 1 년 조항 면제 (9 인 이하 차종의 경우)<br>
					(*한국 운전면허 경력 면제 시 : 본국 운전면허증(로컬면허증)의 취득기간이 확인되는 대사관 확인 문서 or 아포스티유 인증서 확인)<br>
					주한미군 자가용 운전면허증 소지자는 최대 9 인승 이하 차량만 대여 가능<br>
					국제 운전면허증의 유효기간과 별개로 국제 조약 및 관련 법령에 따라 해당 국가에 마지막 입국한날로부터 1년만 유효<br>
					국제운전면허증/여권/본국 운전면허증 서류 모두 영문 성/이름이 일치하지 않을 경우 무효<br>
					국제운전면허증으로 운전할 경우 운전면허증과 여권을 지참하지 않으면 무면허 운전으로 처벌받을 수 있으므로 운전 중에도 유효 서류 지참 필요<br>
					한국은 IDP(International Driving Permit) 국제운전면허증만 유효 (IDL 불가)<br>
					* 운전자가 위의 대여자격조건에 맞지 않을 경우 현장에서 차량인수가 불가할 수 있습니다.<br>
					여객자동차운수사업법 제34조 2항 개정에 따른 대여자동차 운전자의 자격 확인<br>
					여객자동차운수사업법 제34조 2(자동차 대여사업자의 준수사항) ②항 자동차대여사업자는 대여사업용 자동차를 대여할 때 임대차계약서상의 운전자에 대하여 운전자격을 확인하고, 해당 운전자가 다음 각 호의 어느 하나에 해당하는 경우에는 자동차를 대여하여서는 아니 된다.<br>
					1. “도로교통법” 제80조 제1항에 따라 지방경찰청장으로부터 운전면허를 받지 아니하거나 운전면허의 효력이 정지된 경우<br>
					2. 대여하는 자동차가 임대차계약서상의 운전자가 보유한 운전면허의 범위(“도로교통법” 제80조 제2항에 따른 운전면허의 범위를 말한다)에 따라 운전할 수 있는 자동차의 종류에 해당하지 아니하는 경우
		        	<input type="button" value="확인했어요" class="agreementConfirm">
		        </div>		        
	        </fieldset>
	    </div>	
	    
	    <!-- 팝업3 -->
	    <div class="agreementPopUp3">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>개인정보 수집 및 이용 동의(필수)</h2>
	   	             <span class="close3" id="closePopup">&times;</span>
		        </div>
		        <div class="popUpMessage">
		        	보류 
		        	<input type="button" value="확인했어요" class="agreementConfirm">
		        </div>		        
	        </fieldset>
	    </div>	
	    
	    <!-- 팝업4 -->
	    <div class="agreementPopUp4">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>개인정보 제3자 제공 동의(필수)</h2>
	   	             <span class="close4" id="closePopup">&times;</span>
		        </div>
		        <div class="popUpMessage">
		        	보류
		        	<input type="button" value="확인했어요" class="agreementConfirm">
		        </div>		        
	        </fieldset>
	    </div>	
	    
	    <!-- 팝업5 -->
	    <div class="agreementPopUp5">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>고유식별정보 제3자 제공에 관한 동의(필수)</h2>
	   	             <span class="close5" id="closePopup">&times;</span>
		        </div>
		        <div class="popUpMessage">
		        	제공받는 자: 한국교통안전공단<br>
					보유 및 이용기간: 면허 유효성 확인 요청일로부터 3년<br>
		        	<table border="1">
		        		<tr>
		        			<td>제공하는 항목</td>
		        			<td>제공받는 자의 이용목적</td>
		        		</tr>
		        		<tr>
		        			<td>운전면허번호</td>
		        			<td>차량 대여 자격 확인</td>
		        		</tr>
		        	</table>
		        	제공받는 자: 과태료 등 부과주체(경찰서, 지자체, 유료도로/터널/주차장 사업자 및 관리운영회사, 한국도로공사, 지자체 시설관리공단)<br>
		        	보유 및 이용기간: 과태료 처리/정산 완료 시 까지<br>
		        	<table border="1">
		        		<tr>
		        			<td>제공하는 항목</td>
		        			<td>제공받는 자의 이용목적</td>
		        		</tr>
		        		<tr>
		        			<td>운전면허번호</td>
		        			<td>과태료 발생 주체 식별</td>
		        		</tr>
		        	</table>
		        	위의 고유식별정보 처리에 대한 동의를 거부할 권리가 있습니다. 
		        	그러나 동의를 거부할 경우 차량 대여 자격 확인 불가에 따른 차량 예약이 불가합니다.<br>		        	
		        	<input type="button" value="확인했어요" class="agreementConfirm">
		        </div>		        
	        </fieldset>
	    </div>	
	    
	    <!-- 팝업6 -->
	    <div class="agreementPopUp6">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>자동차 표준 대여약관(필수)</h2>
	   	             <span class="close6" id="closePopup">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="${pageContext.request.servletContext.contextPath}/WEB-INF/views/reservation/agreementPopUp6.jsp"></jsp:include>
		        	<input type="button" value="확인했어요" class="agreementConfirm">
		        </div>		        
	        </fieldset>
	    </div>	
	    
	    <!-- 팝업7 -->
	    <div class="agreementPopUp7">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>고유식별정보 수집 및 이용 동의(필수)</h2>
	   	             <span class="close7" id="closePopup">&times;</span>
		        </div>
		        <div class="popUpMessage">
		        	<table border="1">
		        		<tr>
		        			<td>수집항목</td>
		        			<td>이용목적</td>
		        			<td>보유 및 이용기간
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>운전면허번호</td>
		        			<td>차량 대여 자격 확인</td>
		        			<td>계약에 따른 거래 관계의 종료 후 5년</td>
		        		</tr>
		        	</table>
		        	위의 고유식별정보 처리에 대한 동의를 거부할 권리가 있습니다. 
		        	그러나 동의를 거부할 경우 차량 대여 자격 확인 불가에 따른 차량 예약이 불가합니다.<ㅠbr>
		        	<input type="button" value="확인했어요" class="agreementConfirm">
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


