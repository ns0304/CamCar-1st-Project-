<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- jquery 라이브러리 포함시키기 --%>
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function() {
		// ID 사용하기 버튼 클릭 이벤트 핸들링
		$("#btnUseId").click(function() {
			// 아이디 입력창의 입력 문자열 길이 체크하여
			// => 아무것도 입력되지 않았을 경우 경고창 출력하고 포커스 요청
			// => 아니면 부모창에 입력받은 아이디 표시하기
			let id = $("#id").val();
			if(id == "") { // 아이디 미입력
				alert("아이디 입력 필수!");
				$("#id").focus();
			} else { // 아이디 입력
				// window.opener 지정 시 자식창에서 부모창의 요소에 접근 가능
				// => 부모창의 폼 태그 중 id 입력창에 현재 입력받은 아이디 표시하기
				window.opener.document.joinForm.id.value = id;
				// 현재 창(아이디 중복 검사 지식창) 닫기
				window.close();
			}
		});
	});
</script>
</head>
<body>
	<article>
		<h1>아이디 중복 검사</h1>
		<div align="center">
			<form action="MemberCheckIdPro">
				<input type="text" name="id" id="id" placeholder="4~16자 영문자,숫자" required maxlength="16">
				<input type="submit" value="ID중복확인">
			</form>
			<hr>
			<div id="resultArea">
				<%-- 임시) ID사용하기 버튼 생성하여 클릭 시 부모창의 아이디 입력란에 아이디 표시 --%>
				<input type="button" value="ID사용하기" id="btnUseId">
			</div>
		</div>
	</article>
</body>
</html>










