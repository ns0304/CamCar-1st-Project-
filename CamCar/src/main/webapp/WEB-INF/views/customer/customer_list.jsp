<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 날짜 등의 출력 형식 변경을 위한 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.servletContext.contextPath}/resources/css/customer.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style type="text/css">
    body {
        font-family: Arial, sans-serif;
    }

    h1 {
        margin-bottom: 10px;
    }

    h3 {
        margin: 0;
    }

    p {
        color: #333;
    }

    table {
        border-collapse: collapse;
        width: 100%;
        margin: 20px 0;
        background-color: #fff;
    }

    table th, table td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: center;
    }

    table th {
        background-color: #59b9a9;
        color: white;
    }

    table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    #table01 td {
        border: none;
        text-align: left;
        padding: 0 20px;
        margin: 0 20px;
    }

    #table01 input[type="button"] {
        background-color: #59b9a9;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
        margin: 5px 0;
    }

    #table01 input[type="button"]:hover {
        background-color: #498f7f;
    }
    
    #td99 {
   		background-color: #59b9a9;
   		color: white;
   		padding: 0 20px;
    }

</style>
</head>
<body>
<header>
    <%-- top.jsp 페이지를 현재 페이지에 삽입 --%>
    <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
</header>
<main>
    <section style="padding: 0 20px;">
        <div align="left">
            <h1>고객센터</h1>
            <p>캠핑갈카 렌터카 고객센터입니다.
            무엇을 도와드릴까요?</p>
            <section>
                <table id="table01">
                    <tr>
                        <td id="td01"><h3>자주 찾는 질문</h3></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" value="예약 / 변경" onclick="location.href='Question_reserve'">
                            <input type="button" value="운전자" onclick="location.href='Question_drivers'">
                            <input type="button" value="보험" onclick="location.href='Question_insurance'">
                            <input type="button" value="고장 / 사고" onclick="location.href='Question_accident'">
                        </td>
                    </tr>
                </table>
            </section>
            <section>
                <br><br>
                <table border="1">
                    <tr>
                        <td><b>공지사항 게시판</b></td>
                        <td><a href="board_list">더보기</a></td>
                    </tr>
                </table>
            </section>
            <section id="listForm">
                <table border="1">
                <tr id="tr_top">
                    <td width="40px">제목</td>
                    <td width="40px">날짜</td>
                </tr>
                <%-- ================================================ --%>
                <c:forEach var="bo" items="${boardList3}">
                    <%-- boardList 에서 꺼낸 BoardBean 객체(board)에 저장된 멤버변수값(데이터) 출력 --%>
                    <tr>
                        <td id="subject" align="center">
                            <a href="boardDetail?bo_idx=${bo.bo_idx}&pageNum=${pageNum}">${bo.bo_subject}</td>
                        <td>
                            <fmt:formatDate value="${bo.bo_sysdate}" pattern="yy-MM-dd HH:mm" />
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </section>
        <hr>
            <section>
                <table border="1">
                    <tr>
                        <td><b><p>더 자세한 상담이 필요한가요?</p></b></td>
                        <td rowspan="4">
                            <input type="button" value="1:1 문의 하기" id="td99" onclick="location.href='Inquiry'">
                        </td>
                    </tr>
                    <tr>
                        <td>캠핑갈카 전화상담 운영시간</td>
                    </tr>
                    <tr>
                        <td>전화 : <b>1111 - 2222</b></td>
                    </tr>
                    <tr>
                        <td>평일 09:00 ~ 18:00<b>(공휴일 휴무)</b></td>
                    </tr>
                </table>
            </section>
        </div>
    </section>
    <!-- 예약정보 선택 영역 -->
    <aside id="reservation_container">
        <jsp:include page="/WEB-INF/views/reservation/reservation.jsp"></jsp:include>
    </aside>
   	<!-- okokokkokok 카카오톡 1:1문의하기 okokokkokok-->		
	<aside class="chatBtn">
		<jsp:include page="/WEB-INF/views/kakaoLink.jsp"></jsp:include>
	</aside>
</main>
<footer>
    <%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
    <jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
</footer>
</body>
</html>