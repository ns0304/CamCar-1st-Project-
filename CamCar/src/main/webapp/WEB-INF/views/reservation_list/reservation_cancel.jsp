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
<link href="${pageContext.request.servletContext.contextPath}/resources/css/reservation_cancel.css" rel="stylesheet" type="text/css">
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
					<h2>예약취소</h2>
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
				<br><br>
					
	<!------------------------------- 	상세내역 끝 ---------------------------------------->
	
	<!------------------------------- 	결제내역 ---------------------------------------->
					<div align="left">
						<div align="left" class="agreeText1">
							<div align="center" class="agreeText1_1" id="agree" style="display: inline-block">
								<h2>필수 약관에 동의해 주세요</h2>
							</div>
							<div align="center" class="agreeText1_2" style="display: inline-block">
								<p><img src="/"><b>차량 대여료를 기준으로 위약금이<br> 발생해요</b></p>
							</div>
						</div>	
						<br>
						<div align="left" class="agreeText2">
							<div align="center" class="agreeText2_1" style="display: inline-block">
								<p id="rule"><img src="/"><b>취소 및 환불 규정을 꼭 확인해 주세요</b></p>
							</div>
							<div align="center" class="agreeText2_2" style="display: inline-block">
								<p id="rule"><img src="/"><b>카드사 사정에 따라 환불금 입금까지 <br>
												최대 7일이 소요될 수 있어요</b></p>
							</div>
						</div>
						<br>
						<div class="agreeCheck" style="display: inline-block">
							<table border="1" class="rule_agree">
								<tr>
									<th>
										<input type="checkbox" class="agreeCheckBox">
										<a>취소 및 위약금 규정 동의</a>
									</th>
								</tr>
								<tr>
									<td>
									<a id="agree_rules">예약 취소 및 환불에 관한 규정을 안내해 드립니다.<br>
									대여시간 72시간 이내 취소 시 차량 대여료의 20% 위약금이 발생합니다.<br>
									대여시간 이후 취소 시 차량 대여료의 30% 위약금이 발생합니다. <br>
									대여시간 2시간 경과 시 No-show로 간주되어 예약이 임의로 취소됩니다.<br></a>
									</td>
								</tr>
								
							</table>
						</div>
						
						<div class="alreadyPay" style="display: inline-block">
							<table border="1" class="already_pay">
								<tr>
									<th>
										결제내역
										<p class="payCost">
											<a>이미 결제한 금액</a><br>
											<a>취소 수수료</a><br>
											<a>환불 예정 금액</a><br>
										</p>
									</th>
								</tr>
								
							</table>
						</div>
						
						<div align="center" class="cancelBtn" ><br>
							<input type="button" id="res_cancel_btn" value="예약취소">
						</div>
						
					
						
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