<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="layerPopup_wrap">
		<div class="layerPopup_header">
			<h2>필터</h2>
			<p>선택한 항목이 적용된 차량을 보여줘요</p>
			<input type="button" value="X" class="layerPopup_close">
			
			<div class="layerPopup_content">
				<ul class="fillter_op_wrap">
					<li class="fillter_box">
						<h3>차종</h3>
						<div>
							<ul class="btn_group">
								<li><input type="button" name="campingCar" value="캠핑카"></li>
								<li><input type="button" name="smallCar" value="소형차"></li>
								<li><input type="button" name="suv" value="SUV"></li>
							</ul>
						</div>
					</li>
					<li class="fillter_box">
						<h3>연료</h3>
						<div>
							<ul class="btn_group">
								<li><input type="button" name="electricity" value="전기"></li>
								<li><input type="button" name="hybrid" value="하이브리드"></li>
								<li><input type="button" name="gasoline" value="가솔린"></li>
								<li><input type="button" name="diesel" value="디젤"></li>
							</ul>
						</div>
					</li>
					
					<li class="fillter_box">
						<h3>운전자 조건</h3>
						<div>
							<ul class="driver_condition">	<!-- display: flex; -->
								<li>
									<p class="op_title">나이</p>
									<ul class="btn_group">
										<li><input type="button" name="under_25age" value="만 21~25세"></li>
										<li><input type="button" name="upper_26age" value="만 26세 이상"></li>
									</ul>
								</li>
								<li>
									<p class="op_title">운전경력</p>
									<span>*유효한 면허증의 취득일 기준</span>
									<ul class="btn_group">
										<li><input type="button" name="under_3year" value="1년~3년 미만"></li>
										<li><input type="button" name="upper_3year" value="3년 이상"></li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					
					<li class="fillter_box">
						<h3>연식</h3>
						<div>
							<ul class="btn_group">
								<li><input type="button" name="model_20_21" value="2020~2021"></li>
								<li><input type="button" name="model_21_22" value="2021~2022"></li>
								<li><input type="button" name="model_22_23" value="2022~2023"></li>
								<li><input type="button" name="model_23_24" value="2023~2024"></li>
								<li><input type="button" name="model_24_25" value="2024~2025"></li>
							</ul>
						</div>
					</li>
					<li class="fillter_box">
						<h3>반려동물 동승</h3>
						<p>*주의*<br>
						다른 이용 고객에게 위해(알레르기 등)를 끼칠 우려가 있어 반려동물의 동승을 허용하는 차량이 구분되어 있습니다.<br>
						반려동물 동반 탑승 시 크리닝 비용(보험미적용/실비청구)이 추가 발생할 수 있습니다.</p>
						<div>
							<ul class="btn_group">
								<li><input type="button" name="" value="가능"></li>
								<li><input type="button" name="" value="불가능"></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			
			<div class="layerPopup_btn">
				<input type="button" name="reset" value="초기화">
				<input type="button" name="apply" value="적용하기">
			</div>
		</div>
	</div>
</body>
</html>