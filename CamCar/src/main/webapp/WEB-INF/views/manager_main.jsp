<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일(css/default.css) 연결하기 --%>
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.servletContext.contextPath}/resources/css/manager_default.css"
	rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    // 예제 데이터, 실제 데이터로 대체 필요
    // 일단은 그냥 chatgpt로 만들었는데 나중에 대대적인 수정 필요!!!
    const monthlySalesData = {
        labels: ['January', 'February', 'March', 'April', 'May', 'June'],
        datasets: [{
            label: 'Monthly Sales',
            data: [12000, 15000, 8000, 18000, 20000, 22000],
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    };

    const popularModelsData = {
        labels: ['레이', '카니발(하이 리무진)', '카니발', '스타리아(아클란S)'],
        datasets: [{
            label: 'Popular Models',
            data: [30, 20, 40, 10],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)'
            ],
            borderWidth: 1
        }]
    };

    const rentalCountsData = {
        labels: ['January', 'February', 'March', 'April', 'May', 'June'],
        datasets: [{
            label: 'Rental Counts',
            data: [50, 60, 40, 70, 80, 90],
            backgroundColor: 'rgba(153, 102, 255, 0.2)',
            borderColor: 'rgba(153, 102, 255, 1)',
            borderWidth: 1
        }]
    };

    const ageGroupData = {
        labels: ['18-25', '26-35', '36-45', '46-55', '56+'],
        datasets: [{
            label: 'Age Groups',
            data: [15, 20, 25, 30, 10],
            backgroundColor: [
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255, 159, 64, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    };

    // 차트 렌더링
    window.onload = function() {
        const ctx1 = document.getElementById('monthlySalesChart').getContext('2d');
        new Chart(ctx1, {
            type: 'bar',
            data: monthlySalesData,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        const ctx2 = document.getElementById('popularModelsChart').getContext('2d');
        new Chart(ctx2, {
            type: 'pie',
            data: popularModelsData
        });

        const ctx3 = document.getElementById('rentalCountsChart').getContext('2d');
        new Chart(ctx3, {
            type: 'line',
            data: rentalCountsData,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        const ctx4 = document.getElementById('ageGroupChart').getContext('2d');
        new Chart(ctx4, {
            type: 'doughnut',
            data: ageGroupData
        });
    };
</script>
</head>
<body>
	<header>
		<%-- 기본 메뉴 표시 영역(inc/top.jsp) 페이지 삽입 --%>
		<%-- 현재 위치는 컨텍스트 루트(/MVC_Board = webapp) 이므로 inc 디렉토리의 top.jsp 지정 --%>
		<jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
	</header>
	<main>
		<jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
		<section>
			<article>
				<%-- 본문 표시 영역 --%>
				<h1>지점별 월 매출 통계</h1>
					<canvas id="monthlySalesChart"></canvas>
				<h1>지점별 인기차량 모델 순위</h1>
					<canvas id="popularModelsChart"></canvas>
				<h1>월별 렌트 횟수 통계</h1>
					 <canvas id="rentalCountsChart"></canvas>
				<h1>연령대별 이용자 통계</h1>
					<canvas id="ageGroupChart"></canvas>
			</article>
		</section>
	</main>
	<footer>
		<%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>


