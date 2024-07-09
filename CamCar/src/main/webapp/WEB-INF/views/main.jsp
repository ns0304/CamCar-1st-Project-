<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>

</head>
<body>
	<header>
		<!-- 메뉴 -->
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<main>
		<section>
			<!-- 캠핑갈카 홍보 사진/일러스트 슬라이드 영역 -->
			<div class="SlideImg" align="center">
				<img src="${pageContext.request.servletContext.contextPath}/resources/img/main_slide/main_slide1.jpg" id="mainPageSlide">
				<p>캠핑갈카 홍보 사진/일러스트 슬라이드</p>
			</div>
			<!-- okokokkokok 차박 베스트 장소 이미지 슬라이드 영역 okokokkokok-->			
			<div class="bestplace_slide">
				<p class="main_tit">
					<em>캠핑갈카 추천 차박 베스트 장소</em>
				</p>
				<span>차박하러 떠나기 좋은 여행지를 추천해요</span>
				<div class="slideScope">
					<div class="slideData">
						<div class="slideBestImg">
							<img src="${pageContext.request.servletContext.contextPath}/resources/img/best_place/best_place1.jpg" id="bestImgSlide">
						</div>
						<div class="slideCont">
							<p class="subTit"></p>
							<p class="txt"></p>
						</div>
					</div>
				
				</div>
			</div>
			
			<!-- okokokkokok 자주 묻는 질문 영역 okokokkokok-->	
			<div id="mainQna">
				<h3 id="qna">자주 묻는 질문</h3>
<!-- 				임시 reservation 연결 -->
				<a href="reservation/reservation_final2.jsp" class="extra">reservation_final2</a>
				<a href="reservation/reservation_final3.jsp" class="extra">reservation_final3</a>
				<a href="reservation/reservation_final4.jsp" class="extra">reservation_final4</a>
				<a href="reservation/reservation_final5.jsp" class="extra">reservation_final5</a>
				
<!-- 				임시 reservation 연결 -->
				
				<div id="qnaContent">
					<a href="Question_reserve" id="qnaContent1">렌터카 이용 중 반납시간을 연장하고 싶어요</a><hr>
					<a href="Question_reserve" id="qnaContent2">예약 취소나 노쇼(No-show)시, 수수료는 얼마나 부과되나요</a><hr>
					<a href="Question_reserve" id="qnaContent3">일정이 변경되어 예약을 변경하고 싶어요</a>
				</div>
			</div>
		</section>
	
		<!-- 예약정보 선택 영역 -->
		<aside id="reservation_container">
			<jsp:include page="/WEB-INF/views/reservation/reservation.jsp"></jsp:include>
		</aside>
	</main>


	<!-- 캠핑갈카 홍보 사진/일러스트 슬라이드 구현 -->
 
	<script type="text/javascript">
		// [ 이미지 슬라이드 구하기 ]
		// 1. 사용할 이미지 파일(1.jpg, 2.jpg, 3.jpg)을 배열에 저장
		let imgArr = ["1.jpg", "2.jpg", "3.jpg"];
		
		// 2. 배열의 인덱스로 활용할 변수 선언
		let index = 1;
		
		// 3. 3초마다 실행할 익명함수 정의
		setInterval(function() {
			// 4. 이미지 교체
			// id 선택자 "img" 인 요소 객체의 src 속성값 변경
			// => 이 때, 배열에 이미지 목록이 저장되어 있으며 인덱스 변수(index)를 활용
			document.querySelector("#mainPageSlide").src = "${pageContext.request.servletContext.contextPath}/resources/img/main_slide/main_slide" + imgArr[index];
			
			// 5. index 번호 1 증가
			index++;
// 			console.log(index);
			
			// 6. 마지막 이미지까지 표시 후 다시 처음 이미지로 돌아가기
			// => 마지막 이미지의 인덱스는 변할 수 있으므로 배열명.length 활용
			if(index ==imgArr.length) {
				// 처음 이미지로 돌아가기 위해 인덱스를 0으로 초기화
				index = 0;
			}
			
		}, 3000);
	</script>
		<!-- okokokkokok 차박 베스트 장소 이미지 슬라이드 구현 okokokkokok-->	
	<script type="text/javascript">
		let bestImgArr = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"];
		let index2 = 1;
		setInterval(function() {
			document.querySelector("#bestImgSlide").src = "${pageContext.request.servletContext.contextPath}resources/img/best_slide/best_slide" + bestImgArr[index];
			index2++;
			if(index2 == bestImgArr.length) {
				index2 = 0;
			}
		}, 1000);	
	
	</script>
	
	<!-- 카카오톡 1:1문의하기 -->
<!-- 	<div id="kakaotalk"> -->
<!-- 		<a href="">&#128488;</a> -->
<!-- 	</div> -->


	<!-- okokokkokok 카카오톡 1:1문의하기 okokokkokok-->		
	<div class="chatCont">
		<div class="chatBtn">
			<a>
				1:1<br>
				문의
			</a>
		</div>
	</div>
	
	<footer>
		<!-- 회사 소개 영역 -->
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
