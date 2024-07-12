<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/res_confirm.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/MVC_Board = webapp) 이므로 inc 디렉토리의 top.jsp 지정 --%>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<div class="OuterBox" align="center">
	<main>
		<section>
		<div align="center" class="myPageBox">
			<div class="header">
				<h1>마이페이지</h1>
				<button class="myInfoManagement" id="myInfo" onclick="location.href='myInfo'">내 정보 관리</button>
			</div>
			<section class="resSection" >
				<h2>예약내역</h2>
				<div class="reservationList">
					<div class="resCarImage">
						<img src="${pageContext.request.servletContext.contextPath}/resources/images/1그랜저.png" width="300px" height="300px" alt="Car Image">
					</div>
					<div class="reservationInfo">
						<h3>쉐보레 스파크 1.0 가솔린</h3>
						 <button class="detailsBtn" onclick="location.href='ReservationDetail'">예약 상세 보기</button>
						 <p>예약 번호: AAAD-75486451</p>
                         <p>부산</p>
                         <p>08.12(금) 15:00 ~ 08.13(토) 15:00</p>
                         <div class="pageDots">
                         	<span class="dot"></span>
                         	<span class="dot"></span>
                         	<span class="dot"></span>
                         	<span class="dot"></span>
                         </div>
					 </div>
					 <button class="cancelBtn">예약완료</button>
				 </div>
			</section>
			<section class="questionSection">
			 	<div class="questionList">
			 		<div class="questionContent">
					 	<h2>1:1 문의내역</h2>
			 			<p>정확한 답변으로 안내해 드릴게요</p>
			 		</div>
                </div>
                <button class="moreViewBtn" onclick="location.href='QuestionList'">이동</button>
            </section>
	        
        </div>
        </section>
	    <aside id="customer_container" >
				<jsp:include page="/WEB-INF/views/inc/customer_center.jsp"></jsp:include>
		</aside>
		
    </main>
    </div>
		
		
    <!-- 스크롤 따라 움직이는 카카오톡 1:1문의 아이콘 -->
<!--     <div align="right" class="kakaoQna">  -->
<!--         <table border="1"> -->
<!--             <tr><td><b>카카오톡<br>1:1문의</b></td></tr>  -->
<!--         </table> -->
<!--     </div>    -->
    
    
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
        <%-- 회사 소개 영역 --%>
        <jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
    </footer>
</body>
</html>