<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 취소 페이지</title>
<link rel="stylesheet" href="styles.css">
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/res_confirm.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/ReservationCancel.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	
// 	$(document).ready(function() {
// 		// 취소 수수료 계산하는 함수
// 		function calculateFee() {
// 			let now = new Date();
// 			let rentalDate = new Date(${ReserveCancel[0].res_rental_date});
// 			let nowTime = now.getTime(); // 오늘 날짜를 (1970년 기준)밀리초 단위로 리턴
// 			let rentalTime = rentalDate.getTime();
			
// 			// 밀리초 단위 값을 시간 단위로 변환하여 두 날짜간의 차이 계산
// 			let differenceTime = (nowTime - rentalTime) / 1000 / 60 / 60 ;
			
// 			// 소수점(실수 부분) 절삭(반올림)을 위해 Math객체의 round() 메서드 활용
// 			differenceTime = Math.round(differenceTime);
// 			console.log("오늘 날짜 - 대여일시 : " + differenceTime);
			
// 			if(differenceTime >= 72) { // 대여시작 72시간 이전 취소할 경우
// 				$("#cancelFee").text("0");
// 				return;
// 			} else if(differenceTime < 72 && differenceTime > 0) {	// 대여시작 72시간 이내 취소할 경우
// 				let cancelFee = ${ReserveCancel[0].pay_total} * 0.2;
// 				$("#cancelFee").text(cancelFee);
// 				return;
// 			} else {
// 				let cancelFee = ${ReserveCancel[0].pay_total} * 0.3;
// 				$("#cancelFee").text(cancelFee);
// 			}
			
// 		}
		
// 		calculateFee();
// 	});
	
	
	
</script>
</head>
<body>
<header>
	<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
	<%-- 현재 위치는 컨텍스트 루트(/MVC_Board = webapp) 이므로 inc 디렉토리의 top.jsp 지정 --%>
	<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
</header>
<main>
	<section>

    <div class="container">
        <h2>상세내역</h2>
        <div class="details">
            <div class="section">
            	<div>
	                <p>예약 번호 : ${ReserveCancel[0].res_idx}</p>
	                <p>차량: ${ReserveCancel[0].car_model}</p>
	                <p>
	                <script>
						// 날짜 문자열을 불러옴.
						var rentalDate = "${ReserveCancel[0].res_rental_date}";
						var returnDate = "${ReserveCancel[0].res_return_date}";
						
						// T 문자를 공백으로 대체.
						rentalDate = rentalDate.replace('T',' ');
						returnDate = returnDate.replace('T',' ');
						
						// 결과를 출력.
						document.write(rentalDate + " ~ " + returnDate);
						console.log("rentalDate + ' ~ ' + returnDate");
					</script> 
	                </p>
	                <p>보험: ${ReserveCancel[0].car_insurance}</p>
                </div>
	            <div align="right">
	            	<img src="${pageContext.request.servletContext.contextPath}/resources/upload/${ReserveCancel[0].car_model_image}" width="200px" >
	            </div>
            </div>
        </div>

        <h2>필수 약관에 동의해 주세요</h2>
        <div class="agreement">
            <div class="warning">
                <h4>취소 및 환불 규정을 꼭 확인해 주세요</h4>
            </div>
            <div class="agreement-details">
                <b><p>예약 취소 및 위약금 규정을 안내해 드립니다.</p></b>
                <ul>
                    <li>대여시작 72시간 이내 취소 시 차량 대여료의 20% 위약금이 발생합니다.</li>
                    <li>대여시작 이후 취소 시 차량 대여료의 30% 위약금이 발생합니다.</li>
                    <li>대여시간 2시간 경과 시 No-show로 간주되어 예약이 자동 취소됩니다.</li>
                </ul>
            </div>
            <div class="additional-info">
                <div class="info-box">
                    <li>차량 대여료를 기준으로 위약금이 발생해요</li>
                </div>
                <div class="info-box">
                    <li>카드사 사정에 따라 환불금 입금까지 최대 7일이 소요될 수 있어요</li>
                </div>
            </div>
        </div>

        <div class="payment-info">
            <h3>결제내역</h3>
            <table>
                <tr>
                    <td>이미 결제한 금액</td>
                    <td>${ReserveCancel[0].pay_total}원</td>
                </tr>
                <tr>
                    <td>취소 수수료</td>
                    	<p id="cancelFee">${cancelFee}원</p>
<%--                     <td>${ReserveCancel[0].cancel_fee}원</td> --%>
                </tr>
                <tr>
                    <td>환불 예정 금액</td>
                    <td>12345원</td>
                </tr>
            </table>
        </div>
        <div align="center">
<!-- 		<input type="button" class="calcelNo-btn" value="취소 안할래요" onclick="location.href='./'"> -->
        	<button class="cancel-btn" style="background-color: #ccc;" onclick="location.href='./'">취소 안할래요</button>
        	<button class="cancel-btn">예약취소</button>
        </div>
    </div>
    </section>
    
	<aside>
		   <!-- 오른쪽 사이드 영역 -->
		<div id="sideContent">
			<form action="ReservationFin" name="reservation" method="post">
				<img src="${pageContext.request.servletContext.contextPath}/resources/upload/${ReserveCancel[0].car_model_image}" width="250px" >	
					<div class="sideDiv">
						<a><b>${ReserveCancel[0].mem_name}</b> 님의 여정</a><br>
						 <br>    
						<div class="clear">
							<a>
								<b>${ReserveCancel[0].brc_name}</b>
							</a>
				          	<hr>
							<a> <b>대여일시 :</b> 
								<script>
									// 날짜 문자열을 불러옴.
									var rentalDate = "${ReserveCancel[0].res_rental_date}";
									var returnDate = "${ReserveCancel[0].res_return_date}";
	
									// T 문자를 공백으로 대체.
									rentalDate = rentalDate.replace('T', ' ');
									returnDate = returnDate.replace('T', ' ');
	
									// 결과를 출력.
									document.write(rentalDate);
									console.log("rentalDate + ' ~ ' + returnDate");
								</script><br>
								<b>반납일시 :</b> <script>document.write(returnDate);</script>
							</a>
							<hr>
						</div>
					</div>
					<div class="sideDiv">	
						<b><a>
						${ReserveCancel[0].car_model}<br>
						${ReserveCancel[0].car_old}
						</a></b>
					<hr>							
					</div>	
					
						<input type="hidden" name="res_rental_date" value="${ReserveCancel[0].res_rental_date}">
						<input type="hidden" name="res_return_date" value="${ReserveCancel[0].res_return_date}">
						<input type="hidden" name="car_idx" value="${ReserveCancel[0].car_idx}">					
			</form>
		</div>
	</aside>
</main>
    <!---------------------------------- 메인 끝 ----------------------------->
    
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