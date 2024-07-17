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
								<div class="" align="left">
									<p>${ReserveDetail[0].mem_name}</p>
									<p><span>예약번호 : </span>${ReserveDetail[0].res_idx}</p>	
									<p><span>지점 : </span>${ReserveDetail[0].brc_name}</p>	
									<p>
									<span>일시 : 
										<script>
										// 날짜 문자열을 불러옴.
										var rentalDate = "${ReserveDetail[0].res_rental_date}";
										var returnDate = "${ReserveDetail[0].res_return_date}";
										
										// T 문자를 공백으로 대체.
										rentalDate = rentalDate.replace('T',' ');
										returnDate = returnDate.replace('T',' ');
										
										// 결과를 출력.
										document.write(rentalDate + " ~ " + returnDate);
										console.log("rentalDate + ' ~ ' + returnDate");
										</script> 
									</span>
<%-- 									${ReserveDetail[0].res_rental_date} ~ ${ReserveDetail[0].res_return_date} --%>
									</p>	
									
									
									
				    					<a href="" class="res_done">${ReserveDetail[0].pay_status}</a>
								</div>
								<hr>
								<div align="left">
									<div>차량</div>
									<div>
										<p>
											<span>${ReserveDetail[0].car_model}</span>
											<span>${ReserveDetail[0].car_old}</span>
										</p>
									</div>
								</div>
								<hr>
								<div align="left">
									<div>보험</div>
									<div>
										<p>
											<span>${ReserveDetail[0].car_insurance}</span><br>
										</p>
									</div>
								</div>
							</th>
						</tr>
					</table>
					<div align="left">
						<h4>결제내역</h4>
						<table border="1" id="pay_list">
							<tr>
								<th><a>${ReserveDetail[0].pay_method_name}</a></th>
								<td><a>${ReserveDetail[0].res_fee}원</a></td>
							</tr>
						</table>
					</div>
				</div>
				<br>
				<div align="center" class="resCancelBtn">
<%-- 					<input type="button" id="res_cancelBtn" value="예약취소" onclick="location.href='ReservationCancel?res_idx='${ReserveDetail[0].res_idx}"><br> --%>
					<a href="ReservationCancel?res_idx=${ReserveDetail[0].res_idx}&res_rental_date=${ReserveDetail[0].res_rental_date}"><button id="res_cancelBtn" >예약취소</button></a>
				</div>
				
	<!------------------------------- 	상세내역 끝 ---------------------------------------->
	
	<!------------------------------- 	결제내역 ------------------------------------------->
				
			</div>
		</section>
		<aside id="customer_container">
			<jsp:include page="/WEB-INF/views/inc/customer_center.jsp"></jsp:include>
		</aside>
	</main>
	<!---------------------------------- 메인 끝 ----------------------------->
	
	 
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