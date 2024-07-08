<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운전면허정보 입력</title>
<link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/license_info.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style type="text/css">
/* 팝업 스타일 */
/* 고유식별정보 수집 및 이용 동의(필수)  */
/*  개인정보 수집 및 이용 동의(필수)  */
.popUp1, .popUp2 {
    display: none;
    position: fixed;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    background-color: #fff;
    border: 1px solid #ccc;
    padding: 20px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    z-index: 1000;
}
.popUpHeader1, .popUpHeader2 {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.popUpHeader1 h2, .popUpHeader2 h2 {
    margin: 0;
    font-size: 16px;
}
.popUpContent1 tr, .popUpContent2 tr {
    background-color: #e0e0e0;
}
.popUpHeader1 .close, .popUpHeader2 .close {
    cursor: pointer;
    font-size: 16px;
}
.popUpContent1, .popUpContent2 {
    margin: 20px 0;
}
.popUp1 table, .popUp2 table {
    width: 100%;
    border-collapse: collapse;
}
.popUp1 table, .popUp1 th, .popUp1 td,
.popUp2 table, .popUp2 th, .popUp2 td {
    border: 1px solid #ccc;
}
.popUp1 th, .popUp1 td, .popUp2 th, .popUp2 td {
    padding: 8px;
    text-align: center;
}
.popUpConfirm1, .popUpConfirm2 {
    text-align: center;
}
.popUpConfirm1 button, .popUpConfirm2 button {
    padding: 10px 20px;
    background-color: #81c147;
    color: white;
    border: none;
    cursor: pointer;
}
.popUpConfirm1 button:hover, .popUpConfirm2 button:hover {
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
}

.confirmBtn1, .confirmBtn2 { /* "확인했어요" 버튼 */
    border-radius: 10px;
}
</style>
<!--------------- CSS 끝 -------------->

<script type="text/javascript">
	function check_all(checked) {
		for(consent of document.licenseForm.consent) {
			consent.checked = checked;
		}
	}
	
	// 1-1 면허번호 입력란에 입력 후 빠져나갈 때 (blur) 면허번호 입력값 체크하기
	function checkLicense() {
	    // 면허번호 입력값 가져오기
	    let licenseNum = $("#license_number").val();

	    // 면허번호 검증 결과 메시지 출력에 사용될 변수 선언
	    let msg = "";
	    let color = "";

	    // 면허번호 길이 및 종류 검증 : 한글, 숫자 조합 12자리
	    let lengthRegex = /^[가-힣\d]{12}$/;

	    if (lengthRegex.test(licenseNum)) { // 면허번호 길이 검사 적합
	        msg = "적합한 번호";
	        color = "green";
	    } else { // 면허번호 검사 부적합
	        msg = "면허번호를 입력해주세요";
	        color = "red";
	    }

	    // 결과 메시지와 색상 설정
	    $("#checkLicenseResult").text(msg);
	    $("#checkLicenseResult").css("color", color);
	}
	
	
	// 1-2. 발급일자 입력란에 입력 후 빠져나갈 때(blur) 발급일자 입력값 체크하기
	function checkIssueDate() {
	    // 발급일자 입력값 가져오기
	    let issueDate = $("#issue_date").val();
	    
	    // 발급일자 길이 및 종류 검증 : YYYYMMDD 숫자 8자리
	    let issueLengthRegex = /^\d{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
	    
	    if(issueLengthRegex.test(issueDate)) { // 입력된 숫자 8자리 적합
	        $("#checkIssueDateResult").text("적합한 양식입니다.");
	        $("#checkIssueDateResult").css("color", "green");
	    } else {
	        // 월 일치 여부 규칙
	        let monthRegex = /^\d{4}(0[1-9]|1[0-2])/; 
	        
	        // 일 일치 여부 규칙
	        let dayRegex = /^\d{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
	        
	        if (!monthRegex.test(issueDate)) { // 월 숫자 2자리 부적합
	            $("#checkIssueDateResult").text("존재하지 않은 월을 입력했어요. 다시 입력해주세요");
	            $("#checkIssueDateResult").css("color", "red");
	        } else if (!dayRegex.test(issueDate)) { // 일 숫자 2자리 부적합
	            $("#checkIssueDateResult").text("존재하지 않은 일을 입력했어요. 다시 입력해주세요");
	            $("#checkIssueDateResult").css("color", "red");
	        } else { // 입력된 값 부적합
	            $("#checkIssueDateResult").text("발급일자를 입력해주세요");
	            $("#checkIssueDateResult").css("color", "red");
	        }
	    }
	}
	// 1-3. 만료일자 입력란에 입력 후 빠져나갈 때(blur) 만료일자 입력값 체크하기
	function checkExpDate() {
	    // 만료일자 입력값 가져오기
	    let expDate = $("#exp_date").val();
	    
	    // 만료일자 길이 및 종류 검증 : YYYYMMDD 숫자 8자리
	    let expLengthRegex = /^\d{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
	    
	    if(expLengthRegex.test(expDate)) { // 입력된 숫자 8자리 적합
	        $("#checkExpDateResult").text("적합한 양식입니다.");
	        $("#checkExpDateResult").css("color", "green");
	    } else {
	        // 월 일치 여부 규칙
	        let monthRegex2 = /^\d{4}(0[1-9]|1[0-2])/; 
	        
	        // 일 일치 여부 규칙
	        let dayRegex2 = /^\d{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
	        
	        if (!monthRegex2.test(expDate)) { // 월 숫자 2자리 부적합
	            $("#checkExpDateResult").text("존재하지 않은 월을 입력했어요. 다시 입력해주세요");
	            $("#checkExpDateResult").css("color", "red");
	        } else if (!dayRegex2.test(expDate)) { // 일 숫자 2자리 부적합
	            $("#checkExpDateResult").text("존재하지 않은 일을 입력했어요. 다시 입력해주세요");
	            $("#checkExpDateResult").css("color", "red");
	        } else { // 입력된 값 부적합
	            $("#checkExpDateResult").text("만료일자를 입력해주세요"); 
	            $("#checkExpDateResult").css("color", "red");
	        }
	    }
	}

	

	
<!---------- 팝업창 띄우기 ----------> 
$(document).ready(function() {
    // "보기" 링크 클릭 시 팝업 표시
    $(".agree1").click(function(event) {
        event.preventDefault();
        $(".popUp1").show();
    });

    // 팝업 닫기
    $(".popUp1 .close, .popUpConfirm1 button").click(function() {
        $(".popUp1").hide();
    });

    $(".agree2").click(function(event) {
        event.preventDefault();
        $(".popUp2").show();
    });

    // 팝업 닫기
    $(".popUp2 .close, .popUpConfirm2 button").click(function() {
        $(".popUp2").hide();
    });

//     // 전체 동의 체크박스 이벤트 리스너
//     $("#consent_all").click(function() {
//         check_all(this.checked);
//     });
});
<!-- 팝업창 띄우기 끝 -->

</script>
</head>

<body>
    <header>
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </header>
    <main>
        <section>
             <div class="insertLicense">
                <h1>운전면허정보 입력</h1>
                <p class="agreeAndSave"><img src="resources/images/ico_info.png" id="icon" >약관에 동의해야 주소정보를 저장할 수 있어요</p>
                <div class="license_image">
                    <img src="resources/images/licensephoto.png" alt="운전면허증 사진 예시">
                </div>
                <br>
                <div class="form">
                    
                    	<label for="license_name"></label>
                        <label for="license-type">면허종류</label>
                        <select id="license-type">
                            <option value="" selected>면허종류를 선택해주세요</option>
                            <!-- 면허 종류 -->
                            <option value="2_ordinary">2종보통</option>
                            <option value="1_ordinary">1종보통</option>
                            <option value="1_special_rescue">1종특수 - 구난차</option>
                            <option value="1_special_big">1종특수 - 대형견인차(트레일러)</option>
                            <option value="1_special_small">1종특수 - 소형견인차</option>
                            <option value="international">국제면허</option>
                        </select>

                        <label for="license_number">면허번호</label>
                        <input type="text" id="license_number" placeholder="면허번호를 입력해주세요" onblur="checkLicense()" required maxlength="12">
                        <a id="checkLicenseResult"></a><br>
							
                        <label for="issue_date">발급일자</label>
                        <input type="text" id="issue_date" placeholder="예) 20211001" onblur="checkIssueDate()" maxlength="8" required>
						<a id="checkIssueDateResult"></a><br>
						
                        <label for="exp_date">만료일자</label>
                        <input type="text" id="exp_date" placeholder="예) 20251231" onblur="checkExpDate()" maxlength="8" required>
						<a id="checkExpDateResult"></a><br>
					<form name="licenseForm">	
                        <div class="consent_list">
                            <div class="consent_details">
                                <input type="checkbox" id="consent_all" name="consent" onclick="check_all(this.checked)">
                                <label for="consent_all">전체동의</label>
                            </div>
                            <div class="consent_details1">
                                <input type="checkbox" id="consent_person" name="consent" required>
                                <span><label for="consent_person">개인정보 수집 및 이용 동의(필수)</label>
                                 <a href="#" class="agree1">보기</a></span>
                            </div>
                            <div class="consent_details2">
                                <input type="checkbox" id="consentCollect" name="consent" required>
                                <label for="consentCollect">고유식별정보 수집 및 이용 동의(필수)</label>
                                <span><a href="#" class="agree2">보기</a></span>
                            </div>
                        </div>
                    </form>
                </div>
                <br>
                <div align="center">
                    <input type="button"  class="licenseInputBtn" value="운전자 정보를 입력해 주세요" onclick="location.href=">
                </div>
             </div>
        </section>
    </main>
    
    <!-- 팝업1 -->
    <div class="popUp1">
        <div class="popUpHeader1">
            <h2>고유식별정보 수집 및 이용 동의(필수)</h2>
            <span class="close">&times;</span>
        </div>
        <div class="popUpContent1">
            <table>
                <tr>
                    <th>수집항목</th>
                    <th>수집·이용 목적</th>
                    <th>보유기간</th>
                </tr>
                <tr>
                    <td>운전면허번호</td>
                    <td>차량대여자격확인</td>
                    <td>회원탈퇴 후 즉시 또는 계약에 따른 거래관계의 종료 후 5년까지</td>
                </tr>
            </table>
            <p>고객님께서는 동의를 거부할 권리가 있으며, 동의하지 않아도 캠핑갈카 회원서비스 이용이 가능하지만 
            미리 입력하시면 차량 예약 시 자동으로 입력되어 더욱 간편하게 이용하실 수 있습니다.</p>
        </div>
        <div class="popUpConfirm1">
            <button class="confirmBtn1">확인했어요</button>
        </div>
    </div>
    
    <!-- 팝업2 -->
    <div class="popUp2">
        <div class="popUpHeader2">
            <h2>개인정보 수집 및 이용 동의(필수)</h2>
            <span class="close">&times;</span>
        </div>
        <div class="popUpContent2">
            <table>
                <tr>
                    <th>수집항목</th>
                    <th>수집·이용 목적</th>
                    <th>보유기간</th>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>과태료 또는 채권 발행 시 고지서 발송</td>
                    <td>회원탈퇴 후 즉시 또는 계약에 따른 거래관계의 종료 후 5년까지</td>
                </tr>
            </table>
            <p>고객님께서는 동의를 거부할 권리가 있으며, 동의하지 않아도 캠핑갈카 회원서비스 이용이 가능하지만 
            미리 입력하시면 차량 예약 시 자동으로 입력되어 더욱 간편하게 이용하실 수 있습니다.</p>
        </div>
        <div class="popUpConfirm2">
            <button class="confirmBtn2">확인했어요</button>
        </div>
    </div>
</body>
</html>
