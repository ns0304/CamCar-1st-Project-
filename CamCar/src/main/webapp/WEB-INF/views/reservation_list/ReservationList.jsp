<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/res_confirm.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/MVC_Board = webapp) 이므로 inc 디렉토리의 top.jsp 지정 --%>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<main>
		<section>
			<div align="center">
			<form action="ReservationList" method="get"onsubmit=""></form>
				
	<!----------------------------------- 내 예약 ------------------------------------------->
		
				<div align="left" class="myRes">
					<h2>${ReserveList[0].mem_name} 고객님의 예약내역</h2>
					<p><b>내 예약</b></p>
					<input type="hidden" value="${ReserveList[0].mem_id}" name="mem_id" id="mem_id"readonly>
				
					<table border="1" id="my_res">
						<tr>
							<th rowspan="4">
							<img src="${pageContext.request.servletContext.contextPath}/resources/upload/${ReserveList[0].car_model_image}" width="250px" ><br>
							<img src="${pageContext.request.servletContext.contextPath}/resources/upload/${ReserveList[0].car_logo_image}" ><br>
<!-- 								<img src="./resources/images/1그랜저.png" width="300px" height="300px"> -->
							</th>
							<td>
								<span>
								
								<a>${ReserveList[0].car_model}</a> 
			    					<a href="ReservationDetail?res_idx=${ReserveList[0].res_idx}"><button>예약 상세 보기</button></a>
									<button disabled style="background-color: #59b9a9; color: black; border:none;">예약완료</button>
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2"><a>예약 번호 : ${ReserveList[0].res_idx}</a> </td>
						</tr>
						<tr>
							<td colspan="2"><a>지점 : ${ReserveList[0].brc_name}</a></td>
						</tr>
						<tr>
							<td colspan="2">일정 :
								<script>
									// 날짜 문자열을 불러옴.
									var rentalDate = "${ReserveList[0].res_rental_date}";
									var returnDate = "${ReserveList[0].res_return_date}";
									
									// T 문자를 공백으로 대체.
									rentalDate = rentalDate.replace('T',' ');
									returnDate = returnDate.replace('T',' ');
									
									// 결과를 출력.
									document.write(rentalDate + " ~ " + returnDate);
									console.log("rentalDate + ' ~ ' + returnDate");
									
								</script> 
<%-- 											<fmt:formatDate value="${ReserveList[0].res_rental_date}" --%>
<%-- 											pattern="yyyy-MM-dd HH:mm" /> ~   --%>
											
<%-- 											<fmt:formatDate value="${ReserveList[0].res_return_date}"  --%>
<%-- 											pattern="yyyy-MM-dd HH:mm" /> --%>
							</td>
						</tr>
						<tr>
							<td colspan="2" text align="center">pageNum</td>
						</tr>
					</table>
				</div>
			<!------------------------------- 	내 예약 끝 ---------------------------------------->
						
			<!------------------------------- 	지난 예약 ---------------------------------------->
				<div align="left" class="oldRes">
					<p><b>지난 예약</b></p>
					<table border="1" id="old_res">
						<tr>
							<th rowspan="6">
								<img src="./resources/images/1그랜저.png" width="300px" height="300px">
							</th>
							<td>
								<span>
								
								<a>차량이름</a> 
								
									<button text-align="right"><a href="#">반납완료</a></button>	
								
								</span>
							</td>
						</tr>
						<tr>
							<td colspan="2"><a>예약 일자</a> &nbsp;&nbsp; <a>2024. 04. 07</a><br></td>
						</tr>
						<tr>
							<td colspan="2"><a>예약 번호</a> &nbsp;&nbsp; <a>dddd-d123445</a></td>
						</tr>
						<tr>
							<td colspan="2"><a>대여 일자 / 지점</a> &nbsp;&nbsp; <a>2024. 05. 05(일) 15:00 / 부산</a></td>
						</tr>
						<tr>
							<td colspan="2"><a>반납 일자 / 지점</a> &nbsp;&nbsp; <a>2024. 05. 08(일) 15:00 / 부산</a></td>
						</tr>
						<tr>
							<td colspan="2" text align="center">
								<button><a href="#">예약 상세 조회</a></button>
								<button><a href="#">리뷰작성</a></button>
							</td>
						</tr>
						<tr>
							<td colspan="2" text align="center">pageNum</td>
						</tr>
					</table>
				</div>
			</div>
		</section>
		<aside id="customer_container">
			<jsp:include page="/WEB-INF/views/inc/customer_center.jsp"></jsp:include>
		</aside>
	</main>
	
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
				
				
					
				
				
					
					
					
				