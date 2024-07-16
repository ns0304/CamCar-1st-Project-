<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
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
.campSetPopUp2, .campSetPopUp3, .campSetPopUp4, .campEtcPopUp1, .campEtcPopUp2, .campEtcPopUp3
	, .campEtcPopUp4, .campEtcPopUp5, .campEtcPopUp6, .campEtcPopUp7
	, .basicPopUp1, .basicPopUp2, .basicPopUp3 {
    display: none;
    position: fixed;
    left: 50%;
    top: 40%;
    transform: translate(-50%, -50%);
    width: 900px;
    height: 600px;
    background-color: #fff;
    border: 1px solid #ccc;
    padding: 20px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    z-index: 1000;
	box-sizing: border-box;
    justify-content: center;
    align-items: center;
}

.popUpHeader {
	margin-bottom: 20px;  
	display: flex;
    justify-content: space-between;
}

.popUpHeader h2 {
	display:inline-block;
	float:left;
    margin: 0;
    font-size: 16px;
}

.popUpHeader .close {
	display:inline-block;
	float:right;
    cursor: pointer;
    font-size: 16px;
}

.popUpField { 
     margin: 1px 0;
     margin-bottom: 1px; 
     margin-top: 1px; 
     width: 100%;
     height: 100%;
     box-sizing: border-box;
/*      flex-wrap: wrap; */
     padding: 20px;
 } 
 
.popUpMessage {
	max-height: 600px;
	overflow-y: auto;
    box-sizing: border-box;
    display: flex;
    flex-wrap: wrap;
    height: 500px;
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
	  for (let i = 1; i <= 7; i++) {
	        // 팝업창 열기
	        $("#campingEtc" + i).click(function(event) {
	            event.preventDefault();
	            $(".campEtcPopUp" + i).show();
	        });

	        // 팝업창 닫기
	        $(".campEtcPopUp" + i + " .close" + i).click(function() {
	            $(".campEtcPopUp" + i).hide();
	        });
	    }	

	
	// 부가상품 기본 팝업창 1-3 열고 닫기
	  for (let i = 1; i <= 3; i++) {
 	        // 팝업창 열기
	        $("#basicBtn" + i).click(function(event) {
	            event.preventDefault();
	            $(".basicPopUp" + i).show();
	        });

	        // 팝업창 닫기
	        $(".basicPopUp" + i + " .close" + i).click(function() {
	            $(".basicPopUp" + i).hide();
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
			<form action="ReservationPay" name="reservation" method="post">
				<img src="${pageContext.request.servletContext.contextPath}/resources/img/campingcarImage.png" id="campingcarImage" height="120px">
					<div class="sideDiv">
						<ul></ul>
<!-- 						이름으로 바꿔야 함        -->
						<a>${sId}님의 여정</a>     
						<div class="clear">
							<a>
							<c:choose>
								<c:when test="${carDetail.brc_idx eq 5101}">--캠핑갈카 부산본점</c:when>
								<c:otherwise>--캠핑갈카 서울지점</c:otherwise>
							</c:choose>
							</a>
					          <hr>
							<a>${param.res_rental_date} ~ ${param.res_return_date}</a>
					          <hr>
							<a>${carDetail.car_model}</a>
						</div>
					</div>
					<div class="sideDiv">	
						운전자      
						<div class="clear">
							<a>${driver.dri_name}님</a><br>
							<hr>							
							<a>${driver.lic_info}</a>/<a>${driver.dri_birthday}</a>
						</div>
					</div>	
					<div class="sideDiv">	
						결제내역<br>
						표준가 <a>${param.rentalFee}</a>원
						<hr>
						보험료 <a>${param.insFee}</a>원
						<hr>
						총 결제금액 <a>${rentalInsFee}</a>원
					</div>	
						<input type="hidden" name="res_rental_date" value="${param.res_rental_date}">
						<input type="hidden" name="res_return_date" value="${param.res_return_date}">
						<input type="hidden" name="rentalFee" value="${param.rentalFee}">	
						<input type="hidden" name="car_idx" value="${param.car_idx}">					
						<input type="hidden" name="insFee" value="${param.insFee}">						
						<input type="hidden" name="rentalInsFee" value="${rentalInsFee}">						
					<div class="nextBtnArea">
						<button type="submit" id="nexBtn">다음</button>		
		          </div>
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

<!-- [ 캠핑 - 개별 - 퍼니처 ] -->
	    <div class="campEtcPopUp1">
	    	<div class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>퍼니처</h2>
	   	             <span class="close1" id="closePopup1">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/campEtcFur.jsp"></jsp:include>
		        </div>		        
	        </div>
	    </div>

<!-- [ 캠핑 - 개별 - 침낭/매트 ] -->
	    <div class="campEtcPopUp2">
	    	<div class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>침낭/매트</h2>
	   	             <span class="close2" id="closePopup2">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/campEtcBed.jsp"></jsp:include>
		        </div>		        
	        </div>
	    </div>

<!-- [ 캠핑 - 개별 - 화로/BBQ ] -->
	    <div class="campEtcPopUp3">
	    	<div class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>화로/BBQ</h2>
	   	             <span class="close3" id="closePopup3">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/campEtcFire.jsp"></jsp:include>
		        </div>		        
	        </div>
	    </div>

<!-- [ 캠핑 - 개별 - 키친 ] -->
	    <div class="campEtcPopUp4">
	    	<div class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>키친</h2>
	   	             <span class="close4" id="closePopup4">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/campEtcKit.jsp"></jsp:include>
		        </div>		        
	        </div>
	    </div>

<!-- [ 캠핑 - 개별 - 라이팅 ] -->
	    <div class="campEtcPopUp5">
	    	<div class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>라이팅</h2>
	   	             <span class="close5" id="closePopup5">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/campEtcLight.jsp"></jsp:include>
		        </div>		        
	        </div>
	    </div>

<!-- [ 캠핑 - 개별 - 계절용품 ] -->
	    <div class="campEtcPopUp6">
	    	<div class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>계절용품</h2>
	   	             <span class="close6" id="closePopup6">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/campEtcSeason.jsp"></jsp:include>
		        </div>		        
	        </div>
	    </div>

<!-- [ 캠핑 - 개별 - 기타 ] --> 
	    <div class="campEtcPopUp7">
	    	<div class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>기타</h2>
	   	             <span class="close7" id="closePopup7">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/campEtcEtc.jsp"></jsp:include>
		        </div>		        
	        </div>
	    </div>

<!-- [ 기본 - 카시트 ] --> 
	    <div class="basicPopUp1">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>카시트</h2>
	   	             <span class="close1" id="closePopup1">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/basicCarseats.jsp"></jsp:include>
		        </div>		        
	        </fieldset>
	    </div>

<!-- [ 기본 - 유모차 ] --> 
	    <div class="basicPopUp2">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>유모차</h2>
	   	             <span class="close2" id="closePopup2">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/basicStroller.jsp"></jsp:include>
		        </div>		        
	        </fieldset>
	    </div>

<!-- [ 기본 - 휠체어 ] --> 
	    <div class="basicPopUp3">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>휠체어</h2>
	   	             <span class="close3" id="closePopup3">&times;</span>
		        </div>
		        <div class="popUpMessage">
					<jsp:include page="/WEB-INF/views/reservation/addItemPopUp/basicWheelchair.jsp"></jsp:include>
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


