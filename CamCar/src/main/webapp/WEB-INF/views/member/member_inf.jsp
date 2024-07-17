<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<!-- <link -->
<%-- 	href="${pageContext.request.servletContext.contextPath}/resources/css/default.css" --%>
<!-- 	rel="stylesheet" type="text/css"> -->
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/manager_default.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style type="text/css">
    body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
    }
    main {
        display: flex;
        justify-content: center;
        align-items: center;
        height: calc(100% - 60px); /* Header와 Footer 공간 제외 */
        padding: 20px;
        box-sizing: border-box;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        height: 100%;
    }
    table th, table td {
        padding: 16px;
        text-align: center;
        border: 1px solid #ddd;
        font-size: 16px;
        background-color: #f9f9f9;
    }
    table th {
        background-color: #f2f2f2;
        color: #333;
    }
    table tr:hover {
        background-color: #f2f2f2;
    }
    table th, table td:nth-child(3) {
        white-space: nowrap; /* 생년월일 칼럼 텍스트가 너무 길 때 줄이지 않도록 설정 */
    }
    table input[type="button"] {
        padding: 5px 10px;
        background-color: #00838f;
        color: #fff;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    table input[type="button"]:hover {
        background-color: #006064;
    }
</style>
</head>
<body>
	<header>
	</header>
	<main>
		<section>
			<div>
				<div align="center">
					<h1>회원 상세정보</h1>
					<table border="1">
						
							<tr>
								<th>이름</th>
								<td>${member.mem_name}</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td>${member.mem_id}</td>
							</tr>
							<tr>
								<th>주소</th>
							    <td>${member.mem_add2}</td>
							</tr>
							<tr>
								<th>우편번호</th>
								<td>${member.mem_post_code}</td>
							</tr>	
							<tr>
								<th>E-Mail</th>
								<td>${member.mem_email}</td>
							</tr>
							<tr>
								<th>가입일</th>
								<td>${member.mem_sign_date}</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<c:set var="jumin" value="${member.mem_jumin}"/>
										${fn:substring(jumin,0,6)}
								</td>
							</tr>
								<th>전화번호</th>
								<td>${member.mem_tel}</td>
							</tr>
						
					</table>
				</div>
			</div>
		</section>
	</main>
</body>
</html>












