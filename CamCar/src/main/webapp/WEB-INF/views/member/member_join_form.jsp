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
	// 입력값 검증 결과를 저장할 변수 선언(true : 적합, false : 부적합)
	// => submit 이벤트에서 검사 후 submit 여부 결정
	let checkIdResult = false;
	let checkPasswdResult = false;
	let checkPasswd2Result = false;
	let checkLicenseResult = false;
	let checkIssueDateResult = false;
	let checkExpDateResult = false;
	let checkJuminResult = false;
	let checkTelResult = false;
	// =============================================================
	// 1. ID 중복확인 버튼 클릭 시 새 창(check_id.jsp) 띄우기
// 	function checkId2() {
// // 		window.open("member/check_id.jsp", "id_check", "width=300,height=200");
// 		window.open("MemberCheckId", "id_check", "width=500,height=300");
// 	}
	
	// 2. ID 입력 후 빠져나갈 때(blur) 아이디 입력값 체크하기
	function checkId() {
		// 입력받은 아이디 값 가져오기
		let mem_id = $("#mem_id").val();
		
		/*
		[ 아이디 입력값 검증을 위한 정규표현식 활용 ]
		- 규칙 : 영문자([A-Za-z]), 숫자([0-9] 또는 \d), 특수문자(_) 조합 4 ~ 16자리
		  => 이 때, 영문자 + 숫자 + 특수문자 _ 기호는 \w 로 대체 가능
		  => 단, 첫글자는 영문자 또는 숫자만 허용하고 특수문자(_)는 사용 불가
		     ex) "admin_" : 사용 가능, "_admin" : 사용 불가
		- 자바스크립트 정규표현식 문자열 생성 방법
		  1) /정규표현식문자열/
		  2) new RegExp("정규표현식문자열")
		- 자바스크립트 정규표현식 판별 방법
		  정규표현식객체명.exec(비교할문자열)
		  => 정규표현식과 일치하면 문자열 그대로 리턴, 불일치 시 null 값 리턴
		  => if 문에 사용할 경우 null 이면(데이터가 없으면) false 로 판별됨
		*/
		let regex = /^[A-Za-z0-9][A-Za-z0-9_]{3,15}$/;
// 		console.log(regex + " : " + typeof(regex)); // /^[A-Za-z0-9][A-Za-z0-9_]{3,15}$/ : object

		// 정규표현식 문자열을 관리하는 객체(regex)의 exec() 메서드 호출하여
		// 검사할 문자열을 전달하면 정규표현식 일치 여부 확인 가능
		if(!regex.exec(mem_id)) { // 불일치
			checkIdResult = false; // 아이디 검사 적합 여부 false(부적합) 값 저장
		} else { // 일치
			checkIdResult = true; // 아이디 검사 적합 여부 true(적합) 값 저장
		}
		
		let msg = "";
		let color = "";
		let bgColor = "";
		
		// 정규표현식 규칙 검사 결과 판별
		// => 불일치 시 불일치 메세지 출력 처리
		// => 일치 시 AJAX 활용하여 아이디 중복 검사 요청 후 결과 처리
		if(!checkIdResult) {
			msg = "영문자, 숫자, 특수문자(_) 조합 4 ~ 16글자";
			color = "red";
			bgColor = "lightpink";
		} else {
			$.ajax({
				type : "GET",
				url : "MemberCheckDupId",
				data : {
					mem_id : $("#mem_id").val()
				},
				success : function(result) {
					console.log("result = " + result);
					if(result.trim() == "true") {
						msg = "이미 사용중인 아이디";
						color = "red";
						bgColor = "lightpink";
					} else if(result.trim() == "false") {
						msg = "사용 가능한 아이디";
						color = "green";
						bgColor = "";
					}
					
					$("#checkIdResult").text(msg);
					$("#checkIdResult").css("color", color);
					$("#mem_id").css("background", bgColor);
				}
			});
		}
		
		// AJAX 요청에 대한 코드 실행 시점 문제 발생으로 AJAX 응답 성공 시
		// 기본값 널스트링 값이 저장된 채로 실행되므로 정확한 결과값이 표시되지 않는다!
		// => 따라서, 현재 코드가 AJAX 요청 성공 시 처리하는 success 블럭에도 추가되어야한다!
		
		$("#checkIdResult").text(msg);
		$("#checkIdResult").css("color", color);
		$("#mem_id").css("background", bgColor);

		
	}
	
	function checkTel() {
		// 입력받은 전화번호 값 가져오기
		let mem_tel = $("#mem_tel").val();
		
		let regex = /^0\d{1,2}(-|\))\d{3,4}-\d{4}$/;

		// 정규표현식 문자열을 관리하는 객체(regex)의 exec() 메서드 호출하여
		// 검사할 문자열을 전달하면 정규표현식 일치 여부 확인 가능
		if(!regex.exec(mem_tel)) { // 불일치
			checkTelResult = false; // 아이디 검사 적합 여부 false(부적합) 값 저장
		} else { // 일치
			checkTelResult = true; // 아이디 검사 적합 여부 true(적합) 값 저장
		}
		
		let msg = "";
		let color = "";
		let bgColor = "";
		
		// 정규표현식 규칙 검사 결과 판별
		// => 불일치 시 불일치 메세지 출력 처리
		// => 일치 시 AJAX 활용하여 아이디 중복 검사 요청 후 결과 처리
		if(!checkTelResult) {
			msg = "양식에 맞게 입력해주세요";
			color = "red";
			bgColor = "lightpink";
		} else {
			$.ajax({
				type : "GET",
				url : "MemberCheckDupTel",
				data : {
					mem_tel : $("#mem_tel").val()
				},
				success : function(result) {
					console.log("result = " + result);
					if(result.trim() == "true") {
						msg = "이미 사용중인 전화번호";
						color = "red";
						bgColor = "lightpink";
					} else if(result.trim() == "false") {
						msg = "사용 가능한 전화번호";
						color = "green";
						bgColor = "";
					}
					
					$("#checkTelResult").text(msg);
					$("#checkTelResult").css("color", color);
					$("#mem_tel").css("background", bgColor);
				}
			});
		}
		
		// AJAX 요청에 대한 코드 실행 시점 문제 발생으로 AJAX 응답 성공 시
		// 기본값 널스트링 값이 저장된 채로 실행되므로 정확한 결과값이 표시되지 않는다!
		// => 따라서, 현재 코드가 AJAX 요청 성공 시 처리하는 success 블럭에도 추가되어야한다!
		
		$("#checkTelResult").text(msg);
		$("#checkTelResult").css("color", color);
		$("#mem_tel").css("background", bgColor);
		
	}
	
	function checkJumin() {
		// 입력받은 전화번호 값 가져오기
		let mem_jumin = $("#mem_jumin").val();
		
		let regex = /^\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])[-]\d{7}$/;

		// 정규표현식 문자열을 관리하는 객체(regex)의 exec() 메서드 호출하여
		// 검사할 문자열을 전달하면 정규표현식 일치 여부 확인 가능
		if(!regex.exec(mem_jumin)) { // 불일치
			checkJuminResult = false; // 아이디 검사 적합 여부 false(부적합) 값 저장
		} else { // 일치
			checkJuminResult = true; // 아이디 검사 적합 여부 true(적합) 값 저장
		}
		
		let msg = "";
		let color = "";
		let bgColor = "";
		
		// 정규표현식 규칙 검사 결과 판별
		// => 불일치 시 불일치 메세지 출력 처리
		// => 일치 시 AJAX 활용하여 아이디 중복 검사 요청 후 결과 처리
		if(!checkJuminResult) {
			msg = "양식에 맞게 입력해주세요";
			color = "red";
			bgColor = "lightpink";
		} else {
			$.ajax({
				type : "GET",
				url : "MemberCheckDupJumin",
				data : {
					mem_jumin : $("#mem_jumin").val()
				},
				success : function(result) {
					console.log("result = " + result);
					if(result.trim() == "true") {
						msg = "이미 사용중인 주민번호";
						color = "red";
						bgColor = "lightpink";
					} else if(result.trim() == "false") {
						msg = "사용 가능한 주민번호";
						color = "green";
						bgColor = "";
					}
					
					$("#checkJuminResult").text(msg);
					$("#checkJuminResult").css("color", color);
					$("#mem_jumin").css("background", bgColor);
				}
			});
		}
		
		// AJAX 요청에 대한 코드 실행 시점 문제 발생으로 AJAX 응답 성공 시
		// 기본값 널스트링 값이 저장된 채로 실행되므로 정확한 결과값이 표시되지 않는다!
		// => 따라서, 현재 코드가 AJAX 요청 성공 시 처리하는 success 블럭에도 추가되어야한다!
		
		$("#checkJuminResult").text(msg);
		$("#checkJuminResult").css("color", color);
		$("#mem_jumin").css("background", bgColor);
		
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
	//==================================================================================================================
	// 7. 이메일 도메인 선택 셀렉트 박스 항목 변경 시 
	//    선택된 셀렉트 박스 값을 이메일 두번째 항목(@ 기호 뒤)에 표시하기
	function selectedDomain(domain) {
		document.joinForm.mem_email2.value = domain;
		
		// 선택항목이 [직접입력] 일 경우 판별
		if(domain == "") {
			// 입력창 잠금해제 및 커서 요청
			document.joinForm.mem_email2.readOnly = false; // readonly 가 아닌 readOnly 속성명 지정
			document.joinForm.mem_email2.focus();
			document.joinForm.mem_email2.style.background = "";
		} else { // [직접입력] 이 아닌 나머지 도메인 선택했을 경우
			document.joinForm.mem_email2.readOnly = true; // readonly 가 아닌 readOnly 속성명 지정
			document.joinForm.mem_email2.style.background = "GRAY";
		}
	}
	
	
	// ========================================================================
	$(function() {
		// 10. 가입(submit) 클릭 시 이벤트 처리(생략)
		$("form").submit(function() {
			// 아이디 정규표현식 검사, 패스워드와 패스워드 확인 정규표현식 검사,
			// 취미 항목 체크 여부 확인을 통해 해당 항목이 부적합 할 경우 
			// 오류메세지 출력 및 submit 동작 취소
			if(!checkIdResult) {
				alert("아이디 규칙이 적합하지 않습니다!");
				$("#mem_id").focus();
				return false; // submit 동작 취소
// 			} else if(!checkPasswdResult) { // 패스워드 검사 결과 확인 생략
// 				alert("패스워드 규칙이 적합하지 않습니다!");
// 				$("#passwd").focus();
// 				return false; // submit 동작 취소
			} else if(!checkPasswd2Result) {
				alert("패스워드 확인 항목이 일치하지 않습니다!");
				$("#mem_passwd2").focus();
				return false; // submit 동작 취소
				
			} else if(!checkPasswdResult) {
				alert("패스워드를 부적합하게 입력했습니다.");
				$("#mem_passwd").focus();
				return false;
				
			} else if(!checkJuminResult) {
				alert("주민번호를 부적합하게 입력했습니다.");
				$("#mem_jumin").focus();
				return false;
			
			} else if(!checkTelResult) {
				alert("전화번호를 부적합하게 입력했습니다.");
				$("#mem_tel").focus();
				return false;
			
			} else if(!checkLicenseResult) {
				alert("면허번호를 바르게 입력해주세요.");
				$("#lic_num").focus();
				return false;
				
			} else if(!checkIssueDateResult) {
				alert("발급일자를 바르게 입력해주세요.");
				$("#lic_issue_date").focus();
				return false;
				
			} else if(!checkExpDateResult) {
				alert("만료일자를 바르게 입력해주세요.");
				$("#lic_expiration_date").focus();
				return false;
			}
			
			
		});
		
		
		// 주소 검색 API 활용 기능 추가
		// "t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" 스크립트 파일 로딩 필수!
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
		            $("#mem_post_code").val(data.zonecode);
			
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
		            $("#mem_add1").val(address);
		            
		            // 5) 상세주소 항목(address2)에 포커스 요청
		            $("#mem_add2").focus();
		        }
		    }).open();
		});
		
		$("#mem_name").on("blur", function() {
			let name = $("#mem_name").val();
			$("#dri_name").val(name);
		});
		
		$("#mem_tel").on("blur", function() {
			let tel = $("#mem_tel").val();
			$("#dri_tel").val(tel);
		});
		
		
		
		
	    // "보기" 링크 클릭 시 팝업 표시
	    $("#agree").click(function(event) {
	        event.preventDefault();
	        $(".popUp").show();
	    });

	    // 팝업 닫기
	    $(".popUp .close, .popUpConfirm button").click(function() {
	        $(".popUp").hide();
	    });
		
		
		
	});
	
	//----------------------------------------------------------------------------------------------------
	// 1-1 면허번호 입력란에 입력 후 빠져나갈 때 (blur) 면허번호 입력값 체크하기
		function checkLicense() {
		    // 면허번호 입력값 가져오기
		    let licenseNum = $("#lic_num").val();

		    // 면허번호 검증 결과 메시지 출력에 사용될 변수 선언++
		    let msg = "";
		    let color = "";

		    // 면허번호 길이 및 종류 검증 : 한글, 숫자 조합 12자리
		    let lengthRegex = /^[가-힣\d]{12}$/;

		    if (lengthRegex.test(licenseNum)) { // 면허번호 길이 검사 적합
		        msg = "적합한 번호";
		        color = "green";
		        checkLicenseResult = true;
		    } else { // 면허번호 검사 부적합
		        msg = "면허번호를 입력해주세요";
		        color = "red";
			    checkLicenseResult = false;
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
		        checkIssueDateResult = true;
		    } else {
		        // 월 일치 여부 규칙
		        let monthRegex = /^\d{4}(0[1-9]|1[0-2])/; 
		        
		        // 일 일치 여부 규칙
		        let dayRegex = /^\d{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
		        
		        if (!monthRegex.test(issueDate)) { // 월 숫자 2자리 부적합
		            $("#checkIssueDateResult").text("존재하지 않은 월을 입력했어요. 다시 입력해주세요");
		            $("#checkIssueDateResult").css("color", "red");
		            checkIssueDateResult = false;
		        } else if (!dayRegex.test(issueDate)) { // 일 숫자 2자리 부적합
		            $("#checkIssueDateResult").text("존재하지 않은 일을 입력했어요. 다시 입력해주세요");
		            $("#checkIssueDateResult").css("color", "red");
		            checkIssueDateResult = false;
		        } else { // 입력된 값 부적합
		            $("#checkIssueDateResult").text("발급일자를 입력해주세요");
		            $("#checkIssueDateResult").css("color", "red");
		            checkIssueDateResult = false;
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
		        checkExpDateResult = true;
		    } else {
		        // 월 일치 여부 규칙
		        let monthRegex2 = /^\d{4}(0[1-9]|1[0-2])/; 
		        
		        // 일 일치 여부 규칙
		        let dayRegex2 = /^\d{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
		        
		        if (!monthRegex2.test(expDate)) { // 월 숫자 2자리 부적합
		            $("#checkExpDateResult").text("존재하지 않은 월을 입력했어요. 다시 입력해주세요");
		            $("#checkExpDateResult").css("color", "red");
		            checkExpDateResult = false;
		        } else if (!dayRegex2.test(expDate)) { // 일 숫자 2자리 부적합
		            $("#checkExpDateResult").text("존재하지 않은 일을 입력했어요. 다시 입력해주세요");
		            $("#checkExpDateResult").css("color", "red");
		            checkExpDateResult = false;
		        } else { // 입력된 값 부적합
		            $("#checkExpDateResult").text("만료일자를 입력해주세요"); 
		            $("#checkExpDateResult").css("color", "red");
		            checkExpDateResult = false;
		        }
		    }
		} // checkExpDate() 함수 끝
		
		
		// ===========================================================================
		// 회원가입 창 hide, show
		document.addEventListener("DOMContentLoaded", function() {
		    // 다음 버튼 클릭 시 회원정보 입력 창 닫히고 운전면허 정보 입력 창 열림
		    document.getElementById("next1").addEventListener("click", function() {
		        document.querySelector(".joinForm1").style.display = "none";
		        document.querySelector(".joinForm2").style.display = "block";
		    });
		    
		    // 다음 버튼 클릭 시 운전면허 정보 입력 창 닫히고 카드정보 입력 창 열림
		    document.getElementById("next2").addEventListener("click", function() {
		        document.querySelector(".joinForm2").style.display = "none";
		        document.querySelector(".joinForm3").style.display = "block";
		    });

			// 이전 버튼 클릭 시 운전면허 정보 입력 창 닫히고 회원정보 입력 창 열림
		    document.getElementById("prev1").addEventListener("click", function() {
		        document.querySelector(".joinForm2").style.display = "none";
		        document.querySelector(".joinForm1").style.display = "block";
		    });
		    
		    // 이전 버튼 클릭 시 카드정보 입력 창 닫히고 운전면허 정보 입력 창 열림
		    document.getElementById("prev2").addEventListener("click", function() {
		        document.querySelector(".joinForm3").style.display = "none";
		        document.querySelector(".joinForm2").style.display = "block";
		    });
		});

		
</script>
<style type="text/css">
.joinForm1, .joinForm2, .joinForm3 {
	padding: 20px 60px;
	border: 1.5px solid #ccc;
	border-radius: 12px;
	width: 600px;
	box-sizing: border-box;
}
.joinForm2, .joinForm3 {
	display: none;
}

#need {
	margin-bottom: 20px;
}

</style>

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

</head>
<body>	
	<header>
		<%-- top.jsp 페이지를 현재 페이지에 삽입 --%>
		<jsp:include page="/WEB-INF/views//inc/top.jsp"></jsp:include>
	</header>
	<main>
		<article style="position: relative; top: 100px;">
			<h1 align="center">회원 가입</h1>
			<form action="MemberJoinPro" name="joinForm" method="post">
				<section class="joinForm1">
					<table id="tb01">
						<tr id="need"><td><b>(*)는 필수입력란!</b></td></tr>
						<tr>
							<td>아이디(*)</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="mem_id" id="mem_id" size="15" placeholder="6자리 이상 입력" onblur="checkId()" required="required">
								<div id="checkIdResult"></div>
							</td>
						</tr>	
						<tr>
							<td>비밀번호(*)</td>
						</tr>
						<tr>
							<td>
								<input type="password" name="mem_passwd" id="mem_passwd" size="25" onblur="checkPasswd()" required="required">
								<span id="checkPasswdComplexResult"></span>
								<div id="checkPasswdResult"></div>
							</td>
						</tr>	
						<tr>
							<td>비밀번호확인(*)</td>
						</tr>
						<tr>	
							<td>
								<input type="password" name="mem_passwd2" id="mem_passwd2" size="25" onblur="checkSamePasswd()" required="required">
								<div id="checkPasswd2Result"></div>
							</td>
						</tr>	
						<tr>
							<td>E-Mail(*)</td>
						</tr>
						<tr>	
							<td>
								<input type="text" name="mem_email1" size="10" required="required"> @
								<input type="text" name="mem_email2" size="10" required="required">
								<!-- 셀렉트박스 항목 변경 시 selectedDomain() 함수 호출 -->
								<!-- 선택된 항목의 value 속성값이 함수 파라미터로 전달됨 -->
								<select name="emailDomain" onchange="selectedDomain(this.value)" on>
									<option value="">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="nate.com">nate.com</option>
								</select>
							</td>
						</tr>	
						<tr>
							<td>주소(*)</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="mem_post_code" id="mem_post_code" size="6" readonly required="required">
								<input type="button" value="주소검색" id="btnSearchAddress">
								<br>
								<input type="text" name="mem_add1" id="mem_add1" size="30" placeholder="기본주소" required="required">
								<br>
								<input type="text" name="mem_add2" id="mem_add2" size="30" placeholder="상세주소" required="required">
							</td>
						</tr>	
						<tr>
							<td>이름(*)</td>
						</tr>
						<tr>
							<td><input type="text" name="mem_name" size="6" id="mem_name" pattern="^[가-힣]{2,5}$" title="한글 2-5글자" required="required"></td>
						</tr>	
						<tr>
							<td>주민등록번호(*)</td>
						</tr>
						<tr>
							<td id="tdjumin">(주민번호 입력 시 "-"를 입력해주세요)</td>
						</tr>
						<tr>
							<td><input type="text" name="mem_jumin" size="15" id="mem_jumin" maxlength="14" required="required" onblur="checkJumin()">
								<div id="checkJuminResult"></div>
							</td>
						</tr>
						<tr>
							<td>휴대폰 번호(*)</td>
						</tr>
						<tr>
							<td id="tdtel">(휴대폰 번호를 입력 시 "-"를 입력해주세요)</td>
						</tr>
						<tr>
							<td><input type="text" name="mem_tel" size="10" id="mem_tel" maxlength="13" required="required" onblur="checkTel()">
								<div id="checkTelResult"></div>
							</td>
						</tr>	
						<tr>
							<td>휴대폰 번호 인증</td>
						</tr>
						<tr>
							<td><input type="text" name="tel_number_check" size="10" id="tel_number_check" >
								<input type="button" value="인증완료" id="btnCertification"></td>
						</tr>
						<tr>
									<td align="center"><br><input type="button" id="next1" value="다음" ></td>
						</tr>
					</table>
				</section>
				
				<section class="joinForm2">
								<input type="hidden" name="dri_name" id="dri_name" size="20" placeholder="운전자 이름을 입력해주세요" >
								<input type="hidden" name="dri_tel" id="dri_tel" size="24" placeholder="운전자 전화번호를 입력해주세요" >
					<table id="tb02">			
						<tr>
							<td>운전자 생년월일(*)</td>
						</tr>
						<tr>	
							<td>
								<input type="text" name="dri_birthday" id="dri_birthday" size="25" placeholder="운전자 생년월일을 입력해주세요" required="required" maxlength="6">
							</td>
						</tr>
						<tr>
							<td>면허종류(*)</td>
						</tr>
						<tr>
							<td>
								<select name="lic_info" id="lic_info">
									<option value="">면허종류를 선택해주세요</option>
									<option value="2종보통">2종보통</option>
									<option value="1종보통">1종보통</option>
									<option value="1종특수-대형견인차(트레일러)">1종특수-대형견인차(트레일러)</option>
									<option value="1종특수-구난차(레커)">1종특수-구난차(레커)</option>
									<option value="1종특수-소형견인차">1종특수-소형견인차</option>
									<option value="국제면허">국제면허</option>
								</select>
							</td>
						</tr>	
						<tr>
							<td>면허번호(*)</td>
						</tr>
						<tr>	
							<td>
								<input type="text" name="lic_num" id="lic_num" size="20" placeholder="면허번호를 입력해주세요"  onblur="checkLicense()" maxlength="12" required="required">
								<div id="checkLicenseResult"></div>
							</td>
						</tr>
						<tr>
							<td>발급일자(*)</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="lic_issue_date" id="lic_issue_date" placeholder="예) 20211010" size="20" onblur="checkIssueDate()" maxlength="8" required="required">
								<div id="checkIssueDateResult"></div>
							</td>
						</tr>	
						<tr>
							<td>만료일자(*)</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="lic_expiration_date" id="lic_expiration_date" placeholder="예) 20251231" size="20" onblur="checkExpDate()" maxlength="8" required="required">
								<div id="checkExpDateResult"></div>
							</td>	
						</tr>
						<tr>
							<td align="center"><br><input type="button" id="prev1" value="이전" >
							<input type="button" id="next2" value="다음" ></td>
						</tr>

					</table>	
				</section>
				
				<section class="joinForm3">
					<table id="tb03">	
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
								<input type="text" name="card_num" id="card_num" size="20" placeholder="카드번호를 입력해주세요">
							</td>
						</tr>
						<tr>
							<td>유효기간</td>
							<td>비밀번호 앞 2자리</td>
						</tr>
						<tr>
							<td><input type="text" name="creditExpiration " placeholder="MM/YY" size="10" id="creditExpiration" ></td>
							<td><input type="password" name="creditPasswd" size="2" id="creditPasswd" >**
						</tr>	
						<tr>
							<td>생년월일 6자리</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="mem_birthday" id="mem_birthday" size="15" placeholder="숫자만입력해주세요">
							</td>
						</tr>
						
						<tr>
							<td>약관동의</td>
						</tr>
						<tr>
							<td><input type="button" id="agree" value="약관동의" required="required"></td>
						</tr>
						
						
						<tr>
							<td colspan="2" align="center">
								<br><input type="button" id="prev2" value="이전" >&nbsp;
								<input type="submit" value="가입">
	<!-- 						<input type="button" value="다음" onclick="location.href='MemberJoin_two'"> -->
	<!-- 						<input type="button" value="돌아가기" onclick="history.back()"> -->
							</td>
						</tr>
					</table>
				</section>	
			</form>
		</article>
	</main>
						 <!-- 회원가입 약관동의 팝업 -->
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
					        <div>
					        	<input type="checkbox" id="check" required="required">
					        	<label for="check">약관동의(필수)</label>
					        </div>
					        <div class="popUpConfirm">
					            <button class="confirmBtn">확인했어요</button>
					        </div>
					    </div>
		<!-- 카카오톡 채팅 문의 -->	
	<aside class="chatBtn">
		<jsp:include page="/WEB-INF/views/kakaoLink.jsp"></jsp:include>
	</aside>
	
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views//inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>















