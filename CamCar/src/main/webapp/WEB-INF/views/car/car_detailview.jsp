<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 관리자</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
<!-- 
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css"> -->
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/manager_default.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	function confirmDelete() {
		// 삭제 버튼 클릭 시 확인창을 통해 "삭제하시겠습니까?" 출력 후
		// 다이얼로그의 확인 버튼 클릭 시 "BoardDelete.bo" 서블릿 요청
		// => (파라미터  : 글번호, 페이지번호)
		if (confirm("삭제하시겠습니까?")) {
			location.href = "CarInfoDelete?car_idx=${car.car_idx}&pageNum=${param.pageNum}";
		}
	}
	// 차량 상태 업데이트
	function confirmUpdate() {
		location.href= " CarInfoUpdate?car_idx=${car.car_idx}";
	}
	
	$(document).ready(function() {
		// 첫 번째 이미지에 selected 클래스 추가
		$("#img1").addClass("selected");

		$(".changeImg").click(function() {
			let newSrc = $(this).attr('src');
			$("#mainImg").attr('src', newSrc);

			// 모든 changeImg 클래스 요소에서 selected 클래스를 제거
			$(".changeImg").removeClass("selected");

			// 클릭된 이미지에 selected 클래스 추가
			$(this).addClass("selected");
		});
	});
</script>
<style type="text/css">
section {
	width: 80%;
	max-width: 1000px; /* 섹션 너비 조정 */
}

table {
	border-collapse: collapse;
	width: 90%;
	margin-top: 20px;
}

table th, table td {
	padding: 10px;
	text-align: center;
	border: 1px solid #ddd;
	background-color: #f9f9f9;
}

table th {
	background-color: #f2f2f2;
	color: #333;
}

table tr:hover {
	background-color: #f2f2f2;
}

table th, table td:nth-child(3) {
	white-space: nowrap; /* 생년월일 칼럼 텍스트가 너무 길 때 줄이지 않도록 설정 */
}

table input[type="button"] {
	padding: 3px 6px;
	background-color: #00838f;
	color: #fff;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
}

table input[type="button"]:hover {
	background-color: #006064;
}

.car_image {
	width: 400px;
	height: auto;
}
</style>
</head>
<body>
	<main>
		<section>
			<div align="center">
				<!-- 게시판 상세내용 보기 -->
				<form action="carModify" name="carmodifyForm" method="post">
					<input type="hidden" name="car_idx" value="${car.car_idx}">
					<%-- 				<input type="hidden" name="car_status" value="${car.car_status}"> --%>
					<article id="articleForm">
						<h2>차량 상세 정보</h2>
						<section id="basicInfoArea">
							<table border="1" class="graph">
								<tr>
									<th>차량코드 *</th>
									<td class="write_td_right" colspan="2">${car.car_idx}</td>
								</tr>
								<tr>
									<th>차량 지점 코드 *</th>
									<td class="write_td_right" colspan="2">${car.brc_idx}</td>
								</tr>
								<tr>
									<th>모델명 *</th>
									<td class="write_td_right" colspan="2">${car.car_model}</td>
								</tr>
								<tr>
									<th>차량번호 *</th>
									<td class="write_td_right" colspan="2">${car.car_number}</td>
								</tr>
								<tr>
									<th>제조사</th>
									<td class="write_td_right" colspan="2">${car.car_company}</td>
								</tr>
								<tr>
									<th>정원</th>
									<td class="write_td_right" colspan="2">${car.car_riding}</td>
								</tr>
								<tr>
									<th>연료</th>
									<td class="write_td_right" colspan="2">
										${car.car_fuel_type}</td>
								</tr>
								<tr>
									<th>나이제한</th>
									<td class="write_td_right" colspan="2">${car.car_age}</td>
								</tr>
								<tr>
									<th>운전경력제한</th>
									<td class="write_td_right" colspan="2">${car.car_career}</td>
								</tr>
								<tr>
									<th>연식</th>
									<td class="write_td_right" colspan="2">${car.car_old}</td>
								</tr>
								<tr>
									<th>반려동물<br>동승 여부 *
									</th>
									<td class="write_td_right" colspan="2"><c:choose>
											<c:when test="${car.pet_opt eq 'Y'}">가능</c:when>
											<c:otherwise>불가능</c:otherwise>
										</c:choose></td>
								</tr>
								<tr>
									<th>면허종류 *</th>
									<td class="write_td_right" colspan="2">${car.car_license}</td>
								</tr>
								<tr>
									<th>주중 대여료 *</th>
									<td class="write_td_right" colspan="2">${car.car_weekdays}</td>
								</tr>
								<tr>
									<th>주말 대여료 *</th>
									<td class="write_td_right" colspan="2">${car.car_weekend}</td>
								</tr>
								<tr>
									<th>차량 상태 *</th>
									<td class="write_td_right" colspan="2"><select
										name="car_status">
											<option value="이용가능 차량"
												<c:if test="${car.car_status eq '이용가능 차량'}"> selected</c:if>>이용가능
												차량</option>
											<option value="정비중"
												<c:if test="${car.car_status eq '정비중'}"> selected</c:if>>정비중</option>
									</select></td>
								</tr>
								<tr>
									<th>차량 사진1</th>
									<td class="write_td_right" colspan="2">${car.car_image1}
										<div>
											<img
												src="${pageContext.request.contextPath}/resources/upload/${car.car_image1}"
												id="img1" class="car_image" selected>
										</div>
									</td>
								</tr>
								<tr>
									<th>차량 사진2</th>
									<td class="write_td_right" colspan="2">${car.car_image2}
										<div>
											<img
												src="${pageContext.request.contextPath}/resources/upload/${car.car_image2}"
												id="img2" class="car_image">
										</div>
									</td>
								</tr>
								<tr>
									<th>차량 사진3</th>
									<td class="write_td_right" colspan="2">${car.car_image3}
										<div>
											<img
												src="${pageContext.request.contextPath}/resources/upload/${car.car_image3}"
												id="img3" class="car_image">
										</div>
									</td>
								</tr>
								<tr>
									<th>차량 사진4</th>
									<td class="write_td_right" colspan="2">${car.car_image4}
										<div>
											<img
												src="${pageContext.request.contextPath}/resources/upload/${car.car_image4}"
												id="img4" class="car_image">
										</div>
									</td>
								</tr>
								<tr>
									<th>차량 사진5</th>
									<td class="write_td_right" colspan="2">${car.car_image5}
										<div>
											<img
												src="${pageContext.request.contextPath}/resources/upload/${car.car_image5}"
												id="img5" class="car_image">
										</div>
									</td>
								</tr>
							</table>
							<div class="carDetail_images"
								style="display: flex; justify-content: space-between;"></div>
							<br>
						</section>
						<section id="commandCell">
							<%-- 답변, 수정, 삭제는 로그인 한 사용자에게만 표시 --%>
							<%-- 단, 수정 삭제 버튼은 세션 아이디와 작성자 아이디가 일치할 경우에만 표시 --%>
							<c:if test="${not empty sessionScope.sId}">
								<%-- 임시) 삭제 버튼 클릭 시 BoardDeleteForm.bo 서블릿 요청(삭제 폼 페이지 포워딩) --%>
								<%-- 				<input type="button" value="삭제" onclick="location.href='BoardDeleteForm.bo?boardNum=${board.board_num}'"> --%>
								<%-- 삭제 버튼 클릭 시 패스워드 확인 없이 사용자에게 삭제 확인만 받기 위해서 --%>
								<%-- 자바스크립트 confirmDelete() 메서드 호출하여 확인 후 비즈니스 로직 요청 --%>
								<input type="button" value="삭제" onclick="confirmDelete()">
								<input type="submit" value="수정">
							</c:if>
						</section>
						<br>
					</article>
				</form>
			</div>
		</section>
	</main>
	<br>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
