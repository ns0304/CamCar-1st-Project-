<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
.header_menu {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    background-color: #333;
    color: white;
}

.header_menu .logo img {
    height: 50px;
}

.header_menu .menu {
    display: flex;
    list-style: none;
    padding: 0;
    margin: 0;
}

.header_menu .menu-item {
    position: relative;
    margin-left: 20px;
}

.header_menu .menu-item a {
    text-decoration: none;
    color: white;
    font-size: 18px;
    padding: 10px 15px;
    transition: background-color 0.3s, color 0.3s, border-radius 0.3s;
}

.header_menu .menu-item:hover a {
    background-color: #555;
    color: #fff;
    border-radius: 5px;
}

.menu-details {
    position: absolute;
    top: calc(100% + 5px);
    left: 0;
    background-color: #333;
    padding: 10px;
    display: none;
    z-index: 1000;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    opacity: 0;
    transition: opacity 0.3s ease-in-out;
}

.menu-details.active {
    display: block;
    opacity: 1;
}

.menu-details h4 {
    margin: 5px 0;
    padding: 5px 15px;
    opacity: 0;
    transition: opacity 0.3s ease-in-out;
}

.menu-details.active h4 {
    opacity: 1;
}

.menu-details h4 a {
    text-decoration: none;
    color: white;
}

.menu-details h4 a:hover {
    background-color: #555;
    border-radius: 5px;
}

</style>


<script>
document.addEventListener("DOMContentLoaded", function() {
    const menuItems = document.querySelectorAll('.menu-item');

    menuItems.forEach(item => {
        item.addEventListener('mouseover', function() {
            const menuDetails = this.querySelector('.menu-details');
            menuDetails.classList.add('active');
        });

        item.addEventListener('mouseleave', function() {
            const menuDetails = this.querySelector('.menu-details');
            menuDetails.classList.remove('active');
        });
    });
});
</script>

</head>

<div id="member_area">
    <%-- 홈페이지 로고. 메인페이지로 이동 --%>
    <nav class="header_menu">
        <ul class="logo">
            <li><a href="./"><img src="${pageContext.request.contextPath}/resources/img/camcar_logo.png"></a></li>
        </ul>

        <ul class="menu">
            <li class="menu-item" data-hover="memberList">
                <a href="memberList">회원관리</a>
                <div class="menu-details">
                    <h4><a href="memberList">현재 회원 목록</a></h4>
                </div>
            </li>
            <li class="menu-item" data-hover="carManagement">
                <a href="#">차량관리</a>
                <div class="menu-details">
                    <h4><a href="CarListBoard">차량 목록 조회</a></h4>
                    <h4><a href="CarInfoRegistration">차량 정보 등록</a></h4>
                </div>
            </li>
            <li class="menu-item" data-hover="boardManagement">
                <a href="#">게시글관리</a>
                <div class="menu-details">
                    <h4><a href="qna_ask">1:1 문의 상담 내역</a></h4>
                    <h4><a href="BoardListManage">공지사항 관리</a></h4>
                </div>
            </li>
        </ul>
    
        <%-- 로그인 여부(= 세션 아이디 존재 여부) 판별하여 각각 다른 링크 표시 --%>
        <%-- EL 의 sessionScope 내장 객체에 접근하여 "sId" 속성값 존재 여부 판별 --%>
        <ul class="member">
            <li><a>${sessionScope.sId} 환영합니다</a></li>
        </ul>
    </nav>
    <hr>
</div>
