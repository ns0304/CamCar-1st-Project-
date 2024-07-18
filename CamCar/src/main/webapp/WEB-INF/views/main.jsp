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
<script type="text/javascript">
$(document).ready(function() {
    let slideIndex = 1;
    showSlides(slideIndex);

    // Attach functions to the window object to make them globally accessible
    window.plusSlides = function(n) {
        showSlides(slideIndex += n);
    }

    window.currentSlide = function(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        if (n > slides.length) {
            slideIndex = 1;
        }
        if (n < 1) {
            slideIndex = slides.length;
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
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
		<section>
			<!-- 캠핑갈카 홍보 사진/일러스트 슬라이드 영역 -->
			<div class="SlideImg clear" align="center" >
				<img src="${pageContext.request.servletContext.contextPath}/resources/img/main_slide/main_slide1.png" id="mainPageSlide">
			</div>
			<!--  차박 베스트 장소 이미지 버튼 슬라이드 영역 -->	
			<br>	
			<h3 id="qna">차박 베스트 장소를 <a style="color: #59b9a9;">추천</a>해드릴게요!</h3>
			<span style="margin-bottom: 20px;"  class="blink">캠핑갈카와 함께라면 즐거움이 &#9996;배</span>
			<div id="bestCarPlacePlease">	
				<div class="slideshow-container">
				  <div class="mySlides fade">
				    <div class="numbertext">1 / 3</div>
				    <a href="Service#place1"><img src="${pageContext.request.servletContext.contextPath}/resources/img/service/녹산고향동산.png" style="width:100%" ></a>
				    <div class="text">녹산고향동산 - 시원한 강뷰와 넓은 들판에서</div><br>
				  </div>
				
				  <div class="mySlides fade">
				    <div class="numbertext">2 / 3</div>
				    <a href="Service#place2"><img src="${pageContext.request.servletContext.contextPath}/resources/img/service/다대포해수욕장.jpg" style="width:100%"></a>
				    <div class="text">동백방파제 - 쾌적하고 탁 트인 방파제에서</div><br>
				  </div>
				
				  <div class="mySlides fade">
				    <div class="numbertext">3 / 3</div>
				    <a href="Service#place3"><img src="${pageContext.request.servletContext.contextPath}/resources/img/service/삼락생태공원.jpg" style="width:100%"></a>
				    <div class="text">삼락생태공원 - 향기로운 꽃과 함께</div><br>
				  </div>
				
				  <!-- Next and previous buttons -->
				  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				  <a class="next" onclick="plusSlides(1)">&#10095;</a>
				</div>
				<br>
				
				<!-- The dots/circles -->
				<div style="text-align:center">
				  <span class="dot" onclick="currentSlide(1)"></span>
				  <span class="dot" onclick="currentSlide(2)"></span>
				  <span class="dot" onclick="currentSlide(3)"></span>
				</div>
			</div>
<!--      <div class="bestplace_slide"> -->
<!--             <p class="main_tit"> -->
<!--                 캠핑갈카 추천 차박 베스트 장소 -->
<!--             </p> -->
<!--             <span id="bestPlaceCar">차박하러 떠나기 좋은 여행지를 추천해요</span> -->
<!--             <div class="slideScope"> -->
<!--                 <div class="slideData"> -->
<!--                     <div class="slideBestImg"> -->
<%--                         <a href="Service"><img src="${pageContext.request.servletContext.contextPath}/resources/img/service/녹산고향동산.png" id="bestImgSlide"></a> --%>
<!--                     </div> -->
<!--                     <div class="slideCont"> -->
<!--                         <p class="subTit">녹산고향동산</p> -->
<!--                         <p class="txt">시원한 강뷰와 넓은 들판에서의 차박</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="slideData"> -->
<!--                     <div class="slideBestImg"> -->
<%--                         <a href="Service"><img src="${pageContext.request.servletContext.contextPath}/resources/img/service/다대포해수욕장.jpg" id="bestImgSlide"></a> --%>
<!--                     </div> -->
<!--                     <div class="slideCont"> -->
<!--                         <p class="subTit">동백방파제</p> -->
<!--                         <p class="txt">쾌적하고 편한 방파제 차박</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="slideData"> -->
<!--                     <div class="slideBestImg"> -->
<%--                         <a href="Service"><img src="${pageContext.request.servletContext.contextPath}/resources/img/service/삼락생태공원.jpg" id="bestImgSlide"></a> --%>
<!--                     </div> -->
<!--                     <div class="slideCont"> -->
<!--                         <p class="subTit">삼락생태공원</p> -->
<!--                         <p class="txt">다양한 꽃들을 볼 수 있는 차박</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <button class="arrow left" id="arrowLeft" >&#10094;</button> -->
<!--             <button class="arrow right" id="arrowRight" >&#10095;</button> -->
<!--         </div> -->
			
			<!-- okokokkokok 자주 묻는 질문 영역 okokokkokok-->	
			<div id="mainQna">
				<h3 id="qna">자주 묻는 질문을 모아봤어요</h3>
				<a href="Question_reserve" id="mainQnaMore">전체보기</a>
				<div id="qnaContent" class="clear">
		        <input type="button" id="buttonE" value="렌터카 예약방법 및 절차가 궁금해요."><br>
			        <div id="contentArea5"  class="contentArea">
			        <!-- Pre-written content that will be displayed when Button A is clicked -->
			        	<p>아래 경로로 예약해 보세요.<br>
						   캠핑갈카 회원 가입 후 예약하면 추가 할인을 받을 수 있으니 참고하세요.<br><br><br>
						   ①메인에서 장소, 일시, 차량 선택▶ ② 검색결과 확인▶ ③ 우측 상단 검색필터 적용(차종, 연료, 제조사 등) ▶ ④ 차량상세 정보 확인 후 예약▶⑤ 로그인 후, 회원가 적용 받기 ▶ ⑥ 보험선택 ▶ ⑦ 운전자 정보 입력▶ ⑧ 결제하기 ▶ ⑨ 예약완료
						   </p>
			    	</div>
		        <input type="button" id="buttonB" value="렌터카 이용중 반납시간을 연장하고 싶어요."><br>
			        <div id="contentArea2"  class="contentArea">
			        <!-- Pre-written content that will be displayed when Button A is clicked -->
			        	<p>캠핑갈카 사이트에서 차량 이용중 반납시간 연장이 가능해요.<br><br><br>
						   ① 메인 상단 ‘예약확인’ 클릭 ▶ ② 회원로그인(비회원일 경우, '비회원 예약확인' 클릭) ▶ ③내 예약 클릭 ▶ ④예약 상세에서 '대여연장' 클릭</p>
			    	</div>
				</div>
		        <input type="button" id="buttonC" value="대여 자격 조건은 어떻게 되나요?"><br>
			        <div id="contentArea3"  class="contentArea">
			        <!-- Pre-written content that will be displayed when Button A is clicked -->
			        	<p>차량별 대여 자격이 다르니 꼭 확인해주세요.<br><br>
						  <b>9인승 이하 내연차 및 일반 EV</b><br>
						   - 만 21세 이상<br>
						   - 2종 보통면허 이상, 운전경력 1년 이상<br><br>
						   <b>11인승 이상 내연차</b><br>
						   - 만 26세 이상<br>
						   - 1종 보통면허 이상, 운전경력 3년 이상<br><br>
						   <b>캠핑카</b><br>
						   - 11인승 이하의 일체형 캠핑카의 경우 2종 면허로 운행이 가능합니다.<br>
						   - 11인승 이상의 일체형 캠핑카의 경우 1종 면허로 운행이 가능합니다.
						   </p>
			    	</div>
   		        <input type="button" id="buttonA" width="500" value="단기렌터카 보험(차량손해 면책제도)에 대해 알고 싶어요."><br>
			        <div id="contentArea1"  class="contentArea">
			        	<p>캠핑갈카는 모든 차량이 자동차 종합보험에 가입되어 있어요.<br><br><br>
						   완전자차 선택시 고객부담금이 면제돼요.<br>
						   보장범위<br><br>
						    - 대인(타인에게 손해를 입힌 경우)<br>
						      : 무한대<br><br>
						    - 대물(타인의 차량에 손해를 입힌 경우)<br>
						      : 건당 2천만원까지<br><br>
						    - 자손(나의 손해가 발생한 경우)<br>
						      : 인당 1천 5백만원까지
						   </p>
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
		let imgArr = ["1.png", "2.png", "3.jpg"];
		
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
			
		}, 5000);
		
		<!-- 차박 베스트 장소 이미지 슬라이드 구현 -->	
// 		let bestImgArr = ["녹산고향동산.png", "다대포해수욕장.jpg", "동백방파제.png", "문동방파제.jpg", "삼락생태공원.jpg"];
// 		let index2 = 1;
// 		setInterval(function() {
// 			document.querySelector("#bestImgSlide").src = "${pageContext.request.servletContext.contextPath}/resources/img/service/" + bestImgArr[index];
// 			index2++;
// 			if(index2 == bestImgArr.length) {
// 				index2 = 0;
// 			}
// 		}, 5000);	

//         let slideIndex = 0;
//         const slides = document.querySelectorAll('.slideData');

//         function showSlide(index) {
//             const slideScope = document.querySelector('.slideScope');
//             slideIndex = index;
//             if (slideIndex >= slides.length) slideIndex = 0;
//             if (slideIndex < 0) slideIndex = slides.length - 1;
//             slideScope.style.transform = `translateX(${-slideIndex * 100}%)`;
//         }

//         function nextSlide() {
//             showSlide(slideIndex + 1);
//         }

//         function prevSlide() {
//             showSlide(slideIndex - 1);
//         }
	
	</script>
	
<script type="text/javascript">
	$(document).ready(function() {
		$("#buttonB").click(function() {
			$("#contentArea2").toggle();
		});
		$("#buttonE").click(function() {
			$("#contentArea5").toggle();
		});
		$("#buttonC").click(function() {
			$("#contentArea3").toggle();
		});
		$("#buttonA").click(function() {
			$("#contentArea1").toggle();
		});
	});
	
</script>
	<!-- 카카오톡 1:1문의하기 -->
<!-- 	<div id="kakaotalk"> -->
<!-- 		<a href="">&#128488;</a> -->
<!-- 	</div> -->

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
