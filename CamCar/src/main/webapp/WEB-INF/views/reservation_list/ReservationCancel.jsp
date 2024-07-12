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
                <p>예약 번호: AAAD-75486451</p>
                <p>일시: 08.12(금) 15:00 ~ 08.13(화) 15:00</p>
                <p>부산</p>
                <p>차량: 스파크 1.0 가솔린</p>
                <p>2021년식 가솔린</p>
                <p>보험: 완전자차</p>
                <p>사고 시 고객 부담 금액</p>
            </div>
            <button class="complete-btn">예약완료</button>
        </div>

        <h2>필수 약관에 동의해 주세요</h2>
        <div class="agreement">
            <div class="warning">
                <p>취소 및 환불 규정을 꼭 확인해 주세요</p>
            </div>
            <div class="agreement-details">
                <p>예약 취소 및 위약금 규정을 안내해 드립니다.</p>
                <ul>
                    <li>대여시작 72시간 이내 취소 시 차량 대여료의 20% 위약금이 발생합니다.</li>
                    <li>대여시작 이후 취소 시 차량 대여료의 30% 위약금이 발생합니다.</li>
                    <li>대여시간 2시간 경과 시 No-show로 간주되어 예약이 자동 취소됩니다.</li>
                </ul>
            </div>
            <div class="additional-info">
                <div class="info-box">
                    <p>차량 대여료를 기준으로 위약금이 발생해요</p>
                </div>
                <div class="info-box">
                    <p>카드사 사정에 따라 환불금 입금까지 최대 7일이 소요될 수 있어요</p>
                </div>
            </div>
        </div>

        <div class="payment-info">
            <h3>결제내역</h3>
            <table>
                <tr>
                    <td>이미 결제한 금액</td>
                    <td>00000원</td>
                </tr>
                <tr>
                    <td>이미 결제한 금액</td>
                    <td>0원</td>
                </tr>
                <tr>
                    <td>이미 결제한 금액</td>
                    <td>12345원</td>
                </tr>
            </table>
        </div>

        <button class="cancel-btn">예약취소</button>
    </div>
    </section>
    
    <aside id="customer_container">
			<jsp:include page="/WEB-INF/views/inc/customer_center.jsp"></jsp:include>
	</aside>
    
</main>
    <!---------------------------------- 메인 끝 ----------------------------->
<footer>
	<!-- 회사 소개 영역 -->
	<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>