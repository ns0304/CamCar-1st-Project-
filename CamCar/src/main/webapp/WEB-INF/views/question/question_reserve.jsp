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
</style>
</head>
<body>
<header>
	<%-- top.jsp 페이지를 현재 페이지에 삽입 --%>
	<jsp:include page="/WEB-INF/views//inc/top.jsp"></jsp:include>
</header>

	<div align="left" id="div01">
		<h2>자주 찾는 질문</h2>
		<input type="button" id="button1" value="예약하기">
		<input type="button" value="예약확인 / 변경">
		<input type="button" value="보험">
		<input type="button" value="고장 / 사고">
	</div>
	<div align="left" id="div02">자주 찾는 질문들을 모아봤어요</div>
	<div id="div03" align="left">
        <input type="button" id="buttona" width="500" value="일정이 변경되어 예약을 변경하고 싶어요."
        	onclick="location.href='Question_reserve_answer'">
        <br>
        <input type="button" id="buttonb" value="렌터카 이용중 반납시간을 연장하고 싶어요."><br>
        <input type="button" id="buttonc" value="예약 시 차량정보(연식, 주요옵션)를 확인할 수 있나요?"><br>
        <input type="button" id="buttond" value="예약확인 및 예약취소는 어떻게 하나요?"><br>
        <input type="button" id="buttone" value="렌터카 예약방법 및 절차가 궁금해요."><br>
        <input type="button" id="buttonf" value="예약취소나 노쇼(No-show)시, 수수료는 얼마나 부과되나요?">
    </div>
	

	<footer>
	<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
	<jsp:include page="/WEB-INF/views//inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>