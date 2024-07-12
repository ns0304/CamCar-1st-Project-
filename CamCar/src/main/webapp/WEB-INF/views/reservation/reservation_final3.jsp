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
.campSetPopUp2, .campSetPopUp3, .campSetPopUp4, .campEtcKitPopUp {
    display: none;
    position: fixed;
    left: 50%;
    top: 40%;
    transform: translate(-50%, -50%);
    width: 900px;
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

$(document).ready(function() {
	
	// 부가상품 캠핑 세트 팝업창 2-4 열고 닫기
	
	  for (let i = 2; i <= 4; i++) {
	        // 팝업창 열기
	        $("#campingSetBtn" + i).click(function(event) {
	            event.preventDefault();
	            $(".campSetPopUp" + i).show();
	        });

	        // 팝업창 닫기
	        $(".campSetPopUp" + i + " .close" + i).click(function() {
	            $(".campSetPopUp" + i).hide();
	        });
	    }
	
	
	// 부가상품 캠핑 개별 팝업창 1-7 열고 닫기
        // 키친팝업창 열기	
		$("#campingEtc4").click(function(event) {
		    event.preventDefault();
		    $(".campEtcKitPopUp").show();
		});
		
		// 팝업 닫기
		$(".campEtcKitPopUp .close").click(function() {
		    $(".campEtcKitPopUp").hide();
		});
	
	
// 		// 보장 내용 알아보기 팝업창
// 		$("#insuranceDetail").click(function(event) {
// 		    event.preventDefault();
// 		    $(".insurancePopUp").show();
// 		});
		
// 		// 팝업 닫기
// 		$(".insurancePopUp .close, .insurancePopUp .agreementConfirm").click(function() {
// 		    $(".insurancePopUp").hide();
// 		});
	
	
	
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
			<h2>부가상품</h2>
			<div id ="reservationStep" >
				<ul class="reservationStepList">
					<li>
						예약
					</li>
					<li id="reservationStepNow">
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
			<div id="addItem" class="clear">
				<div class="addItem1">
					<h3>캠핑아이템</h3>
					<div id="campingItem">
						<div id="campingSet">
						<h4>추천 세트</h4>
						테이블 + 인원별(체어+매트+식기류)<br>
							<div id ="campingSetBtn">
								<input type="button" value="2인" id="campingSetBtn2">
								<input type="button" value="3인" id="campingSetBtn3">
								<input type="button" value="4인" id="campingSetBtn4">
							</div>
						</div>
						<br>
						<h4>개별</h4>
						<div id="campingEtc">
							<div id="campingEtcRow1">
								<input type="button" value="퍼니처" id="campingEtc1">
								<input type="button" value="침낭/매트" id="campingEtc2">
								<input type="button" value="화로/BBQ" id="campingEtc3">
								<input type="button" value="키친" id="campingEtc4">
							</div>
							<div id="campingEtcRow2">
								<input type="button" value="라이팅" id="campingEtc5">
								<input type="button" value="계절용품" id="campingEtc6">
								<input type="button" value="기타" id="campingEtc7">
							</div>
						</div>
					</div>
				</div>	
				<div class="addItem2">
					<h3>기본아이템</h3>
					<div id="basicItem">
						<div id ="basicBtn">
							<input type="button" value="카시트" id="basicBtn1">
							<input type="button" value="유모차" id="basicBtn2">
							<input type="button" value="휠체어" id="basicBtn3">
						</div>
					</div>
				</div>
			</div>

		</section>
				
<!-- 오른쪽 사이드 영역 -->
		<aside id="sideContent">
<%-- 			<jsp:include page="/WEB-INF/views/reservation/sideContent.jsp"></jsp:include> --%>
			<form action="ReservationPay" name="reservation" method="post">
				<img src="${pageContext.request.servletContext.contextPath}/resources/img/campingcarImage.png" id="campingcarImage" height="120px">
					<div class="sideDiv">
						000님의 여정       
						<a href="#" class="right">수정</a>
						<div class="clear">
							<a>XX</a>지점
					          <hr>
							<a>mm:dd yy:MM ~ mm:dd yy:MM</a>
					          <hr>
							<a>차량종류</a>
						</div>
					</div>
					<div class="sideDiv">	
						운전자      
						<a href="#" class="right">수정</a>
						<div class="clear">
							<a>운전자이름</a><br>
							<a>면허종류</a>/<a>생년월일</a>
						</div>
					</div>	
					<div class="sideDiv">	
						결제금액<br>
						표준가<a>000</a>원
						<hr>
						보험료<a>000</a>원
						<hr>
						총 결제금액<a>000</a>원
					</div>	
		          <button type="submit">다음</button>		
			</form>
		</aside>
		</main>
		
		
<!-- 부가상품 팝업 영역 -->
	<!-- [ 캠핑 - 세트 ] -->
	    <div class="campSetPopUp2">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>2인 세트</h2>
	   	             <span class="close2" id="closePopup2">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/campSet2.jsp"></jsp:include>
		        </div>		        
	        </fieldset>
	    </div>	
	    <div class="campSetPopUp3">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>3인 세트</h2>
	   	             <span class="close3" id="closePopup3">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/campSet3.jsp"></jsp:include>
		        </div>		        
	        </fieldset>
	    </div>	
	    <div class="campSetPopUp4">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>4인 세트</h2>
	   	             <span class="close4" id="closePopup4">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/campSet4.jsp"></jsp:include>
		        </div>		        
	        </fieldset>
	    </div>	

	<!-- [ 캠핑 - 개별 ] -->
	    <div class="campEtcKitPopUp">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>2인 세트</h2>
	   	             <span class="close" id="closePopup">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/campEtcKit.jsp"></jsp:include>
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


