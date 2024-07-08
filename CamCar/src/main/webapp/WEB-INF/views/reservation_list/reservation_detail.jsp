<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/res_confirm.css" rel="stylesheet" type="text/css">
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
<!----------------------------------- 상세내역 ------------------------------------------->
			<div align="center">
				<div align="left">
					<h2>예약상세</h2>
				</div>
				<div align="left">
				<h4>상세내역</h4>
				</div>
				<div align="center" class="resList">
					<table border="1" id="resList">
						<tr>
							<th>
								<div class="">
									<p>
										홍길동(이름)
				    					<a href="" class="res_done">예약완료</a>
									</p>
								</div>
								<hr>
								<p>
									예약 번호 &nbsp;&nbsp; <a>dddd-d123445</a><br>
									일시 &nbsp;&nbsp; <a>08. 12(금) 15:00 ~ 08.13(화) 15:00</a><br>
									&nbsp;&nbsp;&nbsp;&nbsp;<a>부산</a><br>
									차량 &nbsp;&nbsp; <a>스파크1.0가솔린</a><br>
									 &nbsp;&nbsp;&nbsp;&nbsp; <a>2021년식 가솔린</a><br>
									보험 &nbsp;&nbsp; <a>완전자차</a><br>
									 &nbsp;&nbsp;&nbsp;&nbsp; 
									 &nbsp;&nbsp; <a>사고 시 고객 부담 금액</a><br>
								</p>
							</th>
						</tr>
					</table>
				</div>
				<br>
				<div align="center" class="resCancelBtn">
					<input type="button" id="res_cancelBtn" value="예약취소" onclick="location.href='reservationCancel'"><br>
				</div>
					
	<!------------------------------- 	상세내역 끝 ---------------------------------------->
	
	<!------------------------------- 	결제내역 ------------------------------------------->
					<div align="left">
					<h4>결제내역</h4>
						<table border="1" id="pay_list">
							<tr>
								<th>
									<a>신용카드</a>&nbsp;<a>06.16(일) HH : MM</a>
									
									<a href="#">@@,@@@원</a>
								</th>
							</tr>
						</table>
					</div>
				
			</div>
		</section>
		<aside id="customer_container">
			<jsp:include page="/WEB-INF/views/inc/customer_center.jsp"></jsp:include>
		</aside>
	</main>
	<!---------------------------------- 메인 끝 ----------------------------->
	
	<!-- 사이드 카카오톡 1:1문의 -->
	<div id="kakaotalk">
		<a href="">&#128488;</a>
	</div>
	
	<footer>
		<!-- 회사 소개 영역 -->
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>