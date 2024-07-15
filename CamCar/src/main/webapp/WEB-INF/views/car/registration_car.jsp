<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 관리자</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>

<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/manager_default.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style type="text/css">
table {
	border-collapse: collapse;
}
table th, table td {
	padding: 10px;
}
table th {
	text-align: center;
}
</style>
</head>
<script type="text/javascript">
	function correction() {
		window.open('member_correction', '_parent ',
				'width=300px,height=300px,left=750, top=200');
	}
</script>
<body>
	<header>
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/MVC_Board = webapp) 이므로 inc 디렉토리의 top.jsp 지정 --%>
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<aside>
			<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		</aside>
		<section>
			<div>
				<div align="center">
					<h1>차량 정보 등록</h1>
					
<!-- 					<form action="CarInfoRegistration" name="carInfoRegistration" method="post"> -->
					<form action="CarInfoRegistration" name="carInfoRegistration" method="post" enctype="multipart/form-data">
						<table border="1" class="graph">
							<tr>
								<th width="125px">차종 *</th>
								<td class="write_td_right" colspan="2" align="left">
									<select name="car_type">
										<option value="캠핑카">캠핑카</option>
										<option value="SUV">SUV</option>
										<option value="소형차">소형차</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>차량코드 *</th>
								<td class="write_td_right" colspan="2" align="left">
									<input type="text"id="car_idx" name="car_idx" required />
								</td>
							</tr>
							<tr>
								<th>차량 지점 코드 *</th>
								<td class="write_td_right" colspan="2" align="left">
<!-- 									<input type="text"id="board_subject" name="brc_idx" required /> -->
									<select name="brc_idx">
										<option value="5101">캠핑갈카 부산본점</option>
										<option value="201">캠핑갈카 서울지점</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>모델명 *</th>
								<td class="write_td_right" colspan="2" align="left">
									<input type="text"id="car_model" name="car_model" required />
								</td>
							</tr>
							<tr>
								<th>차량번호 *</th>
								<td class="write_td_right" colspan="2" align="left">
									<input type="text"id="car_number" name="car_number" required />
								</td>
							</tr>
							<tr>
								<th>제조사</th>
								<td class="write_td_right" colspan="2" align="left">
									<input type="text"id="car_company" name="car_company" />
								</td>
							</tr>
							<tr>
								<th>정원</th>
								<td class="write_td_right" colspan="2" align="left">
									<input type="number"id="car_riding" name="car_riding" min="1" max="15" /> 명
								</td>
							</tr>
							<tr>
								<th>연료</th>
								<td class="write_td_right" colspan="2" align="left">
									<input type="text"id="car_fuel_type" name="car_fuel_type" />
								</td>
							</tr>
							<tr>
								<th>나이제한</th>
								<td class="write_td_right" colspan="2" align="left">
									<input type="number"id="car_age" name="car_age" min="20" max="30" /> 세 이상 (만 나이)
								</td>
							</tr>
							<tr>
								<th>운전경력제한</th>
								<td class="write_td_right" colspan="2" align="left">
									<input type="number" id="car_career" name="car_career" min="0" max="10" /> 년 이상
								</td>
							</tr>
							<tr align="center">
								<th>연식</th>
								<td class="write_td_right" colspan="2" align="left">
									<input type="number" id="car_old" name="car_old" />
								</td>
							</tr>
							<tr>
								<th>반려동물<br>동승 여부 *</th>
								<td class="write_td_right" colspan="2" align="left">
									<select name="pet_opt" id="pet_opt">
										<option value="N">불가능</option>
										<option value="Y">가능</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>면허종류 *</th>
								<td class="write_td_right" colspan="2">
									<select name="car_license" id="car_license">
										<option value="">면허종류를 선택해주세요</option>
										<option value="2종보통">2종보통</option>
										<option value="1종보통">1종보통</option>
										<option value="1종특수-대형견인차(트레일러)">1종특수-대형견인차(트레일러)</option>
										<option value="1종특수-구난차(레커)">1종특수-구난차(레커)</option>
										<option value="1종특수-소형견인차">1종특수-소형견인차</option>
										<option value="국제면허">국제면허</option>
									</select> 이상
								</td>
							</tr>
							<tr>
								<th>주중 대여료 *</th>
								<td class="write_td_right" colspan="2">
									<input type="number" id="car_weekdays" name="car_weekdays" required />
								</td>
							</tr>
							<tr>
								<th>주말 대여료 *</th>
								<td class="write_td_right" colspan="2">
									<input type="number" id="car_weekend" name="car_weekend" required />
								</td>
							</tr>
							<tr>
								<th>차량 상태 *</th>
								<td class="write_td_right" colspan="2">
									<input type="text"id="car_status" name="car_status" value="신규차량" required />
								</td>
							</tr>
							<%-- 파일 첨부 영역 --%>
							<tr>
								<th class="write_td_left" rowspan="2">메인 사진 등록</th>
								<td class="write_td_right">차량모델 사진</td>
								<td class="write_td_right">
									<%-- 파일 첨부 형식은 input 태그의 type="file" 속성 활용 --%>
									<%-- 주의! 파일 업로드를 위해 form 태그 속성에 enctype 속성 필수! --%>
									<input type="file" name="model_image"><br>
								</td>
								
							</tr>
							<tr>
								<td class="write_td_right">제조사 로고 사진</td>
								<td class="write_td_right">
									<input type="file" name="logo_image"><br>
								</td>
								
							</tr>
														
							<tr>
								<th class="write_td_left" rowspan="5">사진 등록</th>
								<td class="write_td_right">차량사진1</td>
								<td>
									<input type="file" name="image1">
								</td>
							</tr>
							<tr>
								<td class="write_td_right">차량사진2</td>
								<td>
									<input type="file" name="image2">
								</td>
							</tr>
							<tr>
								<td class="write_td_right">차량사진3</td>
								<td>
									<input type="file" name="image3">
								</td>
							</tr>
							<tr>
								<td class="write_td_right">차량사진4</td>
								<td>
									<input type="file" name="image4">
								</td>
							</tr>
							<tr>
								<td class="write_td_right">차량사진5</td>
								<td>
									<input type="file" name="image5">
								</td>
							</tr>
						</table>
						<br>
						<section id="commandCell">
							<input type="submit" value="신규 차량 등록">
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


