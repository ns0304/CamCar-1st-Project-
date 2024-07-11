<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카_최종예약</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
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
 
.popUpMessage {
	max-height: 600px;
	overflow-y: auto;
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
	
	// 이용약관 팝업창 1-7 열고 닫기
	
	  for (let i = 1; i <= 7; i++) {
	        // 이용약관 팝업창 열기
	        $("#detail" + i).click(function(event) {
	            event.preventDefault();
	            $(".agreementPopUp" + i).show();
	        });

	        // 이용약관 팝업창 닫기
	        $(".agreementPopUp" + i + " .close" + i + ", .agreementPopUp" + i + " .agreementConfirm").click(function() {
	            $(".agreementPopUp" + i).hide();
	        });
	    }

});
</script>
</head>
<body>
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
		
		<!-- 오른쪽 사이드 영역 -->
		<aside id="sideContent">
<%-- 			<jsp:include page="/WEB-INF/views/reservation/sideContent.jsp"></jsp:include> --%>
			<form action="ReservationFin" name="reservation" method="post">
				<img src="${pageContext.request.servletContext.contextPath}/resources/img/campingcarImage.png" id="campingcarImage" height="120px">
					<h5>000님의 여정</h5>     
					<a href="#">수정</a>
			          <h4>XX 지점</h4>
			          <hr>
			          <h4>mm:dd yy:MM ~ mm:dd yy:MM</h4>
			          <hr>
			          <h4>레이</h4>
			          
			          <button type="submit">다음</button>			
			</form>
		</aside>
		</main>
		
		<!-- 팝업1 -->
	    <div class="agreementPopUp1">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>고유식별정보 수집 및 이용 동의(필수)</h2>
	   	             <span class="close1" id="closePopup1">&times;</span>
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
	   	             <span class="close2" id="closePopup2">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/agreementPopUp2.jsp"></jsp:include>
		        	<input type="button" value="확인했어요" class="agreementConfirm">
		        </div>		        
	        </fieldset>
	    </div>	
	    
	    <!-- 팝업3 -->
	    <div class="agreementPopUp3">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>개인정보 수집 및 이용 동의(필수)</h2>
	   	             <span class="close3" id="closePopup3">&times;</span>
		        </div>
		        <div class="popUpMessage">
		        	보류 
		        	<input type="button" value="확인했어요" class="agreementConfirm">
		        </div>		        
	        </fieldset>
	    </div>	
	    
<!-- 	    팝업4 -->
	    <div class="agreementPopUp4">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>개인정보 제3자 제공 동의(필수)</h2>
	   	             <span class="close4" id="closePopup4">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/agreementPopUp4.jsp"></jsp:include>
		        	<input type="button" value="확인했어요" class="agreementConfirm">
		        </div>		        
	        </fieldset>
	    </div>	
	    
<!-- 	    팝업5 -->
	    <div class="agreementPopUp5">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>고유식별정보 제3자 제공에 관한 동의(필수)</h2>
	   	             <span class="close5" id="closePopup5">&times;</span>
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
	    
<!-- 	    팝업6 -->
	    <div class="agreementPopUp6">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>자동차 표준 대여약관(필수)</h2>
	   	             <span class="close6" id="closePopup6">&times;</span>
		        </div>
		        <div class="popUpMessage">
<%-- 					<jsp:include page="${pageContext.request.servletContext.contextPath}/WEB-INF/views/reservation/agreementPopUp6.jsp"></jsp:include> --%>
					<jsp:include page="/WEB-INF/views/reservation/agreementPopUp6.jsp"></jsp:include>
		        	<input type="button" value="확인했어요" class="agreementConfirm">
		        </div>		        
	        </fieldset>
	    </div>	
	    
<!-- 	    팝업7 -->
	    <div class="agreementPopUp7">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>고유식별정보 수집 및 이용 동의(필수)</h2>
	   	             <span class="close7" id="closePopup7">&times;</span>
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
	    
	<!-- okokokkokok 카카오톡 1:1문의하기 okokokkokok-->		
		<aside class="chatBtn">
			<jsp:include page="/WEB-INF/views/kakaoLink.jsp"></jsp:include>
		</aside>	
		
		
	<footer>
		<!-- 회사 소개 영역 -->
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>


