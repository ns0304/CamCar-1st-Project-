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
	min-height: 700px;
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
	        <input type="button" id="buttonA" width="500" value="단기렌터카 보험(차량손해 면책제도)에 대해 알고 싶어요.">
	        <br>
	        <div id="contentArea1"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>캠핑갈카는 모든 차량이 자동차 종합보험에 가입되어 있어요.<br><br><br>
				   완전자차 선택시 고객부담금이 면제돼요.
				   <보장범위><br><br>
				    - 대인(타인에게 손해를 입힌 경우)<br>
				      : 무한대<br><br>
				    - 대물(타인의 차량에 손해를 입힌 경우)<br>
				      : 건당 2천만원까지<br><br>
				    - 자손(나의 손해가 발생한 경우)<br>
				      : 인당 1천 5백만원까지
				   </p>
	    	</div>
	        <input type="button" id="buttonB" value="휴차보상료에 대해 알고 싶어요."><br>
	        <div id="contentArea2"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>보험(차량손해면책제도) 가입 유무와 관계없이 사고로 인해 차량이 휴차할 경우,<br><br>
				   수리 기간 동안 할인이 적용되지 않은 표준대여료(24시간 기준)의 50%에 해당하는 휴차보상료가 청구되며
				   이는 임차인이 배상해야 해요.<br><br>
				   (임대차 계약서 내 보험 보상 관련 약관에 따른 사항이에요.)<br><br>
				   <b>※ 완전자차 가입 시 휴차보상료를 면제해 드려요.</b><br>
				     &nbsp;&nbsp;&nbsp;
				   <b>단, ‘완전 자차’ 보험을 가입했어도 전손 처리 혹은 폐차 시 휴차보상료가 부과 돼요.</b> 
				   </p>
	    	</div>
	    </div>
	</section>
    <!-- 예약정보 선택 영역 -->
	<aside id="reservation_container">
		<jsp:include page="/WEB-INF/views/reservation/reservation.jsp"></jsp:include>
	</aside>
</main>
		<!-- 카카오톡 채팅 문의 -->	
	<aside class="chatBtn">
		<jsp:include page="/WEB-INF/views/kakaoLink.jsp"></jsp:include>
	</aside>

	<footer>
	<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
	<jsp:include page="/WEB-INF/views//inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>