<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
// 카카오톡 채팅 문의 창 열기
function kakaoOpen() {
	window.open('https://pf.kakao.com/_cSnYG', '_blank', 'width=800,height=600,left=100,top=50');
}
</script>
 <nav>
	  <a onclick="kakaoOpen()">
	  <img src="${pageContext.request.servletContext.contextPath}/resources/img/kakaoChat.png"><br>
	  <b>채팅문의</b></a>
 </nav>