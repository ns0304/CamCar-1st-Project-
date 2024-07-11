<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>

<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/manager_default.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
</head>
<script type="text/javascript">
	function correction() {
		window.open('member_correction', '_parent ',
				'width=300px,height=300px,left=750, top=200');
	}
	
$(document).ready(function() {
	// 차량모델코드 == 차량 사진 아이디
	$("#car_image_id").on("blur", function() {
		let car_image_id = $("#car_image_id").val()
		$("#car_model_idx").val(car_image_id)
	});
		
});
</script>
<body>
	<header>
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/MVC_Board = webapp) 이므로 inc 디렉토리의 top.jsp 지정 --%>
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		<section>
			<div>
				<div align="center">
					<h1>차량 모델 정보 등록</h1>
					<p>(* : 필수 입력 사항)</p>
					<form action="CarModelRegistration" name="carModelRegistration" method="post">
						<%-- 차량 모델 코드 --%>
						<input type="hidden" id="car_model_idx" name="car_model_idx" />
						<table border="1" class="carModelInfo">
							<tr>
								<th width="150px">모델명 *</th>
								<td class="write_td_right" width="400px;">
									<input type="text" id="car_model" name="car_model" required />
								</td>
							</tr>
							<tr>
								<th>차종 *</th>
								<td class="write_td_right">
									<select name="car_type">
										<option value="캠핑카">캠핑카</option>
										<option value="SUV">SUV</option>
										<option value="소형차">소형차</option>
									</select>
								</td>
<!-- 								<td class="write_td_right"> -->
<!-- 									<input type="text"id="car_type" name="car_type" required /> -->
<!-- 								</td> -->
							</tr>
							<tr>
								<th>제조사</th>
								<td class="write_td_right">
									<input type="text"id="car_company" name="car_company" />
								</td>
							</tr>
							<tr>
								<th>정원 *</th>
								<td class="write_td_right">
									<input type="number"id="car_riding" name="car_riding" min="1" max="15" required /> 명
								</td>
							</tr>
							<tr>
								<th>연료</th>
								<td class="write_td_right">
									<input type="text"id="car_fuel_type" name="car_fuel_type" />
								</td>
							</tr>
							<tr>
								<th>나이제한</th>
								<td class="write_td_right">
									<input type="number"id="car_age" name="car_age" min="20" max="30" required /> 이상
								</td>
							</tr>
							<tr>
								<th>운전경력제한</th>
								<td class="write_td_right">
									<input type="number"id="car_career" name="car_career" min="0" max="10" required /> 이상
								</td>
							</tr>
							<tr>
								<th>면허종류 *</th>
								<td class="write_td_right">
									<input type="text"id="car_license" name="car_license" required />
								</td>
							</tr>
							<tr>
								<th>주중 대여료 *</th>
								<td class="write_td_right">
									<input type="number"id="car_weekdays" name="car_weekdays" required /> 원
								</td>
							</tr>
							<tr>
								<th>주말 대여료 *</th>
								<td class="write_td_right">
									<input type="number"id="car_weekend" name="car_weekend" required /> 원
								</td>
							</tr>
							<tr>
								<th>차량 사진 아이디 *</th>
								<td class="write_td_right">
									<input type="number"id="car_image_id" name="car_image_id" required />
								</td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th width="80px">차량 지점 코드</th> -->
<!-- 								<td class="write_td_right"> -->
<!-- 									<select name="brc_idx"> -->
<!-- 										<option value="5101">캠핑갈카 부산본점</option> -->
<!-- 										<option value="201">캠핑갈카 서울지점</option> -->
<!-- 									</select> -->
<!-- 								</td> -->
<!-- 							</tr> -->
						</table>
						<section id="commandCell">
							<input type="submit" value="차량 모델 정보 등록">
						</section>
					</form>
				</div>
			</div>
		</section>
	</main>



	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>


