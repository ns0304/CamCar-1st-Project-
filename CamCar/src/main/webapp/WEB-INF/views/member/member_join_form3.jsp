<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<%-- <link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css"> --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/join_form.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<%-- 다음 우편번호 API --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	
	// 10. 가입(submit) 클릭 시 이벤트 처리(생략)
	// ========================================================================
	// 주소 검색 API 활용 기능 추가
	// "t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" 스크립트 파일 로딩 필수!
	$(function() {
		$("#btnSearchAddress").click(function() {
			new daum.Postcode({
				// 주소검색 창에서 주소 검색 후 검색된 주소를 클릭 시
				// oncomplete 속성 뒤의 익명함수가 실행(호출)됨
				// => 어떤 함수를 실행한 후 해당 함수가 나의 함수를 호출하는 경우
				//    호출되는 나의 함수를 콜백 함수(callback function)라고 함
		        oncomplete: function(data) { 
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		            // => 검색 결과는 모두 익명함수 파라미터 data 에 저장되어 있으므로
		            //    data.xxx 형식으로 검색 결과에 접근 가능함
					// 1) 우편번호(zonecode) 가져와서 우편번호 항목(postCode)에 출력              
		            $("#postCode").val(data.zonecode);
			
					// 2) 기본주소(address) 또는 도로명주소(roadAddress) 가져와서 
					//    기본주소 항목(address1)에 출력
//						$("#address1").val(data.address);
					let address = data.address;
		            
		            // 3) 만약, 건물명(buildingName)이 존재할 경우(= 널스트링이 아님)
		            //    기본 주소 뒤에 건물명 결합
		            if(data.buildingName !== ''){
		               address += "(" + data.buildingName + ")";
		            }
		            
		            // 4) 기본주소(+ 건물명)를 기본주소 항목(address1)에 출력
		            $("#address1").val(address);
		            
		            // 5) 상세주소 항목(address2)에 포커스 요청
		            $("#address2").focus();
		        }
		    }).open();
		});
	});
	
</script>
</head>
<body>	
	<header>
		<%-- top.jsp 페이지를 현재 페이지에 삽입 --%>
		<jsp:include page="/WEB-INF/views//inc/top.jsp"></jsp:include>
	</header>
	<article>
		<h1>결제수단 등록</h1>
		<form action="MemberJoinPro_three" name="joinForm" method="post">
			<table>
				<tr>
					<td>카드유형</td>
					<td>카드번호</td>
				</tr>
				<tr>
					<td>
						<select name="CreitCard">
							<option value="">카드종류를 선택해주세요</option>
							<option value="개인카드">개인카드</option>
							<option value="법인카드(기명)">법인카드(기명)</option>
							<option value="법인카드(무기명)">법인카드(무기명)</option>
						</select>
					</td>
					<td>
						<input type="text" name="lic_num" id="lic_num" size="20" placeholder="면허번호를 입력해주세요">
					</td>
				</tr>
				<tr>
					<td>유효기간</td>
					<td>비밀번호 앞 2자리</td>
				</tr>
				<tr>
					<td><input type="password" name="creditExpiration " placeholder="MM/YY" size="10" id="creditExpiration" ></td>
					<td><input type="password" name="creditPasswd" size="2" id="creditPasswd" >**
				</tr>	
				<tr>
					<td>생년월일 6자리</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="birth" id="birth" size="15" placeholder="숫자만입력해주세요">
					</td>
				</tr>	
				
					
				<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
				<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
				<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
				<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="다음">
<!-- 						<input type="button" value="다음" onclick="location.href='MemberJoin3'"> -->
<!-- 						<input type="button" value="돌아가기" onclick="history.back()"> -->
					</td>
				</tr>
			</table>
		</form>
	</article>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views//inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>















