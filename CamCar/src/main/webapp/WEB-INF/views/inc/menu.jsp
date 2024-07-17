<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
body {
    font-family: Arial, sans-serif;
}
.mainList {
    width: 200px;
}
.mainList .title {
    font-size: 24px; /* 글자 크기를 조금 줄임 */
    font-weight: bold;
    margin-bottom: 15px; /* 아래 간격을 줄임 */
    color: #333; /* 검은색 또는 회색으로 설정 */
}
.mainList h2 {
    font-size: 20px; /* 글자 크기를 조금 줄임 */
    cursor: pointer;
    margin: 10px 0; /* 위 아래 간격을 줄임 */
    padding: 10px;
    background-color: #eee; /* 회색 배경색으로 변경 */
    color: #333; /* 검은색 또는 회색으로 설정 */
    border-radius: 4px;
    transition: background-color 0.3s, transform 0.3s; /* 부드러운 hover 효과를 위해 transform 속성 추가 */
}
.mainList h2:hover {
    background-color: #ddd; /* 부드러운 hover 효과를 위해 색상을 밝게 변화 */
    transform: scale(1.02); /* 작은 크기로 확대하는 hover 효과 추가 */
}
.mainList .submenu {
    display: none;
    padding-left: 20px;
}
.mainList .submenu h4 {
    margin: 10px 0; /* 위 아래 간격을 줄임 */
}
.mainList .submenu h4 a {
    text-decoration: none;
    color: #333; /* 검은색 또는 회색으로 설정 */
    font-size: 16px; /* 글자 크기를 조금 줄임 */
}
.mainList .submenu h4 a:hover {
    color: #555; /* 호버 시 회색으로 변환 */
}
.menu-item:hover .submenu {
    display: block;
    animation: fadeIn 0.3s ease-in-out;
}
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>
<script>
document.addEventListener('DOMContentLoaded', (event) => {
    const menuItems = document.querySelectorAll('.menu-item');

    menuItems.forEach(item => {
        item.addEventListener('mouseenter', () => {
            const submenu = item.querySelector('.submenu');
            submenu.style.display = 'block';
        });

        item.addEventListener('mouseleave', () => {
            const submenu = item.querySelector('.submenu');
            submenu.style.display = 'none';
        });
    });
});
</script>


<aside>
	<div class="mainList" style="margin-top: 100px;">
		<h5>
			<div class="title">관리자 메뉴</div>
		</h5>
		<div class="menu-item">
			<h2>회원 관리</h2>
			<div class="submenu">
				<h4>
					<a href="memberList" class="">현재 회원 목록</a>
				</h4>
			</div>
		</div>
		<div class="menu-item">
			<h2>차량 관리</h2>
			<div class="submenu">
				<h4>
					<a href="CarListBoard" class="">차량 목록 조회</a>
				</h4>
				<h4>
					<a href="CarInfoRegistration" class="">차량 정보 등록</a>
				</h4>
			</div>
		</div>
		<div class="menu-item">
			<h2>게시글 관리</h2>
			<div class="submenu">
				<h4>
					<a href="qna_ask" class="">1:1 문의 상담 내역</a>
				</h4>
				<h4>
					<a href="BoardList" class="">공지사항 관리</a>
				</h4>
			</div>
		</div>
	</div>
</aside>
