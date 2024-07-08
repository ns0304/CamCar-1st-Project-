<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카_최종예약</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- <link href="${pageContext.request.servletContext.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css"> --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/reservation_final.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
<!-- 	<div id="container"> -->
		<header>
			<!-- 메뉴 -->
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		<main>
		<section id ="contents">
			<h2>예약</h2>
			<div id ="reservationStep" >
				<ul class="reservationStepList">
					<li>
						예약
					</li>
					<li>
						부가상품
					</li>
					<li>
						결제
					</li>
					<li>
						완료
					</li>
				</ul>
			</div>
			<div id="insurance" class="clear">
				<h3>보험선택</h3>
					<div id="insuranceWrap">
						<section id="insurance1" class="insuranceList">
						<h3>선택 안함</h3>
						
						사고 시 본인 부담금<br>
						<input type="button" value="금액" id="insuranceBtn1">
						</section>
						<section id="insurance2" class="insuranceList">
						<h3>일반 자차</h3>
						
						사고 시 본인 부담금<br>
						<input type="button" value="금액" id="insuranceBtn2">
						</section>
						<section id="insurance3" class="insuranceList">
						<h3>완전 자차</h3>
						
						사고 시 본인 부담금<br>
						<input type="button" value="금액" id="insuranceBtn3">
						</section>
					</div>
					<div id="insuranceDetail" class="clear">
						<a href="#">보장 내용 알아보기</a>	
					</div>
			</div>
			<div id="driverInfo"  class="clear">
				<form id="driverInfoForm">
					<h3>운전자 정보 입력</h3>
					<a href="#">내 정보에서 불러오기</a>
					<div id="driverInfoList">
						<div id="driverInfo1" class="clear">
							<h4>기본정보</h4>
							이름<br>
							<input type="text" placeholder="이름을 입력해주세요"><br><br>
							휴대폰번호<br>
							<input type="text" placeholder="01012345678"><br><br>
							생년월일<br>
							<input type="text" placeholder="YYYYMMDD"><br><br>
							주소<br>
							<input type="text" placeholder="주소검색을 통해 입력해주세요"><br>
							<input type="button" value="주소검색">
						</div>
						<div id="driverInfo2">
							<h4>운전면허정보</h4>
							<img src="${pageContext.request.servletContext.contextPath}/resources/img/driverImage.png"  id="driverImage" height="120px"><br>
							면허종류<br>
							<select>
								<option></option>
							</select><br>
							면허번호<br>
							<input type="text" placeholder="-를 뺀 면허정보를 입력해주세요"><br>
							발급일자<br>
							<input type="text" placeholder="YYYYMMDD"><br>
							만료일자<br>
							<input type="text" placeholder="YYYYMMDD"><br>	
						</div>
					</div>
					<div id="driverInfoSubmit"><input type="submit" value="입력완료"></div>
				</form>		
			</div>
		</section>
		
		<aside id="sideContent">
			<jsp:include page="/WEB-INF/views/reservation/sideContent.jsp"></jsp:include>
		</aside>
		</main>
		
	<!-- okokokkokok 카카오톡 1:1문의하기 okokokkokok-->		
		<aside class="chatBtn">
		 <nav>
		  <a href="#sec01">
		  <img src="${pageContext.request.servletContext.contextPath}/resources/img/main/chat.png"><br>
		  채팅상담</a>
		 </nav>
		</aside>		
		
		
	<footer>
		<!-- 회사 소개 영역 -->
<%-- 		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include> --%>
	</footer>
<!-- 	</div> -->
</body>
</html>


