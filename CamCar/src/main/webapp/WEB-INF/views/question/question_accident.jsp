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
#div01 {
	margin-bottom: 30px;
}

#div02 {
	margin-bottom: 20px;
}

#div03>input {
	margin-bottom: 13px;
	padding-left: 20px;
}

#buttona {
	padding-right: 150px;
}
#buttonb {
	padding-right: 137px;
}
#buttonc {
	padding-right: 74px;
}
#buttond {
	padding-right: 160px;
}
#buttone {
	padding-right: 176px;
}
#buttonf {
	padding-right: 40px;
}	
.contentArea {
    display: none; /* Hidden by default */
    margin-top: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
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
	        <input type="button" id="buttonA" width="500" value="긴급출동은 어떤 서비스를 제공하나요?">
	        <br>
	        <div id="contentArea1"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>아래 상황에서는 사고접수 대신 긴급출동으로 접수해 주세요.<br>
				   - 단기 렌트 : 타이어 펑크, 배터리 방전, 연료 부족<br>
				   - 장기 렌트 : 타이어 펑크, 배터리 방전, 연료 부족, 자동차키 분실<br><br>
				   <b>※ 온라인 접수가 어려운 상황이라면, 캠핑갈카 고객센터 1599-9111로 전화 후 '2번 →1번 긴급출동'을 눌러 접수할 수 있어요!</b>
				   </p>
	    	</div>
	        <input type="button" id="buttonB" value="사고접수는 어떻게 하나요?"><br>
	        <div id="contentArea2"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>캠핑갈카는 24시간 사고접수가 가능한 고객센터를 운영 중입니다.<br><br>
				   [사고접수방법]
				   1599-9111로 전화 후 1번 누르시면 상담사를 통해 사고접수를 할 수 있어요
				   </p>
	    	</div>
	        <input type="button" id="buttonC" value="사고 시 면책금은 얼마인가요?"><br>
	        <div id="contentArea3"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>캠핑갈카는 모든 차량이 자동차 종합보험에 가입되어 있어요.<br>
	        		완전자차 선택시 고객부담금이 면제돼요.<br><br>
				   <보장범위><br><br>
				    - 대인(타인에게 손해를 입힌 경우)<br>
				      : 무한대<br><br>
				    - 대물(타인의 차량에 손해를 입힌 경우)<br>
				      : 건당 2천만원까지<br><br>
				    - 자손(나의 손해가 발생한 경우)<br>
				      : 인당 1천 5백만원까지
				   </p>
	    	</div>
	        <input type="button" id="buttonD" value="사고 시 수리 절차가 궁금해요."><br>
	        <div id="contentArea4"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>①사고접수 (고객센터 : 051-9789-3772) ▶② 지정 정비업체 입고 ▶③수리 기간 안내 및 수리 진행<br>
				   ▶④면책금 납부 확인▶ ⑤차량 수리 완료 및 고객인도<br><br>
				   ※ 면책금 미납부시 출고 진행이 어려워요.<br>
				   ※ 면책금은 가입하신 차량손해면책제도에 따릅니다.<br><br>
				   - 수리비용이 면책금 이상일 경우 → 면책금액 납부<br>
				   - 수리비용이 면책금 미만일 경우 → 수리비용 실비 납부<br><br>
				   ※교통법규 위반, 운전자 범위 위반, 음주운전 등으로 인해 사고발생 시 보상이 제한돼요.
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