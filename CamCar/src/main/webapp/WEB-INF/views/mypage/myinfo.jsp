<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
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
.cancelBtn, .continueBtn {
    width: 48%; /* 버튼 너비 설정 */
    padding: 10px; /* 버튼 내부 여백 설정 */
    border: none; /* 버튼 테두리 없음 */
    border-radius: 5px; /* 버튼 모서리 둥글게 설정 */
    cursor: pointer; /* 버튼에 커서 포인터 설정 */
    text-align: center; /* 버튼 텍스트 중앙 정렬 */
}
.cancelBtn {
    background-color: #ccc; /* 탈퇴 버튼 배경색 설정 */
    color: black; /* 탈퇴 버튼 텍스트 색상 설정 */
}
.continueBtn {
    background-color: #f8a459; /* 계속 이용할게요 버튼 배경색 설정 */
    color: white; /* 계속 이용할게요 버튼 텍스트 색상 설정 */
}


</style>
<script type="text/javascript">

// 마케팅 전체 동의 
function check_all(checked) {
	for(consent of document.marketingForm.consent) {
		consent.checked = checked;
	}
}

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
	$(".memberInvalidate").click(function(event) {
	    event.preventDefault();
	    $(".popUpLeaving").show();
	});
	
	// 팝업 닫기
	$(".LeavingPopUpHeader .close, .leavingBtns button").click(function() {
	    $(".popUpLeaving").hide();
	});
	//======================= 회원탈퇴 팝업창 끝 =======================
	
	
});





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
					<a href="Service">마이페이지 홈으로</a>
				</div>
				<form action="" method="post">
					<fieldset>
						<div>
							<p>아이디</p>
							<a>${member.mem_id}</a>
						</div>
						<hr>
						<div>
							<span>비밀번호</span><a href="changePasswd" class="changePasswd">변경</a>
							<p>개인정보 보호를 위해 주기적으로 변경해주세요</p>
						</div>
						<div>
							<span>휴대폰 번호</span><a href="changePhoneNum" class="changePhoneNum">본인 인증 후 변경</a>
							<p><a>${member.mem_tel}</a></p>
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
							<label><a href="logOut">로그아웃</a></label>
						</div>
						<hr>
						<div class="memberInvalidate">
							<label><a href="Invalidate">회원탈퇴</a></label>
						</div>
					</fieldset>
				</form>
			</div>
		</section>
	</main>
	<!----------------------------- 비밀번호 변경 팝업 ----------------------------->
    <div class="passwdPopUp">
    	<fieldset class="changeField">
	        <div class="popUpHeader">
	            <h2>새로운 비밀번호를 입력해주세요</h2>
	            <span class="close">&times;</span>
	        </div>
	        <div class="popUpOldPasswd">
	           <a>기존 비밀번호</a>
	               <input type="password" required><br>
	               <a>기존 비밀번호를 입력해주세요</a>
	        </div>
	        <br>
	        <div class="popUpNewPasswd">
	           <a>새 비밀번호</a>
	               <input type="password" required><br>
	               <a>영문, 숫자, 특수문자 포함 10 ~ 20자 이내</a>
	        </div>
	        <br>
	        <div class="popUpNewPasswdConfirm">
	           <a>새 비밀번호 확인</a>
	               <input type="password" required>
	        </div>
	        <br>
	        <div class="popUpChangePasswd" >
	            <button class="confirmBtn">새로운 비밀번호를 입력해 주세요</button>
	        </div>
        </fieldset>
    </div>
    <!----------------------------- 비밀번호 변경 팝업 끝 ----------------------------->
    <!-- ============================================================================ -->
    
    
    <!------------------------------ 본인인증 팝업 ------------------------------->
    <!----------------------------- 본인인증 팝업 끝 ----------------------------->
    
    
    
    
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
	                    <input type="checkbox" id="consent_all" onclick="check_all(this.checked)">
	                    <label for="consent_all">전체동의</label>
	                </div>
	                <div class="consent_details">
	                    <input type="checkbox" id="consent_person" name="consent">
	                    <label for="consent_person">마케팅활용동의(선택)</label>
	                </div>
	                <div class="consent_details">
	                    <input type="checkbox" id="consent_sms" name="consent">
	                    <label for="consent_sms">SMS 수신동의(선택)</label>
	                </div>
	                <div class="consent_details">
	                    <input type="checkbox" id="consent_email" name="consent">
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
            <button class="cancelBtn">탈퇴</button>
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