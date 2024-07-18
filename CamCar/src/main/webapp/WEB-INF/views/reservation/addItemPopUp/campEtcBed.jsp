<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.campEtcKitBtn {
    width: 200px;  /* 버튼의 너비 설정 */
    height: 200px; /* 버튼의 높이 설정 */
/*     border: 1px solid gray;  /* 버튼 테두리 제거 (필요에 따라 설정) */ */
    padding: 0;    /* 내부 여백 제거 */
    background-color: white; /* 배경색 투명 */

}

.campEtcKitBtn img {
    width: 100%;  /* 이미지가 버튼 크기에 맞게 조정 */
    height: 100%; /* 이미지가 버튼 크기에 맞게 조정 */
    object-fit: contain; /* 이미지 비율을 유지하면서 버튼 내부에 맞춤 */
    display: block; /* 이미지를 블록 요소로 만들어 줄바꿈 없이 표시 */
    margin: auto;  /* 이미지를 수평으로 중앙 정렬 */
}

#campEtcPopUp4 {
	display: flex;
	justify-content: center;
}

.campEtcKitBtn {
	margin: 10px;
	box-sizing: border-box;
}

.campEtcKitBtn button {
     width: 100%;  
}

.campEtcKitBtnIn {
	padding-bottom: 10px;
}

.campEtcKitBtn .select{
	display:block;
	margin: auto;
	margin-top: 20px;
}

</style>
<div id ="campEtcPopUp4">
	<div class="campEtcKitBtn">
		<button id="campEtcKit1" class="campEtcKitBtnIn">
			<img
				src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/bed_1.jpg"
				alt="Camping Set"><br>듀랑고<br> 3D 렉탕글러 -32도 침낭 (부분)<br> 일 8,000원<br>
		</button>
		<br>
	    <input type="button" value="선택" class="select">
	</div>
	<div class="campEtcKitBtn">
		<button id="campEtcKit2" class="campEtcKitBtnIn">
		    <img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/bed_2.jpg" alt="Camping Set"><br>
   		    듀랑고<br> 아담&이브_이브(부분)<br>
		    일 8,000원<br>
		</button><br>
  		    <input type="button" value="선택" class="select">
    </div>
	<div class="campEtcKitBtn">
		<button id="campEtcKit3" class="campEtcKitBtnIn">
		    <img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/bed_3.jpg" alt="Camping Set"><br>
   		    몬테라<br> 3D 매트 L(전체)<br>
		    일 11,000원<br>
		</button><br>
  		    <input type="button" value="선택" class="select">
    </div>
	<div class="campEtcKitBtn">
		<button id="campEtcKit4" class="campEtcKitBtnIn">
		    <img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/bed_4.jpg" alt="Camping Set"><br>
   		    필드스테이션<br> 카펫 매트140(전체)<br>
		    일 12,000원<br>
		</button><br>
  		    <input type="button" value="선택" class="select">
    </div>
</div>
