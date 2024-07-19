<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<%-- 
<style>
        #contentArea {
            display: none; /* Hidden by default */
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }
</style>
--%>
<%-- 
<script>
        document.getElementById('button1').addEventListener('click', function() { // addEventListener은 onclick과 달리 
            var content = document.getElementById('contentArea');
            if (content.style.display === 'none') {
                content.style.display = 'block'; // Show content
            } else {
                content.style.display = 'none'; // Hide content
            }
        });
    </script>
--%>
<style>
body {
    font-family: Arial, sans-serif;
}

#div01, #div02, #div03 {
    margin-bottom: 30px;
    wi
}

#div01 input[type="button"] {
	width: 20%;
}

#div01 h2 {
    margin-bottom: 10px;
}

#freQna {
    display: flex;
    justify-content: space-around;
}

#div02 {
    margin-bottom: 20px;
    font-size: 1.1em;
    color: #555;
}

#div03 input[type="button"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    background-color: #F0F0F0;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#div03 input[type="button"]:hover, #div01 input[type="button"]:hover {
    color: white;
    background-color: #59b9a9;
}

.contentArea {
    display: none;
    margin-top: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.contentArea p {
    margin: 0;
    color: #333;
}
main>section {
	height: 700px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	// 각 지점 버튼 클릭 시 상세설명(레이어팝업) 열림/닫힘
	$("#buttonA").click(function() {
		$("#contentArea1").toggle();
	});
	$("#buttonB").click(function() {
		$("#contentArea2").toggle();
	});
	$("#buttonC").click(function() {
		$("#contentArea3").toggle();
	});
	$("#buttonD").click(function() {
		$("#contentArea4").toggle();
	});
	$("#buttonE").click(function() {
		$("#contentArea5").toggle();
	});
	$("#buttonF").click(function() {
		$("#contentArea6").toggle();
	});
});


</script>

</head>

<body>
<header>
	<%-- top.jsp 페이지를 현재 페이지에 삽입 --%>
	<jsp:include page="/WEB-INF/views//inc/top.jsp"></jsp:include>
</header>
<main>
	<section>
		<div align="left" id="div01">
			<h2>자주 찾는 질문</h2>
			<input type="button" value="예약 / 변경" onclick="location.href='Question_reserve'">
			<input type="button" value="운전자" onclick="location.href='Question_drivers'">
			<input type="button" value="보험" onclick="location.href='Question_insurance'">
			<input type="button" value="고장 / 사고" onclick="location.href='Question_accident'">
		</div>
		<div align="left" id="div02">자주 찾는 질문들을 모아봤어요</div>
		<div id="div03" align="left">
	        <input type="button" id="buttonA" width="500" value="운전면허 분실 시 차량 대여가 불가한가요?">
	        <br>
	        <div id="contentArea1"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>홈페이지에서 예약 후 운전면허증을 분실하신 경우 출차 시<br>
				   아래의 본인 확인 절차(택1)를 거친 후 차량 대여가 가능해요.<br><br>
				   - 182(경찰민원콜센터)를 통해 수신한 문자(면허정보)를 신분증과 함께 제시<br>
				   - 민원 24(앱)를 통해 조회된 면허정보를 신분증과 함께 제시<br>
				   - IC 모바일 면허증 또는 PASS앱 모바일 면허증 제시<br><br><br>
				   ※ 유선(전화) 예약이나 지점 방문 예약 시에는 반드시 재발급 후 실물 운전면허증을 지참해 주세요.
				   </p>
	    	</div>
	        <input type="button" id="buttonB" value="운전자 추가 등록(제2,3 운전자)은 어떻게 하나요?"><br>
	        <div id="contentArea2"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>예약 상세 페이지에서 '운전자 추가 등록하기' URL을 보내 운전자 등록을 요청할 수 있어요.<br>
				   등록이 필요한 분의 휴대폰 번호를 입력하면, 자동으로 카카오 알림톡이 발송돼요.<br>
				   받는 분이 추가 운전자 정보를 입력하면, 예약자분도 예약상세 페이지에서 추가된 정보를 확인할 수 있어요.<br><br><br>
				   ① 메인 상단 '예약확인' 클릭 ▶ ② 회원로그인(비회원일 경우, '비회원 예약확인' 클릭) ▶ ③예약내역 ▶ ④내 예약 ▶ ⑤예약<br>
				   상세 內 '운전자 추가' 클릭▶ ⑥운전자 추가를 요청할 휴대폰 번호 입력 후 URL 보내기
				   </p>
	    	</div>
	        <input type="button" id="buttonC" value="대여 자격 조건은 어떻게 되나요?"><br>
	        <div id="contentArea3"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>차량별 대여 자격이 다르니 꼭 확인해주세요.<br><br>
				  <b><9인승 이하 내연차 및 일반 EV></b><br>
				   - 만 21세 이상<br>
				   - 2종 보통면허 이상, 운전경력 1년 이상<br><br>
				   <b><11인승 이상 내연차></b><br>
				   - 만 26세 이상<br>
				   - 1종 보통면허 이상, 운전경력 3년 이상<br><br>
				   <b><캠핑카></b><br>
				   - 11인승 이하의 일체형 캠핑카의 경우 2종 면허로 운행이 가능합니다.<br>
				   - 11인승 이상의 일체형 캠핑카의 경우 1종 면허로 운행이 가능합니다.
				   </p>
	    	</div>
	    </div>
	</section>
    <!-- 예약정보 선택 영역 -->
	<aside id="reservation_container">
		<jsp:include page="/WEB-INF/views/reservation/reservation.jsp"></jsp:include>
	</aside>
</main>
	

	<footer>
	<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
	<jsp:include page="/WEB-INF/views//inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>