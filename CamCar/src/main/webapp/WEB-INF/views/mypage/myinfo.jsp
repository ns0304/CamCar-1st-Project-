<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/license_info.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/address_info.css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<%-- 다음 우편번호 API --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
/* 팝업 스타일 */
/* -----------------------  비밀번호 변경 팝업 CSS  --------------------- */
.passwdPopUp {
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
.popUpHeader {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.popUpHeader h2 {
    margin: 0;
    font-size: 16px;
}

/* .popUpContent tr { */
/* 	background-color: #e0e0e0; */
	
/* } */
.popUpHeader .close {
    cursor: pointer;
    font-size: 16px;
}
.changeField { 
     margin: 1px 0;
     margin-bottom: 1px; 
     margin-top: 1px; 
 } 
/* .changeField { 
   width: 100%; 
   border-collapse: collapse; 
 } 
/* .popUp table, .popUp th, .popUp td { */
/*     border: 1px solid #ccc; */
/* } */
/* .popUp th, .popUp td { */
/*     padding: 8px; */
/*     text-align: center; */
/* } */
.popUpChangePasswd {
    text-align: center;
}
.popUpChangePasswd button {
    padding: 10px 20px;
    background-color: #f68b1f;
    color: white;
    border: none;
    cursor: pointer;
}
.popUpChangePasswd button:hover {
    background-color: #f68b1f;
}

.popUpChangePasswd { /* "확인했어요" 버튼 */
border-radius: 10px;
}
/* -----------------------  비밀번호 변경 팝업 CSS 끝  --------------------- */	
/* -----------------------  마케팅 동의 팝업 CSS  --------------------- */	
.popUpMarketing {
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
.MarketingPopUpHeader {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #ccc;
    padding-bottom: 10px;
    margin-bottom: 10px;
}
.MarketingPopUpHeader h2 {
    font-size: 18px;
    font-weight: bold;
    margin: 0;
}
.close {
    font-size: 24px;
    cursor: pointer;
}
.table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 10px;
}
.table, .table th, .table td {
    border: 1px solid #ccc;
}
.table th, .table td {
    padding: 8px;
    text-align: left;
}
.note {
    font-size: 12px;
    margin-bottom: 10px;
}
.checkbox-container {
    display: flex;
    flex-direction: column;
    gap: 5px;
    margin-bottom: 10px;
}
.consent_details {
    display: flex;
    align-items: center;
}
.consent_details input[type="checkbox"] {
    margin-right: 5px;
}
.MarketingPopUpConfirm {
    display: flex;
    justify-content: center;
}
.confirmBtn1 {
    background-color: #f8a459;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
}
/* ------------------ 마케팅 동의 팝업 CSS 끝 ------------------ */


.popUpLeaving {
	display: none;
	top: 50%;
	left: 50%;
    position: fixed; /* 팝업 위치 설정 */
    transform: translate(-50%, -50%);
    width: 350px; /* 팝업 너비 설정 */
    border: 1px solid #ccc; /* 팝업 테두리 설정 */
    padding: 10px; /* 팝업 내부 여백 설정 */
    border-radius: 10px; /* 팝업 모서리 둥글게 설정 */
    box-shadow: 0 5px 15px rgba(0,0,0,0.3); /* 팝업 그림자 효과 설정 */
    background-color: #fff; /* 팝업 배경색 설정 */
    margin: 0 auto; /* 팝업 중앙 정렬 */
}
.LeavingPopUpHeader {
    display: flex; /* 헤더 내 요소들을 플렉스 컨테이너로 설정 */
    justify-content: space-between; /* 헤더 내 요소들 간격을 양 끝으로 설정 */
    align-items: center; /* 헤더 내 요소들을 수직 중앙 정렬 */
    border-bottom: 1px solid #ccc; /* 헤더 하단 테두리 설정 */
    padding-bottom: 10px; /* 헤더 하단 여백 설정 */
    margin-bottom: 10px; /* 헤더와 다음 요소 사이 여백 설정 */
}
.LeavingPopUpHeader h2 {
    font-size: 18px; /* 헤더 제목 폰트 크기 설정 */
    font-weight: bold; /* 헤더 제목 폰트 굵기 설정 */
    margin: 0; /* 헤더 제목 외부 여백 설정 */
}
.close {
    font-size: 24px; /* 닫기 버튼 폰트 크기 설정 */
    cursor: pointer; /* 닫기 버튼에 커서 포인터 설정 */
}
.LeavingMessage {
    text-align: center; /* 메시지 중앙 정렬 */
    margin: 10px 0; /* 메시지 상하 여백 설정 */
}
.warningBox {
    border: 1px solid #ccc; /* 경고 상자 테두리 설정 */
    border-radius: 10px; /* 경고 상자 모서리 둥글게 설정 */
    background-color: #f9f9f9; /* 경고 상자 배경색 설정 */
    padding: 10px; /* 경고 상자 내부 여백 설정 */
    margin-bottom: 10px; /* 경고 상자와 다음 요소 사이 여백 설정 */
}
.warningHeader {
    font-weight: bold; /* 경고 헤더 폰트 굵기 설정 */
    margin-bottom: 5px; /* 경고 헤더 하단 여백 설정 */
    display: flex; /* 경고 헤더 내 요소들을 플렉스 컨테이너로 설정 */
    align-items: center; /* 경고 헤더 내 요소들을 수직 중앙 정렬 */
}
.warningHeader img {
    margin-right: 5px; /* 경고 아이콘과 텍스트 사이 여백 설정 */
}
.warningText {
    font-size: 12px; /* 경고 내용 폰트 크기 설정 */
}
.checkboxArea {
    display: flex; /* 체크박스 영역을 플렉스 컨테이너로 설정 */
    align-items: center; /* 체크박스와 라벨을 수직 중앙 정렬 */
    margin-bottom: 10px; /* 체크박스 영역과 다음 요소 사이 여백 설정 */
}
.checkboxArea input[type="checkbox"] {
    margin-right: 5px; /* 체크박스와 라벨 사이 여백 설정 */
}
.leavingBtns {
    display: flex; /* 버튼들을 플렉스 컨테이너로 설정 */
    justify-content: space-between; /* 버튼들을 양 끝으로 정렬 */
}
.withdraw, .continueBtn {
    width: 48%; /* 버튼 너비 설정 */
    padding: 10px; /* 버튼 내부 여백 설정 */
    border: none; /* 버튼 테두리 없음 */
    border-radius: 5px; /* 버튼 모서리 둥글게 설정 */
    cursor: pointer; /* 버튼에 커서 포인터 설정 */
    text-align: center; /* 버튼 텍스트 중앙 정렬 */
}
.withdraw {
    background-color: #ccc; /* 탈퇴 버튼 배경색 설정 */
    color: black; /* 탈퇴 버튼 텍스트 색상 설정 */
}
.continueBtn {
    background-color: #f8a459; /* 계속 이용할게요 버튼 배경색 설정 */
    color: white; /* 계속 이용할게요 버튼 텍스트 색상 설정 */
}


</style>
<script type="text/javascript">

// 1. 마케팅 전체 동의 
function check_all2(checked) {
	for(consent of document.marketingForm.consent2) {
		consent.checked = checked;
	}
}

// 2. 운전면허 정보 전체 동의
function check_all(checked) {
	for(consent of document.licenseForm.consent) {
		consent.checked = checked;
	}
}


// 3. 비밀번호 입력란에 입력 후 빠져나갈 때(blur) 비밀번호 입력값 체크하기
function checkPasswd() {
	// 패스워드 입력값 가져오기
	let mem_passwd = $("#mem_passwd").val();
	
	// 패스워드 검증 결과 메세지 출력에 사용될 변수 선언
	let msg = "";
	let color = "";
	let bgColor = "";
	
	// 1) 패스워드 길이 및 종류 검증 : 영문자(대소문자), 숫자, 특수문자(!@#$%) 조합 8 ~ 16자리
	let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
	
	if(lengthRegex.exec(mem_passwd)) { // 패스워드 길이 검사 적합
		// 2) 패스워드 복잡도(안전도) 검사
		//    => 영문 대문자 or 소문자 or 숫자 or 특수문자(!@#$%) 중 최소 2가지 이상 조합
		//    => 단, 부분 검사를 수행하므로 시작(^)과 끝($) 기호는 제외하고 표현식 작성
		// 2-1) 영문자 대문자 검사 규칙
		let engUpperRegex = /[A-Z]/;
		// 2-2) 영문자 소문자 검사 규칙
		let engLowerRegex = /[a-z]/;
		// 2-3) 숫자 검사 규칙
		let numRegex = /\d/; // /[0-9]/ 동일
		// 2-4) 특수문자(!@#$%) 검사 규칙
		let specRegex = /[!@#$%]/;
		
		// 각 규칙에 대한 부분 검사를 통해 일치하는 항목 카운팅 변수 선언
		// => 일치하는 규칙마다 +1 처리
		let count = 0;
		
		if(engUpperRegex.exec(mem_passwd)) { count++; } // 대문자 포함
		if(engLowerRegex.exec(mem_passwd)) { count++; } // 소문자 포함
		if(numRegex.exec(mem_passwd)) { count++; } // 숫자 포함
		if(specRegex.exec(mem_passwd)) { count++; } // 특수문자(!@#$%) 포함
		
		// 복잡도 검사 결과 판별하여 id 선택자 checkPasswdComplexResult 영역에 출력
		// 4점 : 안전(초록색 - green)
		// 3점 : 보통(주황색 - orange)
		// 2점 : 위험(빨간색 - red)
		// 1점 이하 : id 선택자 "checkPasswdResult" 에 사용불가 메세지 출력(빨간색)
		let complexityMsg = "";
		let complexityColor = "";
		
		if(count == 4) {
			complexityMsg = "안전";
			complexityColor = "green";
		} else if(count == 3) {
			complexityMsg = "보통";
			complexityColor = "orange";
		} else if(count == 2) {
			complexityMsg = "위험";
			complexityColor = "red";
		} else if(count <= 1) {
			msg = "영문자, 숫자, 특수문자(!@#$%) 조합 8 ~ 16글자";
			color = "red";
			bgColor = "lightpink";
			checkPasswdResult = false; // 패스워드 검사 적합 여부 false(부적합) 값 저장
		}

		if(count >= 2) {
			$("#checkPasswdComplexResult").text(complexityMsg);
			$("#checkPasswdComplexResult").css("color", complexityColor);
			checkPasswdResult = true; // 패스워드 검사 적합 여부 true(적합) 값 저장
		}
		
	} else { // 패스워드 길이 검사 부적합
		msg = "영문자, 숫자, 특수문자(!@#$%) 조합 8 ~ 16글자";
		color = "red";
		bgColor = "lightpink";
		
		checkPasswdResult = false; // 패스워드 검사 적합 여부 false(부적합) 값 저장
	}
	
	$("#checkPasswdResult").text(msg);
	$("#checkPasswdResult").css("color", color);
	$("#mem_passwd").css("background", bgColor);
}

// 4. 비밀번호확인 입력란에 키를 누를때마다 비밀번호와 같은지 체크하기
function checkSamePasswd() {
	let mem_passwd = document.joinForm.mem_passwd.value; // 패스워드
	let mem_passwd2 = document.joinForm.mem_passwd2.value; // 패스워드 확인
	
	if(mem_passwd == mem_passwd2) { // 입력된 두 패스워드가 같은지 판별
		// 옆쪽 빈 공간(span 태그 영역)에 "비밀번호 일치" 초록색으로 표시
		// 아니면, "비밀번호 불일치" 빨간색으로 표시
		document.querySelector("#checkPasswd2Result").innerText = "비밀번호 일치";
		document.querySelector("#checkPasswd2Result").style.color = "BLUE";
		checkPasswd2Result = true; // 패스워드 확인 검사 적합 여부 true(적합) 값 저장
	} else {
		document.querySelector("#checkPasswd2Result").innerText = "비밀번호 불일치";
		document.querySelector("#checkPasswd2Result").style.color = "RED";
		checkPasswd2Result = false; // 패스워드 확인 검사 적합 여부 false(부적합) 값 저장
	}
}
//========================================================================================================
	
	
	
$(document).ready(function() {
	
	//======================= 비밀번호 변경 팝업창 =======================
	//"보기" 링크 클릭 시 팝업 표시
	$(".changePasswd").click(function(event) {
	    event.preventDefault();
	    $(".passwdPopUp").show();
	});
	
	// 팝업 닫기
	$(".popUpHeader .close, .popUpChangePasswd button").click(function() {
	    $(".passwdPopUp").hide();
	});
	//======================= 비밀번호 변경 팝업창 끝 =======================
	//=======================================================================
		
		
	//======================= 마케팅 활용 동의 팝업창 =======================
	//"마케팅 활용 동의" 링크 클릭 시 팝업 표시
	$(".marketingAgree1").click(function(event) {
	    event.preventDefault();
	    $(".popUpMarketing").show();
	});
	
	// 팝업 닫기
	$(".MarketingPopUpHeader .close, .MarketingPopUpConfirm button").click(function() {
	    $(".popUpMarketing").hide();
	});
	//======================= 마케팅 활용 동의 팝업창 끝 =======================
	
		
	//======================= 회원탈퇴 팝업창 =======================
	//"회원탈퇴" 링크 클릭 시 팝업 표시
	$(".memberWithdraw").click(function(event) {
	    event.preventDefault();
	    $(".popUpLeaving").show();
	});
	
	// 팝업 닫기
	$(".LeavingPopUpHeader .close, .leavingBtns button").click(function() {
	    $(".popUpLeaving").hide();
	});
	//======================= 회원탈퇴 팝업창 끝 =======================
		
		
		
	//======================= 주소 변경 팝업창 =======================
	//"(주소)변경" 링크 클릭 시 팝업 표시
	$(".changeAddress").click(function(event) {
	    event.preventDefault();
	    $(".addressInfoChange").show();
	});
	
	// 팝업 닫기
	$(".AddressHeader .close, .submit_section button").click(function() {
	    $(".addressInfoChange").hide();
	});
	//======================= 주소 변경 팝업창 끝 =======================
	//======================= 주소 변경 팝업창 > 주소 API 및 약관 동의 팝업 =======================
		
	//주소 검색 API 활용 기능 추가
    $("#btnSearchAddress").click(function() {
        new daum.Postcode({
            oncomplete: function(data) { 
                $("#mem_post_code").val(data.zonecode);
                let address = data.address;
                if(data.buildingName !== ''){
                   address += "(" + data.buildingName + ")";
                }
                $("#mem_add1").val(address);
                $("#mem_add2").focus();
            }
        }).open();
    });

    // "보기" 링크 클릭 시 팝업 표시
    $(".view").click(function(event) {
        event.preventDefault();
        $(".popUp").show();
    });

    // 팝업 닫기
    $(".popUp .close, .popUpConfirm button").click(function() {
        $(".popUp").hide();
    });
	//======================= 주소 변경 팝업창 > 주소 api 및 약관 동의 팝업 끝 =======================
	
	// 운전면허 변경 팝업 열기	
	$(".changeLicense").click(function(event) {
        event.preventDefault();
        $(".insertLicense").show();
    });

    // 운전면허 변경 팝업 닫기
    $(".LicenseInfoHeader .close, .LicenseInfoInsert button").click(function() {
        $(".insertLicense").hide();
    });		
    
	//-------------------------------------------------------------	
		
	// ----------------운전면허 약관 동의 팝업 창------------------	
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
		
		
		
}); 

//----------------------------------------------------------------------------------------------------
// 1-1 면허번호 입력란에 입력 후 빠져나갈 때 (blur) 면허번호 입력값 체크하기
	function checkLicense() {
	    // 면허번호 입력값 가져오기
	    let licenseNum = $("#lic_num").val();

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
	}  // checkLicense() 함수 끝
	
	
	// 1-2. 발급일자 입력란에 입력 후 빠져나갈 때(blur) 발급일자 입력값 체크하기
	function checkIssueDate() {
	    // 발급일자 입력값 가져오기
	    let issueDate = $("#lic_issue_date").val();
	    
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
	}  // checkIssueDate() 함수 끝
	
	
	// 1-3. 만료일자 입력란에 입력 후 빠져나갈 때(blur) 만료일자 입력값 체크하기
	function checkExpDate() {
	    // 만료일자 입력값 가져오기
	    let expDate = $("#lic_expiration_date").val();
	    
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
	} // checkExpDate() 함수 끝

//=========================================================================================
	
	// 로그아웃 여부를 확인할 confirmLogout() 함수 정의
	function confirmLogout() {
		// 확인창(confirm 다이얼로그)를 통해 "로그아웃하시겠습니까?" 에 대한 확인 작업 수행
		let isLogout = confirm("로그아웃하시겠습니까?"); // true/false 리턴
		
		// isLogout 변수값이 true 일 경우 로그아웃 작업을 수행할 "MemberLogout" 서블릿 요청
		if(isLogout) {
			location.href = "MemberLogout";
		}
	}

</script>
</head>
<body>
	<header>
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/MVC_Board = webapp) 이므로 inc 디렉토리의 top.jsp 지정 --%>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<main>
		<section>
			<div>
				<div>
				<h1>내 정보 관리</h1>
					<a href="MemberInfo">마이페이지 홈으로</a>
				</div>
				<form action="" method="post">
					<fieldset>
						<div>
							<p>아이디</p>
							<input type="text" id="mem_id" name="mem_id" value="${member.mem_id}" readonly>
						</div>
						<hr>
						<div>
							<span>비밀번호</span><a href="changePasswd" class="changePasswd">변경</a>
							<p>개인정보 보호를 위해 주기적으로 변경해주세요</p>
						</div>
						<div>
							<span>휴대폰 번호</span><a href="changePhoneNum" class="changePhoneNum">본인 인증 후 변경</a>
							<input type="text" id="mem_tel" name="mem_tel" value="${member.mem_tel}" readonly>
						</div>
					</fieldset>
					<br>
					<h3>추가 정보</h3>
					<fieldset>
						<div>
							<span>주소</span><a href="changeAddress" class="changeAddress">변경</a>
							<p>주소를 등록해 주세요</p>
						</div>
						<div>
							<span>운전면허 정보</span><a href="changeLicense" class="changeLicense">변경</a>
							<p>운전면허정보를 등록해 주세요</p>
						</div>
					</fieldset>
					<br>
					<h3>계정관리</h3>
					<fieldset>
						<div class="marketingAgree1">
							<a href="marketingAgree" class="marketingAgree2">마케팅 활용 동의</a>
						</div>
						<hr>
						<div class="logOut">
							<label><a href="javascript:confirmLogout()">로그아웃</a></label>
						</div>
						<hr>
						<div class="memberWithdraw">
							<label><a href="withdrawBtn">회원탈퇴</a></label>
						</div>
					</fieldset>
				</form>
			</div>
		</section>
	</main>
	<!----------------------------- 비밀번호 변경 팝업 ----------------------------->
    <div class="passwdPopUp">
    	<fieldset class="changeField">
    		<form action="MyInfoModify" method="POST">
					<input type="hidden" name="mem_tel" value="${member.mem_tel}" id="mem_tel" size="10">	
	        <div class=popUpHeader>
	        	<h2>새로운 비밀번호를 입력해주세요</h2>
	        	<span class="close">&times;</span>
	        </div>
<!-- 	        <div class="popUpOldPasswd"> -->
<!-- 	            <a>기존 비밀번호</a> -->
<!--                 <input type="password" name="oldPasswd" id="oldPasswd" onblur="checkPasswd()" required><br> -->
<!--                 <a>기존 비밀번호를 입력해주세요</a> -->
<!-- 	        </div> -->
	        <br>
	        <div class="popUpNewPasswd">
	            <a>새 비밀번호</a>
                <input type="password" name="mem_passwd" id="mem_passwd" onblur="checkPasswd()" required><br>
                <a>영문, 숫자, 특수문자 포함 10 ~ 20자 이내</a>
	        </div>
	        <br>
	        <div class="popUpNewPasswdConfirm">
	            <a>새 비밀번호 확인</a>
	            <input type="password" name="mem_passwd2" id="mem_passwd2" onblur="checkSamePasswd()" required>
	        </div>
	        <br>
	        <div class="popUpChangePasswd" >
<!-- 	            <button class="confirmBtn" onclick="location.href='MyInfoModify'">새로운 비밀번호를 입력해 주세요</button> -->
					<input type="submit" value="새로운 비밀번호를 입력해 주세요">
	        </div>
	        </form>
        </fieldset>
    </div>
    <!----------------------------- 비밀번호 변경 팝업 끝 ----------------------------->
    <!-- ================================================================================================================ -->
    
    
    <!------------------------------ 본인인증 팝업 ------------------------------->
    <!----------------------------- 본인인증 팝업 끝 ----------------------------->
    
    
    <!-- ================================================================================================================ -->
    
    <!------------------------------ 주소 변경 팝업 ------------------------------->
    
    <div class="addressInfoChange">
    	<fieldset class="addressField">
    		<div class="AddressHeader">
            	<h1>주소 정보 변경</h1>
            	<span class="close">&times;</span>
            </div>
            <div class="infoBox">
                <p>약관에 동의해야 주소정보를 저장할 수 있어요</p>
            </div>
            <form action="MyInfoModify" method="post">
            	<input type="hidden" name="mem_tel" value="${member.mem_tel}" id="mem_tel" size="10">
            	<input type="hidden" name="mem_id" value="${member.mem_id}" id="mem_id" size="10">
                <fieldset class="address_section" id="address_section">
                	
                    <div class="address_section">
                        <p>주소</p>
                    </div>
                    <div class="address_section">
                        <label for="mem_post_code"></label>
                        <input type="text" placeholder="우편번호" value="${member.mem_post_code}" id="mem_post_code" name="mem_post_code" required readonly>
                        <button type="button" class="searchBtn" id="btnSearchAddress">주소검색</button>
                    </div>
                    <div class="address_section">
                        <label for="mem_add1"></label>
                        <input type="text" placeholder="주소" value="${member.mem_add1}" id="mem_add1" name="mem_add1" required>
                    </div>
                    <div class="address_section">
                        <label for="mem_add2"></label>
                        <input type="text" placeholder="상세주소" value="${member.mem_add2}" id="mem_add2" name="mem_add2" >
                    </div>
                </fieldset>
                <fieldset class="agreement_section" id="agree_section">
                    <div class="agreement_section">
                        <input type="checkbox" id="agreement" name="agreement" required>
                        <label for="agreement">개인정보 수집 및 이용 동의 (필수)</label>
                        <a href="#" class="view">보기</a>
                    </div>
                </fieldset>
                <br>
                <div class="submit_section">
                    <button type="submit" class="submitBtn">주소를 입력해주세요</button>
                </div>
            </form>
    	</fieldset>
    </div>
    <!----------------------------- 주소 변경 팝업 끝 ----------------------------->
    
    <!----------------------- 주소 변경 > 개인정보 수집 및 이용 동의 "보기" 팝업 ------------------------>
   <!-- 팝업 -->
    <div class="popUp">
        <div class="popUpHeader">
            <h2>개인정보 수집 및 이용 동의(필수)</h2>
            <span class="close">&times;</span>
        </div>
        <div class="popUpContent">
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
            미리 입력하시면 차량예약 시 자동으로 입력되어 더욱 간편하게 이용하실 수 있습니다.</p>
        </div>
        <div class="popUpConfirm">
            <button class="confirmBtn">확인했어요</button>
        </div>
    </div>
   
    <!----------------------- 주소 변경 > 개인정보 수집 및 이용 동의 "보기" 팝업 끝 ----------------------------->
   
    
    
    
    <!------------------------------ 운전면허정보 변경 팝업 ------------------------------->
    <div class="insertLicense">
    	<div class="LicenseInfoHeader">
	        <h1>운전면허정보 입력</h1>
	        <span class="close">&times;</span>
        </div>
        <p class="agreeAndSave"><img src="resources/images/ico_info.png" id="icon" >약관에 동의해야 주소정보를 저장할 수 있어요</p>
        <div class="license_image">
            <img src="resources/images/licensephoto.png" alt="운전면허증 사진 예시">
        </div>
        <br>
        <div class="form">
            
            	<label for="license_name"></label>
                <label for="license-type">면허종류</label>
                <select id="license-type">
                    <option value="">면허종류를 선택해주세요</option>
                    <!-- 면허 종류 -->
                    <option value="2종보통" <c:if test="${driver.lic_info eq '2종보통'}">selected</c:if>>2종보통</option>
                    <option value="1종보통" <c:if test="${driver.lic_info eq '1종보통'}">selected</c:if>>1종보통</option>
                    <option value="1종특수 - 구난차" <c:if test="${driver.lic_info eq '1종특수 - 구난차'}">selected</c:if>>1종특수 - 구난차</option>
                    <option value="1종특수 - 대형견인차(트레일러)" <c:if test="${driver.lic_info eq '1종특수 - 대형견인차(트레일러)'}">selected</c:if>>1종특수 - 대형견인차(트레일러)</option>
                    <option value="1종특수 - 소형견인차" <c:if test="${driver.lic_info eq '1종특수 - 소형견인차'}">selected</c:if>>1종특수 - 소형견인차</option>
                    <option value="국제면허" <c:if test="${driver.lic_info eq '국제면허'}">selected</c:if>>국제면허</option>
                </select>

                <label for="lic_num">면허번호</label>
                <input type="text" id="lic_num" name ="lic_num" placeholder="면허번호를 입력해주세요" value="${driver.lic_num}" onblur="checkLicense()" required maxlength="12">
                <a id="checkLicenseResult"></a><br>

                <label for="lic_issue_date">발급일자</label>
                <input type="text" id="lic_issue_date" name="lic_issue_date" placeholder="예) 20211001" value="${driver.lic_issue_date}" onblur="checkIssueDate()" maxlength="8" required>
				<a id="checkIssueDateResult"></a><br>

                  <label for="lic_expiration_date">만료일자</label>
                  <input type="text" id="lic_expiration_date" name="lic_expiration_date" placeholder="예) 20251231" value="${driver.lic_expiration_date}" onblur="checkExpDate()" maxlength="8" required>
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
        <div align="center" class="LicenseInfoInsert">
            <input type="button"  class="licenseInputBtn" value="운전자 정보를 입력해 주세요" onclick="location.href=">
        </div>
     </div>
    <!----------------------------- 운전면허정보 변경 팝업 끝 ----------------------------->
    
<!-- ==================================================================================== -->
    <!----------------------------- 운전면허정보 변경 팝업 >>  ----------------------------->
    <!----------------------- 고유식별정보 수집 및 이용 동의(필수)  ------------------------>
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
    
    <!----------------------- 개인정보 수집 및 이용 동의(필수) 팝업  ----------------------------->
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
    <!----------------------- 개인정보 수집 및 이용 동의(필수) 팝업 끝  ----------------------------->
    
    
    
    
    
    
    <!----------------------------- 마케팅 활용 동의 ----------------------------->
    <!-- 팝업 -->
    <div class="popUpMarketing" id="marketingPopup">
	    <fieldset class="MarketingField">
	        <div class="MarketingPopUpHeader">
	            <h2>마케팅활용동의(선택)</h2>
	            <span class="close" id="closePopup">&times;</span>
	        </div>
	        <div class="MarketingpopUpContent1">
	            <table class="table">
		            <tr>
		                <th>수집항목</th>
		                <td>휴대폰번호, 이메일(회원)인 경우 개인 정보수정 메뉴에서 인증</td>
		            </tr>
		            <tr>
		                <th>이용 목적</th>
		                <td>
		                    1. SK엔터카가 제공하는 서비스/상품 또는 제3자 제공하는 서비스가 제휴/결합된 서비스/상품의 제공 및 안내<br>
		                    2. 이벤트 정보/혜택 안내 및 참여 정보 제공
		                </td>
		            </tr>
		            <tr>
		                <th>보유 및 이용기간</th>
		                <td>
		                    계약에 따른 거래관계의 종료 후 1년 또는 등의 철회 시까지 (단, 홈페이지 회원인 경우 탈퇴 또는 동의 철회 시까지)
		                </td>
		            </tr>
	        	</table>
	             <div class="note">
		            마케팅 활용 동의를 선택하지 않아도 '캠핑갈CAR' 서비스는 이용할 수 있으나, 
		            새로운 상품 및 서비스 정보 수신은 제외됩니다. 고객님께서 동의를 거부할 권리가 있으나, 
		            이 동의서 제출 시점 안내에 제한을 받을 수 있습니다. 
		            아래 SMS, 이메일 중 선택 수단에 따라 수집 및 활용되는 항목도 달라집니다.
	        	</div>
	        </div>
	        <form name="marketingForm">
	            <div class="checkbox-container">
	                <div class="consent_details">
	                    <input type="checkbox" id="consent_all2" name="consent2" onclick="check_all2(this.checked)">
	                    <label for="consent_all2">전체동의</label>
	                </div>
	                <div class="consent_details">
	                    <input type="checkbox" id="consent_person2" name="consent2">
	                    <label for="consent_person2">마케팅활용동의(선택)</label>
	                </div>
	                <div class="consent_details">
	                    <input type="checkbox" id="consent_sms" name="consent2">
	                    <label for="consent_sms">SMS 수신동의(선택)</label>
	                </div>
	                <div class="consent_details">
	                    <input type="checkbox" id="consent_email" name="consent2">
	                    <label for="consent_email">이메일 수신동의(선택)</label>
	                </div>
	            </div>
	        </form>
	        <div class="MarketingPopUpConfirm">
	            <button class="confirmBtn1">설정완료</button>
	        </div>
	    </fieldset>
	</div>
    <!----------------------------- 마케팅 활용 동의 끝 ----------------------------->
    
    
    <!------------------------------- 회원탈퇴 팝업 ------------------------------>
     <div class="popUpLeaving" id="leavingPopup">
        <div class="LeavingPopUpHeader">
            <h2>정말로 떠나실건가요?</h2>
            <span class="close" id="closePopup">&times;</span>
        </div>
        <div class="LeavingMessage">
            함께할 그날까지 열심히 하고있을게요<br>
            꼭, 다시 만나요!
        </div>
        <div class="warningBox">
            <div class="warningHeader">
<!--                 <img src="warning_icon.png" alt="Warning" width="16" height="16"> -->
                헤어지기 전에 확인해 주세요
            </div>
            <div class="warningText">
                삭제정보<br>
                회원 정보, 서비스 이용기록<br>
                - 예외관련 정보는 관련 법령에 따라 일정기간 보관될 수 있습니다<br>
                - 재가입 시, 기존 이력이 복구되지 않을 수 있습니다
            </div>
        </div>
        <div class="checkboxArea">
            <input type="checkbox" id="confirmCheck">
            <label for="confirmCheck">위 내용을 확인했습니다</label>
        </div>
        <div class="leavingBtns">
            <button class="withdraw" onclick="location.href='MemberWithdraw'">탈퇴</button>
            <button class="continueBtn">계속 이용할게요</button>
        </div>
    </div>
    
    <!----------------------------- 회원탈퇴 팝업 끝 ----------------------------->
	<footer>
		<!-- 회사 소개 영역 -->
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>