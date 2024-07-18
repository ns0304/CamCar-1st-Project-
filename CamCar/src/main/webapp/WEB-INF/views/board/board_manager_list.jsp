<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 날짜 등의 출력 형식 변경을 위한 JSTL - format(fmt) 라이브러리 등록 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑갈카 관리자</title>
<!-- 외부 CSS 파일(css/default.css) 연결하기 -->
<link
    href="${pageContext.request.servletContext.contextPath}/resources/css/default.css"
    rel="stylesheet" type="text/css">
<link
    href="${pageContext.request.servletContext.contextPath}/resources/css/manager_default.css"
    rel="stylesheet" type="text/css">
<script
    src="${pageContext.request.servletContext.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style type="text/css">
#articleForm {
	width: 900px;
	margin: auto;
}
table {
	border-collapse: collapse;
}
table th, table td {
	padding: 10px;
	text-align: center;
}
table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 20px;
}
table th, table td {
    padding: 8px;
    text-align: center;
    border: 1px solid #ddd;
    font-size: 14px;
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
<script type="text/javascript">
    function detailview(bo_idx) {
        window.open('BoardDetail?bo_idx=' + bo_idx, '_parent', 'width=900px,height=900px,left=750,top=200');
    }
</script>
<body>
    <header>
        <jsp:include page="/WEB-INF/views/inc/manager_top.jsp"></jsp:include>
    </header>
    <main>
        <aside>
            <jsp:include page="/WEB-INF/views/inc/menu.jsp"></jsp:include>
        </aside>
        <section id="articleForm">
            <div align="center">
                <!-- 게시판 리스트 -->
                <h2>캠핑갈카 공지사항</h2>
                <section id="listForm">
                    <table border="1">
                        <tr id="tr_top">
                        	<td align="center" width="80">공지글 번호</td>
                            <td align="center">공지 사항 제목</td>
                            <td width="150px" align="center">날짜</td>
                            <td align="center" width="100">상세 정보 보기</td>
                        </tr>

                        <c:set var="pageNum" value="1" />
                        <c:if test="${not empty param.pageNum}">
                            <c:set var="pageNum" value="${param.pageNum}" />
                        </c:if>
                        <%-- JSTL 과 EL 활용하여 글목록 표시 작업 반복(boardList 객체 활용) --%>
                        <c:forEach var="bo" items="${boardList}">
                            <%-- boardList 에서 꺼낸 BoardBean 객체(board)에 저장된 멤버변수값(데이터) 출력 --%>
                            <tr>
                            	<td align="center">${bo.bo_idx}</td>
                                <td align="center">${bo.bo_subject}</td>
                                <td align="center"><fmt:formatDate value="${bo.bo_sysdate}"
                                        pattern="yy-MM-dd HH:mm" /></td> 
                                <td align="center"><input type="button" value="조회" onclick="detailview(${bo.bo_idx})"></td>
                  
                            </tr>
                        </c:forEach>
                        
                    </table>
                </section>
                <br>
                <%-- ==========================공지사항 글 등록 페이징 처리 영역======================= --%>
                <section id="BoardWrite">
                    <input type="button" value="공지사항 글 등록"
                        onclick="location.href='BoardWrite'">
                </section>
                <br>
                <%-- ========================== 페이징 처리 영역 ========================== --%>
                <section id="pageList">
                    <input type="button" value="이전"
                        onclick="location.href='BoardListManage?pageNum=${pageNum - 1}'"
                        <c:if test="${pageNum <= 1}">disabled</c:if>>

                    <c:forEach var="i" begin="${pageInfo.startPage}"
                        end="${pageInfo.endPage}">
                        <c:choose>
                            <c:when test="${i eq pageNum}">
                                <b>${i}</b>
                                <%-- 현재 페이지 번호 --%>
                            </c:when>
                            <c:otherwise>
                                <a href="BoardListManage?pageNum=${i}">${i}</a>
                                <%-- 다른 페이지 번호 --%>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <input type="button" value="다음"
                        onclick="location.href='BoardListManage?pageNum=${pageNum + 1}'"
                        <c:if test="${pageNum >= pageInfo.maxPage}">disabled</c:if>>
                </section>
            </div>
        </section>
    </main>
    <footer>
        <%-- 회사 소개 영역(inc/bottom.jsp) 페이지 삽입 --%>
        <jsp:include page="/WEB-INF/views/inc/bottom.jsp"></jsp:include>
    </footer>
</body>
</html>