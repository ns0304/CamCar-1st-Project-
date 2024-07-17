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
<script type="text/javascript"></script>
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
                <p><strong>홍길동</strong></p>
                <p>예약 번호 : ${resInfo.res_idx}</p>
                <p>일시 : ${resInfo.res_rental_date} ~ ${resinfo.res_return_date}</p>
                <p>지점 : ${resInfo.brc_rent_name}</p>
                <p>차량: ${carInfo.car_model}</p>
                <p>${carInfo.car_old}</p>
                <p>보험: ${resInfo.car_insurance}</p>
            </div>
            <button class="complete-btn" value="${payInfo.pay_status}"></button>
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
                    <td>${resInfo.res_fee}원</td>
                </tr>
                <tr>
                    <td>취소 수수료</td>
                    <td>${resInfo.res_fee}원</td>
                </tr>
                <tr>
                    <td>환불 예정 금액</td>
                    <td>12345원</td>
                </tr>
            </table>
        </div>
		<input type="button" class="calcelNo-btn" value="취소 안할래요" onclick="location.href='./'">
        <button class="cancel-btn">예약취소</button>
    </div>
    </section>
    
<!-- 고객센터로 이동 오른쪽 사이드 영역 -->
	<aside>
		   <!-- 오른쪽 사이드 영역 -->
		<div id="sideContent">
			<form action="ReservationFin" name="reservation" method="post">
				<img src="${pageContext.request.servletContext.contextPath}/resources/img/campingcarImage.png" id="campingcarImage" height="120px">
					<div class="sideDiv">
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
							<a>운전자이름</a><br>
							<hr>							
							<a>면허종류</a>/<a>생년월일</a>
						</div>
					</div>	
					<div class="sideDiv">	
						부가상품     
						<div class="clear">
							<a>부가상품분류명</a><br>
							<hr>
							<a>부가상품명1</a>/<a>세부이름</a><br>
							<a>부가상품명2</a>/<a>세부이름</a>
						</div>
					</div>	
					<div class="sideDiv">	
						결제내역<br>
						표준가<a>000</a>원
						<hr>
						보험료<a>000</a>원<br>
						 - 부가상품명1<a>000</a>원<br>		
						 - 부가상품명2<a>000</a>원<br>		
						<hr>
						부가상품대여료<a>000</a>원
						<hr>
						총 결제금액<a>000</a>원
					</div>	
						<input type="hidden" name="res_rental_date" value="${param.res_rental_date}">
						<input type="hidden" name="res_return_date" value="${param.res_return_date}">
						<input type="hidden" name="car_idx" value="${carDetail.car_idx}">					
					<div class="nextBtnArea">
						<button type="submit" id="nexBtn">다음</button>		
		          </div>			          
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