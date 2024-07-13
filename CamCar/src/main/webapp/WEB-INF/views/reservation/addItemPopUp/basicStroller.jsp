<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.campingSet2Btn {
    width: 200px;  /* 버튼의 너비 설정 */
    height: 200px; /* 버튼의 높이 설정 */
/*     border: 1px solid gray;  /* 버튼 테두리 제거 (필요에 따라 설정) */ */
    padding: 0;    /* 내부 여백 제거 */
    background-color: white; /* 배경색 투명 */

}

.campingSet2Btn img {
    width: 100%;  /* 이미지가 버튼 크기에 맞게 조정 */
    height: 100%; /* 이미지가 버튼 크기에 맞게 조정 */
    object-fit: contain; /* 이미지 비율을 유지하면서 버튼 내부에 맞춤 */
    display: block; /* 이미지를 블록 요소로 만들어 줄바꿈 없이 표시 */
    margin: auto;  /* 이미지를 수평으로 중앙 정렬 */
}

#campingSet2 {
	display: flex;
	justify-content: center;
}

.campingSet2Btn {
	margin: 10px;
}

.campingSet2BtnIn {
	padding-bottom: 10px;
}

.campingSet2Btn .select{
	display:block;
	margin: auto;
	margin-top: 20px;
}

</style>
<div id ="campingSet2">
	<div class="campingSet2Btn">
		<button id="campingSet2_1" class="campingSet2BtnIn">
			<img
				src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/basic/stroller/stroller_1.png"
				alt="Camping Set"><br> 스노우라인 블랙에디션<br> 테이블(2인용) +
			릴렉스체어 2개<br> 일 12,000원<br>
		</button>
		<br>
	    <input type="button" value="선택" class="select">
	</div>
	<div class="campingSet2Btn">
		<button id="campingSet2_2" class="campingSet2BtnIn">
		    <img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/basic/stroller/stroller_2.png" alt="Camping Set"><br>
   		    스노우라인 블랙에디션<br>
		    테이블(2인용) + 릴렉스체어 2개<br>
		    일 12,000원<br>
		</button><br>
  		    <input type="button" value="선택" class="select">
    </div>
</div>
