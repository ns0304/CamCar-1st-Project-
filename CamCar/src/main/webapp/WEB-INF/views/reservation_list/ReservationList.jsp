<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 : 예약확인</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/res_confirm.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/ReservationList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/MVC_Board = webapp) 이므로 inc 디렉토리의 top.jsp 지정 --%>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<main>
		<section>
			<div align="center" class="mainDiv">
			<form action="ReservationList" method="get"onsubmit=""></form>
				
	<!----------------------------------- 내 예약 ------------------------------------------->

				<input type="hidden" value="${ReserveList[0].mem_id}" name="mem_id"
					id="mem_id" readonly>
				<h2>${ReserveList[0].mem_name}고객님의 예약내역</h2>
				<br>
				<!---------- 조건문 시작 --------->
<%-- 				<c:set var="ReserveList" value="ReserveList[0]" /> --%>
<%-- 					<c:if test="${empty ReserveList}"> --%>
<!-- 						<p>조회된 예약 내역이 없습니다.</p> -->
<%-- 					</c:if> --%>
						<div align="left" class="myRes">
							<p>
								<b>내 예약</b>
							</p>
							<div align="right">
								<span><a href="MoreView" class="moreView">더보기</a></span>
							</div>
							<div></div>
							<table border="1" id="my_res">
								<tr>
									<th rowspan="4"><img
										src="${pageContext.request.servletContext.contextPath}/resources/upload/${ReserveList[0].car_model_image}"
										width="250px"><br> <img
										src="${pageContext.request.servletContext.contextPath}/resources/upload/${ReserveList[0].car_logo_image}"><br>
										<!-- 								<img src="./resources/images/1그랜저.png" width="300px" height="300px"> -->
									</th>
									<td><span> <a>${ReserveList[0].car_model}</a> <a
											href="ReservationDetail?res_idx=${ReserveList[0].res_idx}"><button>예약
													상세 보기</button></a>
											<button disabled
												style="background-color: #59b9a9; color: black; border: none;">${ReserveList[0].pay_status}</button>
									</span></td>
								</tr>
								<tr>
									<td colspan="2"><a>예약 번호 : ${ReserveList[0].res_idx}</a></td>
								</tr>
								<tr>
									<td colspan="2"><a>지점 : ${ReserveList[0].brc_name}</a></td>
								</tr>
								<tr>
									<td colspan="2"><a>일정 : <script>
										// 날짜 문자열을 불러옴.
										var rentalDate = "${ReserveList[0].res_rental_date}";
										var returnDate = "${ReserveList[0].res_return_date}";

										// T 문자를 공백으로 대체.
										rentalDate = rentalDate.replace('T',
												' ');
										returnDate = returnDate.replace('T',
												' ');

										// 결과를 출력.
										document.write(rentalDate + " ~ "
												+ returnDate);
										console
												.log("rentalDate + ' ~ ' + returnDate");
									</script> 
											<%-- 											<fmt:formatDate value="${ReserveList[0].res_rental_date}" --%>
											<%-- 											pattern="yyyy-MM-dd HH:mm" /> ~   --%> <%-- 											<fmt:formatDate value="${ReserveList[0].res_return_date}"  --%>
											<%-- 											pattern="yyyy-MM-dd HH:mm" /> --%>
									</a></td>
								</tr>
							</table>
						</div>
				<!------------------------------- 	내 예약 끝 ---------------------------------------->
						
			<!------------------------------- 	지난 예약 ---------------------------------------->
				<div align="left" class="oldRes">
					<p><b>지난 예약</b></p>
<%-- 					<c:set var="ReserveList2" value="ReserveList2[0]" /> --%>
<%-- 					<c:if test="${empty ReserveList2}"> --%>
<!-- 						<p>조회된 예약 내역이 없습니다.</p> -->
<%-- 					</c:if> --%>
					<table border="1" id="old_res">
						<tr>
							<th rowspan="6">
							<img src="${pageContext.request.servletContext.contextPath}/resources/upload/${ReserveList2[0].car_model_image}" width="250px" ><br>
							<img src="${pageContext.request.servletContext.contextPath}/resources/upload/${ReserveList2[0].car_logo_image}" ><br>
							</th>
							<td>
								<span>
								
								<a>${ReserveList2[0].car_model}</a> 
								<button disabled style="background-color: #59b9a9; color: black; border:none;">${ReserveList2[0].pay_status}</button>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2"><a>예약 일자 : </a> &nbsp; 
								<a>
								<script>
									// 날짜 문자열을 불러옴. 
									var reserveDate = "${ReserveList2[0].res_time}";
									
									// T 문자를 공백으로 대체.
									reserveDate = reserveDate.replace('T',' ');
									
									// 결과를 출력.
									document.write(reserveDate);
									console.log("reserveDate");
								</script> 
								</a>
								<br>
							</td>
						</tr>
						<tr>
							<td colspan="2"><a>예약 번호 : </a> &nbsp; <a>${ReserveList2[0].res_idx}</a></td>
						</tr>
						<tr>
							<td colspan="2"><a>지점 : </a> &nbsp; <a>${ReserveList2[0].brc_name}</a></td>
						</tr>
						<tr>
							<td colspan="2"><a>일정 : </a>
							<a>
							<script>
									// 날짜 문자열을 불러옴.
									var rentalDate = "${ReserveList2[0].res_rental_date}";
									var returnDate = "${ReserveList2[0].res_return_date}";
									
									// T 문자를 공백으로 대체.
									rentalDate = rentalDate.replace('T',' ');
									returnDate = returnDate.replace('T',' ');
									
									// 결과를 출력.
									document.write(rentalDate + " ~ " + returnDate);
									console.log("rentalDate + ' ~ ' + returnDate");
									
								</script> 
							</a>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<a href="ReservationDetail?res_idx=${ReserveList2[0].res_idx}">
								<button>예약상세 보기</button>
								</a>
								<button>리뷰작성</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</section>
		<aside id="customer_container">
			<jsp:include page="/WEB-INF/views/inc/customer_center.jsp"></jsp:include>
		</aside>
	</main>
	
	<!--  카카오톡 1:1문의하기 -->		
	<aside class="chatBtn">
		<jsp:include page="/WEB-INF/views/kakaoLink.jsp"></jsp:include>
	</aside>
	
	<footer>
		<!-- 회사 소개 영역 -->
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
				
				
					
				
				
					
					
					
				