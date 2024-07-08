<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="Reservation" name="reservation" method="post">
	<img src="${pageContext.request.servletContext.contextPath}/resources/img/campingcarImage.png" id="campingcarImage" height="120px">
		<h5>000님의 여정</h5>     
		<a href="#">수정</a>
          <h4>XX 지점</h4>
          <hr>
          <h4>mm:dd yy:MM ~ mm:dd yy:MM</h4>
          <hr>
          <h4>XX 지점</h4>
          
          <button type="submit">다음</button>			
</form>