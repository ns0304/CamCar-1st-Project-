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
					<h1>신규 차량 등록</h1>
					
					<form action="CarListWrite" name="joinForm" method="post" enctype="multipart/form-data">
						<table border="1" class="graph">
							<tr>
								<th width="80px" rowspan="16">차량이미지</th>
							</tr>
							<tr>
								<th width="80px">차량코드</th>
								<td class="write_td_right">
									<input type="text"id="board_subject" name="car_idx" required />
								</td>
							</tr>
							<tr>
								<th width="50px">차량 번호</th>
								<td class="write_td_right">
									<input type="text"id="board_subject" name="car_number" required />
								</td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th width="50px">제조사</th> -->
<!-- 								<td class="write_td_right"> -->
<!-- 									<input type="text"id="board_subject" name="board_subject" required /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							<tr>
								<th width="100px">모델명</th>
								<td class="write_td_right">
									<input type="text"id="board_subject" name="car_model" required />
								</td>
							</tr>
							<tr>
								<th width="80px">연식</th>
								<td class="write_td_right">
									<input type="text"id="board_subject" name="car_old" required />
								</td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th width="80px">정원</th> -->
<!-- 								<td class="write_td_right"> -->
<!-- 									<input type="text"id="board_subject" name="board_subject" required /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th width="80px">나이제한</th> -->
<!-- 								<td class="write_td_right"> -->
<!-- 									<input type="text"id="board_subject" name="board_subject" required /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th width="80px">운전경력제한</th> -->
<!-- 								<td class="write_td_right"> -->
<!-- 									<input type="text"id="board_subject" name="board_subject" required /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th width="80px">주중 대여료</th> -->
<!-- 								<td class="write_td_right"> -->
<!-- 									<input type="text"id="board_subject" name="board_subject" required /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th width="80px">주말 대여료</th> -->
<!-- 								<td class="write_td_right"> -->
<!-- 									<input type="text"id="board_subject" name="board_subject" required /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							<tr>
								<th width="80px">차량 지점 코드</th>
								<td class="write_td_right">
									<input type="text"id="board_subject" name="brc_idx" required />
								</td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th width="80px">차종</th> -->
<!-- 								<td class="write_td_right"> -->
<!-- 									<input type="text"id="board_subject" name="board_subject" required /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th width="80px">변속 타입</th> -->
<!-- 								<td class="write_td_right"> -->
<!-- 									<input type="text"id="board_subject" name="board_subject" required /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th width="80px">연료</th> -->
<!-- 								<td class="write_td_right"> -->
<!-- 									<input type="text"id="board_subject" name="board_subject" required /> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							<tr>
								<td class="write_td_left"><label for="board_file">파일첨부</label></td>
								<td class="write_td_right">
									<%-- 파일 첨부 형식은 input 태그의 type="file" 속성 활용 --%> <%-- 주의! 파일 업로드를 위해 form 태그 속성에 enctype 속성 필수!  --%>
									<%-- 1) 한번에 하나의 파일(단일 파일) 선택 가능하게 할 경우 --%> 
									<input type="file" name="file1"> 
									<input type="file" name="file2">
									<input type="file" name="file3">
									<input type="file" name="file4">
									<input type="file" name="file5">
								</td>
							</tr>
						</table>
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


