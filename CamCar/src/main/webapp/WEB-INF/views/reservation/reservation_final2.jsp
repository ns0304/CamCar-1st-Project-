<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카_최종예약!!</title>
<%-- 외부 CSS 파일 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/reservation_final.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style type="text/css">
.insurancePopUp {
    display: none;
    position: fixed;
    left: 50%;
    top: 40%;
    transform: translate(-50%, -50%);
    width: 600px;
    background-color: #fff;
    border: 1px solid #ccc;
    padding: 20px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    z-index: 1000;
}

.popUpHeader {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.popUpHeader h2 {
    margin: 0;
    font-size: 16px;
}

.popUpHeader .close {
    cursor: pointer;
    font-size: 16px;
}

.popUpField { 
     margin: 1px 0;
     margin-bottom: 1px; 
     margin-top: 1px; 
 } 
 
 #insuranceWrap a{
 	color: red;
 	text-indent: 5px;
 	margin-bottom: 0;
 	padding-bottom: 0;
 }
 
input[type="radio"] {
	display: none;
}
 
 
</style>
<script type="text/javascript">

$(document).ready(function() {
	
	// 보장 내용 알아보기 팝업창
	// 팝업 열기
	$("#insuranceDetail").click(function(event) {
	    event.preventDefault();
	    $(".insurancePopUp").show();
	});
	
	// 팝업 닫기
	$(".insurancePopUp .close, .insurancePopUp .agreementConfirm").click(function() {
	    $(".insurancePopUp").hide();
	});
	
	// '내정보 불러오기 ' 버튼 클릭 시 저장된 회원 정보를 운전자 정보 필드에 불러오기
	$("#myInfoLoad").click(function() {	
		event.preventDefault();
		$("#dri_name").val("${driver.dri_name}");
		$("#dri_tel").val("${driver.dri_tel}");
		$("#dri_birthday").val("${driver.dri_birthday}");
		$("#lic_num").val("${driver.lic_num}");
		$("#lic_info").val("${driver.lic_info}");
		$("#lic_issue_date").val("${driver.lic_issue_date}");
		$("#lic_expiration_date").val("${driver.lic_expiration_date}");
	});

	
    var rentalFee2 = $('#rentalFee2').data('value');
    $('#rentalFee2Hidden').val(rentalFee2);
	
	$("#nextBtn").on("click", function(event){
		event.preventDefault();
		let rentalFee = $("#rentalFee").data('value');
		let rentalFeeParam = $("#rentalFeeParam").val(rentalFee);
		let rentalFee2 = $("#insuranceListName").data('value');
		let rentalFeeParam2 = $("#rentalFeeParam2").val(rentalFee2);
		console.log("rentalFee : " + rentalFee);
		
		$("#reservationForm").submit();
	});
	
	
	$("#reservationForm").on("submit", function() {
	    var driName = $('#dri_name').val();
	    var driTel = $('#dri_tel').val();
	    var driBirthday = $('#dri_birthday').val();
	    var licInfo = $('#lic_info').val();
	    var licNum = $('#lic_num').val();
	    var licIssueDate = $('#lic_issue_date').val();
	    var licExpirationDate = $('#lic_expiration_date').val();
	    
	    $("#reservationForm").prepend('<input type="hidden" name="dri_name" value="' + driName + '" id="dri_name">');
	    $("#reservationForm").prepend('<input type="hidden" name="dri_tel" value="' + driTel + '" id="dri_tel">');
	    $("#reservationForm").prepend('<input type="hidden" name="dri_birthday" value="' + driBirthday + '" id="dri_birthday">');
	    $("#reservationForm").prepend('<input type="hidden" name="lic_info" value="' + licInfo + '" id="lic_info">');
	    $("#reservationForm").prepend('<input type="hidden" name="lic_num" value="' + licNum + '" id="lic_num">');
	    $("#reservationForm").prepend('<input type="hidden" name="lic_issue_date" value="' + licIssueDate + '" id="lic_issue_date">');
        $("#reservationForm").prepend('<input type="hidden" name="lic_expiration_date" value="' + licExpirationDate + '" id="lic_expiration_date">');
	    
        console.log($("#reservationForm").html());
        
//         $("#driverInfoForm").submit();
		return true;
	});
	
	
	// 보험 선택 해야 다음 페이지로 이동 가능함
    function validateDriverInfo() {
        let isValid = true;

        // 모든 input 요소가 비어 있지 않은지 확인
        $('#driverInfoList input[type="text"]').each(function() {
            if ($(this).val().trim() === '') {
                $(this).focus();
                isValid = false;
                return false; // 루프를 중지
            }
        });

        // select 요소에서 유효한 옵션이 선택되었는지 확인
        if (isValid && $('#lic_info').val() === '') {
            $('#lic_info').focus();
            isValid = false;
        }

        return isValid;
    }

    $('#reservationForm').on('submit', function(event) {
        if (!$('input[name="insuranceListName"]:checked').length) {
            event.preventDefault(); // 폼 제출을 막음
            alert('보험을 선택해주세요.');
        } else if (!validateDriverInfo()) {
            event.preventDefault(); // 폼 제출을 막음
            alert('운전자 정보 입력 영역을 모두 입력해주세요.');
        }
    });
	
	
});
</script>
<script type="text/javascript">
	function insuranceAdd() {
	    // 'insurance1' 체크 시에 rentalFee2에 보험금액이 더한 값 넣기
	    if ($('#insurance1').is(':checked')) {
	        var rentalFee = Number($('#rentalFee').data('value'));
	        var insuranceAdd = 0;
	        var rentalFee2 = rentalFee;
	        console.log(rentalFee, insuranceAdd, rentalFee2);
	        $("#rentalFee").text(rentalFee);
	        $("#rentalFee2").text(rentalFee2);
	 	    $("#insFeeAdd").remove();
	 	    $("#insuranceType").remove();
	        $("#reservationForm").prepend('<input type="hidden" name="insFee" value="' + insuranceAdd + '" id="insFeeAdd">');
	        $("#reservationForm").prepend('<input type="hidden" name="insuranceType" value="선택안함" id="insuranceType">');
	    }
	    // 'insurance2' 체크 시에 rentalFee2에 보험금액이 더한 값 넣기
	    if ($('#insurance2').is(':checked')) {
	        var rentalFee = Number($('#rentalFee').data('value'));
	        var insuranceAdd = Number($('#insuranceFeeAdd2').data('value'));
	        var rentalFee2 = rentalFee + insuranceAdd;
	        console.log(rentalFee, insuranceAdd, rentalFee2);

	        $("#rentalFee").text(rentalFee);
	        $("#rentalFee2").text(rentalFee2);
	 	    $("#insFeeAdd").remove();
	 	    $("#insuranceType").remove();
	        $("#reservationForm").prepend('<input type="hidden" name="insFee" value="' + insuranceAdd + '" id="insFeeAdd">');
	        $("#reservationForm").prepend('<input type="hidden" name="insuranceType" value="일반자차" id="insuranceType">');
	    }

	    // 'insurance3' 체크 시에 rentalFee2에 보험금액이 더한 값 넣기
	    if ($('#insurance3').is(':checked')) {
	        var rentalFee = Number($('#rentalFee').data('value'));
	        var insuranceAdd = Number($('#insuranceFeeAdd3').data('value'));
	        var rentalFee2 = rentalFee + insuranceAdd;
	        console.log(rentalFee, insuranceAdd, rentalFee2);
	        $("#rentalFee").text(rentalFee);
	        $("#rentalFee2").text(rentalFee2);
	 	    $("#insFeeAdd").remove();
	 	    $("#insuranceType").remove();
	        $("#reservationForm").prepend('<input type="hidden" name="insFee" value="' + insuranceAdd + '" id="insFeeAdd">');
	        $("#reservationForm").prepend('<input type="hidden" name="insuranceType" value="완전자차" id="insuranceType">');
	    }
	    
	}
</script>
</head>
<body>
		<header>
			<!-- 메뉴 -->
			<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
		</header>
		<main>
		<section id ="contents">
			<h2>예약</h2>
			<div id ="reservationStep" >
				<ul class="reservationStepList">
					<li id="reservationStepNow">
						<b>예약</b>
					</li>
					<li>
						부가상품
					</li>
					<li>
						결제
					</li>
					<li>
						완료
					</li>
				</ul>
			</div>

<!-- 			보험선택			 -->
			<div id="insurance" class="clear">
				<h3>보험선택</h3>
				<label class="insuranceRadio">
					<input type="radio" id="insurance1" name="insuranceListName" class="insuranceList" onclick="insuranceAdd()" value="0">
					<a id="insuranceType1">선택안함</a><br>
					<a id="insuranceFeeAdd1">0</a>원 추가<br>
					사고 시 고객 부담금<br><br>
					<a class="customer">전액</a>
				</label>
				<label class="insuranceRadio">
					<input type="radio" id="insurance2" name="insuranceListName" class="insuranceList" onclick="insuranceAdd()" value="${insuranceBasicFee }">
					<a id="insuranceType2">일반자차</a><br>
					<a id="insuranceFeeAdd2" data-value="${insuranceBasicFee}">${insuranceBasicFee }</a>원 추가<br>
					사고 시 고객 부담금<br><br>
					<a class="customer">30만원</a>
				</label>
				<label class="insuranceRadio">
					<input type="radio" id="insurance3" name="insuranceListName" class="insuranceList" onclick="insuranceAdd()" value="${insuranceSpecFee }">
					<a id="insuranceType3">완전자차</a><br>
					<a id="insuranceFeeAdd3" data-value="${insuranceSpecFee}">${insuranceSpecFee }</a>원 추가<br>
					사고 시 고객 부담금<br><br>
					<a class="customer">면제</a>
				</label>
					<div id="insuranceDetail" class="clear">
						<a>보장 내용 알아보기</a>	
					</div>
			</div>
			<br><br>
			
<!-- 			운전자 정보 입력			 -->			
			<div id="driverInfo"  class="clear">
				<div id="driverInfoForm">
					<h3>운전자 정보 입력</h3>
					<a href="#" id="myInfoLoad">내 정보에서 불러오기</a>
					<br><br>
					<div id="driverInfoList">
						<div id="driverInfo1" class="clear">
							<h4>기본정보</h4><br>
							이름<br>
							<input type="text" name="dri_name" id="dri_name"  placeholder="운전자 이름을 입력해주세요" required ><br><br>
							휴대폰번호<br>
							<input type="text" name="dri_tel" id="dri_tel" placeholder="운전자 전화번호를 입력해주세요"  maxlength="13" required><br><br>
							생년월일<br>
							<input type="text"  name="dri_birthday" id="dri_birthday"  placeholder="운전자 생년월일을 입력해주세요" required><br><br>
<!-- 							주소<br> -->
<!-- 							<input type="text" placeholder="주소검색을 통해 입력해주세요" id="address"><br> -->
<!-- 							<input type="button" value="주소검색"> -->
						</div>
						<div id="driverInfo2">
							<h4>운전면허정보</h4>
							<img src="${pageContext.request.servletContext.contextPath}/resources/images/licensephoto.png"  id="driverImage" height="120px"><br>
							면허종류<br>
							<select name="lic_info" id="lic_info" required>
								<option value="">면허종류를 선택해주세요</option>
								<option value="2종보통">2종보통</option>
								<option value="1종보통">1종보통</option>
								<option value="1종특수-대형견인차(트레일러)">1종특수-대형견인차(트레일러)</option>
								<option value="1종특수-구난차(레커)">1종특수-구난차(레커)</option>
								<option value="1종특수-소형견인차">1종특수-소형견인차</option>
								<option value="국제면허">국제면허</option>
							</select><br>
							면허번호<br>
								<input type="text" name="lic_num" id="lic_num" size="20" placeholder="면허번호를 입력해주세요" maxlength="12" required><br>
							발급일자<br>
								<input type="text" name="lic_issue_date" id="lic_issue_date" placeholder="예) 20211010" size="20" maxlength="8" required><br>
							만료일자<br>
								<input type="text" name="lic_expiration_date" id="lic_expiration_date" placeholder="예) 20251231" size="20" maxlength="8" required><br>
						</div>
					</div>
				</div>		
			</div>
		</section>

<!-- 			오른쪽 사이드 영역			 -->
		<aside id="sideContent">
			<form action="ReservationAdd" id="reservationForm" name="reservation" method="post">
				<img src="${pageContext.request.contextPath}/resources/upload/${param.car_model_image}" id="campingcarImage" height="120px">
					<div class="sideDiv">
<!-- 						이름으로 바꿔야 함        -->
						<a>${sId}님의 여정</a> 
						<div class="clear">
							<a>
							<c:choose>
								<c:when test="${carDetail.brc_idx eq 5101}">--캠핑갈카 부산본점</c:when>
								<c:otherwise>캠핑갈카 서울지점</c:otherwise>
							</c:choose>
							</a>
					          <hr>
							<a>${param.res_rental_date} <br> ~ ${param.res_return_date}</a>
					          <hr>
							<a>${carDetail.car_model}</a>
						</div>
					</div>
					<div class="sideDiv">	
						결제내역<br>
						표준가 <a id="rentalFee" data-value="${param.rentalFee}">${param.rentalFee}</a>원
						<hr>
						총 결제금액 <a id="rentalFee2" data-value="${param.rentalFee2}">${param.rentalFee}</a>원
					</div>	
						<input type="hidden" name="res_rental_date" value="${param.res_rental_date}">
						<input type="hidden" name="res_return_date" value="${param.res_return_date}">
						<input type="hidden" name="car_idx" value="${carDetail.car_idx}">
						<input type="hidden" name="rentalFee" value="${param.rentalFee}">
						<input type="hidden" name="brc_idx" value="${carDetail.brc_idx}">
					<div class="nextBtnArea">
<!--     					<input type="hidden" name="rentalFee3" id="rentalFee2Hidden"> -->
						<button type="submit" id="nextBtn">다음</button>
<!-- 						<button type="button" id="nextBtn" onclick="nextPage()">다음</button> -->
		          </div>			
			</form>
		</aside>
		</main>
		
<!-- 		보장내용 알아보기 팝업 -->
	    <div class="insurancePopUp">
	    	<fieldset class="popUpField">
		        <div class="popUpHeader">
			       	 <h2>보장내용을 알아볼까요?</h2>
	   	             <span class="close" id="closePopup">&times;</span>
		        </div>
		        <div class="popUpMessage">
		            <h3>자동차보험 꼭 가입해야 하나요?</h3>
		            캠핑갈카 모든 차량이 ‘자동차 종합보험’에 가입되어 있으니<br>
					보험 가입하고 든든하게 보장받으세요.<br><br>
					<h3>‘일반자차’와 ‘완전자차’ 차이점을 알고싶어요</h3>
					‘고객부담금’을 제외한 나머지 보장 내용이 같아요.<br>
					 단, 보험을 선택하지 않으면 사고 시 모든 비용을 부담해야 해요.<br>
					<table border="1">
						<tr>
							<td>구분</td>
							<td>선택안함</td>
							<td>일반자차</td>
							<td>완전자차</td>
						</tr>
						<tr>
							<td>고객 부담금<br>(자차 수리비)</td>
							<td>전액</td>
							<td>30만원</td>
							<td>면제</td>
						</tr>
						<tr>
							<td>대인</td>
							<td colspan="3">무한대</td>
						</tr>
						<tr>
							<td>대물</td>
							<td colspan="3">건당 2천만원까지</td>
						</tr>
						<tr>
							<td>자손</td>
							<td colspan="3">인당 1천 5백만원까지</td>
						</tr>
					</table> 
					 &#128712; 자손 : 나의 신체가 다친 경우<br>
					 &#128712; 대물 : 다른 사람의 물건(차량)에 손해를 입힌 경우<br>
					 &#128712; 대인 : 다른 사람의 신체를 다치게 한 경우<br><br>
		            <h3>휴차보상료가 뭔가요?</h3>	
		            차량 사고시 수리 기간 동안 할인이 적용되지 않은 표준대여료(24시간 기준)의 50%를 고객(임차인)에게 청구하는데<br>
					이 요금을 휴차보상료(또는 휴차료)라고 해요.<br><br>
					- ‘완전 자차’ 보험 가입 시 단순 사고일 경우 휴차보상료가 면제 돼요.<br>
					-  단, ‘완전 자차’ 보험을 가입했어도 전손 처리 혹은 폐차 시 휴차보상료가 부과 돼요.<br>
					 &#128712; 임대차 계약서 > 보험 보상 관련 약관에서 확인 가능	<br><br>
					 <h3>보험 가입 후 사고 났을 때 어떻게 처리되나요?</h3>	
					 한 번의 사고만 보장해요. 운전 중 사고가 났다면<br>
					 캠핑갈카 고객센터 (1599-9111)로 전화주세요.<br>
					 <br>
 		        	<input type="button" value="확인했어요" class="agreementConfirm">
		        </div>		        
	        </fieldset>
	    </div>		
	    
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


