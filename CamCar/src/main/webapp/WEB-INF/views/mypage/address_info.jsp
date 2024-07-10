<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 정보 변경</title>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/address_info.css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<%-- 다음 우편번호 API --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
/* 팝업 스타일 */
.popUp {
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

.popUpContent tr {
	background-color: #e0e0e0;
	
}
.popUpHeader .close {
    cursor: pointer;
    font-size: 16px;
}
.popUpContent {
    margin: 20px 0;
}
.popUp table {
    width: 100%;
    border-collapse: collapse;
}
.popUp table, .popUp th, .popUp td {
    border: 1px solid #ccc;
}
.popUp th, .popUp td {
    padding: 8px;
    text-align: center;
}
.popUpConfirm {
    text-align: center;
}
.popUpConfirm button {
    padding: 10px 20px;
    background-color: #f68b1f;
    color: white;
    border: none;
    cursor: pointer;
}
.popUpConfirm button:hover {
    background-color: #f68b1f;
}

.confirmBtn { /* "확인했어요" 버튼 */
	border-radius: 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    //주소 검색 API 활용 기능 추가
    $("#btnSearchAddress").click(function() {
        new daum.Postcode({
            oncomplete: function(data) { 
                $("#post_code").val(data.zonecode);
                let address = data.address;
                if(data.buildingName !== ''){
                   address += "(" + data.buildingName + ")";
                }
                $("#basic_address").val(address);
                $("#detail_address").focus();
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
            <div class="addressInfoChange">
                <h1>주소 정보 변경</h1>
                <div class="infoBox">
                    <p>약관에 동의해야 주소정보를 저장할 수 있어요</p>
                </div>
                <form action="submitAddress" method="post">
                    <fieldset class="address_section" id="address_section">
                        <div class="address_section">
                            <p>주소</p>
                        </div>
                        <div class="address_section">
                            <label for="post_code"></label>
                            <input type="text" placeholder="우편번호" id="post_code" name="post_code" required readonly>
                            <button type="button" class="searchBtn" id="btnSearchAddress">주소검색</button>
                        </div>
                        <div class="address_section">
                            <label for="basic_address"></label>
                            <input type="text" placeholder="주소" id="basic_address" name="basic_address" required>
                        </div>
                        <div class="address_section">
                            <label for="detail_address"></label>
                            <input type="text" placeholder="상세주소" id="detail_address" name="detail_address" required>
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
                        <button type="submit">주소를 입력해주세요</button>
                    </div>
                </form>
            </div>
        </section>
    </main>

    <!-- 주소 약관동의 팝업 -->
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
</body>
</html>