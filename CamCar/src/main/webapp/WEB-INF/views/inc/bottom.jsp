<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="footer_area">
	<%-- EL 활용하여 현재 프로젝트 루트(= 컨텍스트 루트)의 webapp 디렉토리에 접근 가능 --%>
	<%-- 외부 클라이언트에서 요청하게 되므로 /images/logo.png 지정 시 localhost:8080 에서 찾게됨(오류) --%>
	<%-- 스프링의 외부자원은 webapp/resources 내에 위치하므로 경로 수정 필수! --%>
<%-- 	<img src="${pageContext.request.contextPath}/resources/img/camcar_logo.png"> --%>
	<br>
	<div class="logo">
		<a href="./"><img src="${pageContext.request.contextPath}/resources/img/camcar_logo.png" id="camcarLogo"></a>
		<p style="margin-left: 30px; margin-right: 1500px;">
			이용약관 | 개인정보보호정책 | 이메일수집거부 | 자동차대여약관<br><br>
			부산광역시 부산진구 부전동 112-3 삼한골든게이트 7층 (캠핑갈카 본점)    대표 진성민   TEL 051-1234-5678   E-MAIL ns0304@gmail.com
		<p>
		<a><img src="${pageContext.request.servletContext.contextPath}/resources/img/kakaoChatQR.png" id="qrImg"></a>
	</div>
	<br>
</div>