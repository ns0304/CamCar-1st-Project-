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
			<div id="freQna">
				<input type="button" id="button1" value="예약 / 변경" onclick="location.href='Question_reserve'">
				<input type="button" value="운전자" onclick="location.href='Question_drivers'">
				<input type="button" value="보험" onclick="location.href='Question_insurance'">
				<input type="button" value="고장 / 사고" onclick="location.href='Question_accident'">
			</div>
		</div>
		<div align="left" id="div02">자주 찾는 질문들을 모아봤어요</div>
		<div id="div03" align="left">
	        <input type="button" id="buttonA" width="500" value="일정이 변경되어 예약을 변경하고 싶어요.">
	        <br>
	        <div id="contentArea1"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>캠핑갈카 사이트에서 예약변경이 가능합니다.<br><br><br>
				   ① 메인 상단 ‘예약확인’ 클릭 ▶ ② 회원로그인(비회원일 경우, '비회원 예약확인' 클릭) ▶ ③내 예약 클릭 ▶ ④예약 상세에서 '예약변경' 클릭</p>
	    	</div>
	        <input type="button" id="buttonB" value="렌터카 이용중 반납시간을 연장하고 싶어요."><br>
	        <div id="contentArea2"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>캠핑갈카 사이트에서 차량 이용중 반납시간 연장이 가능해요.<br><br><br>
				   ① 메인 상단 ‘예약확인’ 클릭 ▶ ② 회원로그인(비회원일 경우, '비회원 예약확인' 클릭) ▶ ③내 예약 클릭 ▶ ④예약 상세에서 '대여연장' 클릭</p>
	    	</div>
	        <input type="button" id="buttonC" value="예약 시 차량정보(연식, 주요옵션)를 확인할 수 있나요?"><br>
	        <div id="contentArea3"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>렌터카 예약 시, 차량 상세 정보에서 확인할 수 있어요.<br><br>
				   원하시는 대여일시/지역을 먼저 선택 후, 조회되는 차량을 클릭해 보세요.<br><br>
				   연식 및 주요 차량옵션(후방카메라, 블루투스, 내비게이션), 적재 및 장착공간 정보(골프백, 유모차), 승차인원, 운전자격까지 확인할 수 있어요.
				   </p>
	    	</div>
	        <input type="button" id="buttonD" value="예약확인 및 예약취소는 어떻게 하나요?"><br>
	        <div id="contentArea4"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>캠핑갈카 사이트 [예약상세]에서 예약확인 및 예약취소가 가능해요.<br><br><br>
				   ① 메인 상단 '예약확인' 클릭 ▶ ② 회원로그인(비회원일 경우, '비회원 예약확인' 클릭) ▶ ③예약내역 ▶ ④내 예약 클릭 ▶ ⑤예약 상세에서 예약 내용 확인 or '예약취소' 진행</p>
	    	</div>
	        <input type="button" id="buttonE" value="렌터카 예약방법 및 절차가 궁금해요."><br>
	        <div id="contentArea5"  class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>아래 경로로 예약해 보세요.<br>
				   캠핑갈카 회원 가입 후 예약하면 추가 할인을 받을 수 있으니 참고하세요.<br><br><br>
				   ①메인에서 장소, 일시, 차량 선택▶ ② 검색결과 확인▶ ③ 우측 상단 검색필터 적용(차종, 연료, 제조사 등) ▶ ④ 차량상세 정보 확인 후 예약▶⑤ 로그인 후, 회원가 적용 받기 ▶ ⑥ 보험선택 ▶ ⑦ 운전자 정보 입력▶ ⑧ 결제하기 ▶ ⑨ 예약완료
				   </p>
	    	</div>
	        <input type="button" id="buttonF" value="예약취소나 노쇼(No-show)시, 수수료는 얼마나 부과되나요?">
	        <div id="contentArea6" class="contentArea">
	        <!-- Pre-written content that will be displayed when Button A is clicked -->
	        	<p>취소시간에 따라 수수료가 달라져요.<br><br>
				   <내륙><br>
				   - 출발 24시간 이전: 전액환불<br>
				   - 노쇼(No-show): 대여료의 90% 환불<br>
				   ※ 대여시간 2시간 경과 시 예약이 임의로 취소되니, 도착이 늦으시면 꼭 연락주세요.
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