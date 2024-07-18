<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  <nav> -->
<!-- 	  <a href="https://pf.kakao.com/_cSnYG" target="_blank"> -->
<%-- 	  <img src="${pageContext.request.servletContext.contextPath}/resources/img/chat.png"><br> --%>
<!-- 	  채팅상담</a> -->
<!--  </nav> -->
<script>
function kakaoOpen() {
	window.open('https://pf.kakao.com/_cSnYG', '_blank', 'width=800,height=600,left=100,top=50');
}
</script>
 <nav>
	  <a onclick="kakaoOpen()">
	  <img src="${pageContext.request.servletContext.contextPath}/resources/img/kakaoChat.png"><br>
	  채팅상담</a>
 </nav>