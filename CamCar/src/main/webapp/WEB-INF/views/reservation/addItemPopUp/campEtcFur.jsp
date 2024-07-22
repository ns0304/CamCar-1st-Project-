<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* .campEtcKitBtn { */
/*     width: 200px;  /* 버튼의 너비 설정 */ */
/*     height: 200px; /* 버튼의 높이 설정 */ */
/* /*     border: 1px solid gray;  /* 버튼 테두리 제거 (필요에 따라 설정) */ */ */
/*     padding: 0;    /* 내부 여백 제거 */ */
/*     background-color: white; /* 배경색 투명 */ */

/* } */

/* .campEtcKitBtn img { */
/*     width: 100%;  /* 이미지가 버튼 크기에 맞게 조정 */ */
/*     height: 100%; /* 이미지가 버튼 크기에 맞게 조정 */ */
/*     object-fit: contain; /* 이미지 비율을 유지하면서 버튼 내부에 맞춤 */ */
/*     display: block; /* 이미지를 블록 요소로 만들어 줄바꿈 없이 표시 */ */
/*     margin: auto;  /* 이미지를 수평으로 중앙 정렬 */ */
/* } */

/* #campEtcPopUp4 { */
/* 	display: flex; */
/* 	justify-content: center; */
/* } */

/* .campEtcKitBtn { */
/* 	margin: 10px; */
/* 	box-sizing: border-box; */
/* } */

/* .campEtcKitBtn button { */
/*      width: 100%;   */
/* } */

/* .campEtcKitBtnIn { */
/* 	padding-bottom: 10px; */
/* } */

/* .campEtcKitBtn .select{ */
/* 	display:block; */
/* 	margin: auto; */
/* 	margin-top: 20px; */
/* } */

.campEtcKitBtn {
      width: 200px;  /* 버튼의 너비 설정 */
      height: auto; /* 버튼의 높이 자동 조정 */
      padding: 0;    /* 내부 여백 제거 */
      background-color: white; /* 배경색 투명 */
      margin: 10px;
      box-sizing: border-box;
      text-align: center; /* Add to center align text */
}

.campEtcKitBtn img {
    width: 100%;  /* 이미지가 버튼 크기에 맞게 조정 */
    height: auto; /* 이미지 비율 유지 */
    object-fit: contain; /* 이미지 비율을 유지하면서 버튼 내부에 맞춤 */
    display: block; /* 이미지를 블록 요소로 만들어 줄바꿈 없이 표시 */
    margin: auto;  /* 이미지를 수평으로 중앙 정렬 */
}

.campEtcKitBtnIn {
    padding-bottom: 10px;
}

.quantity, .total {
    margin-top: 10px;
}

.addBtn, .removeBtn {
    margin: 5px;
    padding: 5px 10px;
    cursor: pointer;
    background-color: #f0f0f0;
    border: 1px solid #ccc;
}


.selectedItems {
    margin-top: 20px;
    font-weight: bold;
}


.campEtcKitTotal {
     font-weight: bold;
     margin-top: 20px;
}

</style>
<div id ="campEtcPopUp4">
	<div class="campEtcKitBtn">
		<button id="campEtcKit1" class="campEtcKitBtnIn">
			<img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/fur_1.jpg" alt="Camping Set"><br> 
			몬테라<br> 마름 폴딩 롤테이블<br>
			일 12,000원<br>
		</button>
		<br>
            <input type="button" value="추가" class="addBtn" onclick="updateQuantity('campEtcKit1', 1)">
            <input type="button" value="삭제" class="removeBtn" onclick="updateQuantity('campEtcKit1', -1)">
            <div id="campEtcKit1-quantity" class="quantity">수량: 0</div>
            <div id="campEtcKit1-total" class="total">총 금액: 0원</div>
            <div id="campEtcKitTotal" class="campEtcKitTotal">퍼니처 합계 금액: 0원</div>
	</div>
	<div class="campEtcKitBtn">
		<button id="campEtcKit2" class="campEtcKitBtnIn">
		    <img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/fur_2.jpg" alt="Camping Set"><br>
   		    아이언메쉬<br> 화로대테이블<br>
		    일 17,000원<br>
		</button><br>
            <input type="button" value="추가" class="addBtn" onclick="updateQuantity('campEtcKit2', 1)">
            <input type="button" value="삭제" class="removeBtn" onclick="updateQuantity('campEtcKit2', -1)">
            <div id="campEtcKit2-quantity" class="quantity">수량: 0</div>
            <div id="campEtcKit2-total" class="total">총 금액: 0원</div>
    </div>
	<div class="campEtcKitBtn">
		<button id="campEtcKit3" class="campEtcKitBtnIn">
		    <img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/fur_3.jpg" alt="Camping Set"><br>
   		    온리원<br> 릴렉스체어<br>
		    일 10,000원<br>
		</button><br>
            <input type="button" value="추가" class="addBtn" onclick="updateQuantity('campEtcKit3', 1)">
            <input type="button" value="삭제" class="removeBtn" onclick="updateQuantity('campEtcKit3', -1)">
            <div id="campEtcKit3-quantity" class="quantity">수량: 0</div>
            <div id="campEtcKit3-total" class="total">총 금액: 0원</div>
    </div>
	<div class="campEtcKitBtn">
		<button id="campEtcKit4" class="campEtcKitBtnIn">
		    <img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/fur_4.jpg" alt="Camping Set"><br>
   		    지프<br> 헥사 비비큐 테이블(BBQ 테이블)<br>
		    일 22,000원<br>
		</button><br>
            <input type="button" value="추가" class="addBtn" onclick="updateQuantity('campEtcKit4', 1)">
            <input type="button" value="삭제" class="removeBtn" onclick="updateQuantity('campEtcKit4', -1)">
            <div id="campEtcKit4-quantity" class="quantity">수량: 0</div>
            <div id="campEtcKit4-total" class="total">총 금액: 0원</div>
    </div>
	<div class="campEtcKitBtn">
		<button id="campEtcKit5" class="campEtcKitBtnIn">
		    <img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/fur_5.jpg" alt="Camping Set"><br>
   		    헬리녹스<br> 릴렉스체어 다크블루<br>
		    일 11,000원<br>
		</button><br>
            <input type="button" value="추가" class="addBtn" onclick="updateQuantity('campEtcKit5', 1)">
            <input type="button" value="삭제" class="removeBtn" onclick="updateQuantity('campEtcKit5', -1)">
            <div id="campEtcKit5-quantity" class="quantity">수량: 0</div>
            <div id="campEtcKit5-total" class="total">총 금액: 0원</div>
    </div>
	<div class="campEtcKitBtn">
		<button id="campEtcKit6" class="campEtcKitBtnIn">
		    <img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/fur_6.jpg" alt="Camping Set"><br>
   		    자칼<br> 범페체어 라이트브라운<br>
		    일 9,000원<br>
		</button><br>
            <input type="button" value="추가" class="addBtn" onclick="updateQuantity('campEtcKit6', 1)">
            <input type="button" value="삭제" class="removeBtn" onclick="updateQuantity('campEtcKit6', -1)">
            <div id="campEtcKit6-quantity" class="quantity">수량: 0</div>
            <div id="campEtcKit6-total" class="total">총 금액: 0원</div>
    </div>
	<div class="campEtcKitBtn">
		<button id="campEtcKit7" class="campEtcKitBtnIn">
		    <img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/fur_7.jpg" alt="Camping Set"><br>
   		    몬테라<br> 우디체어<br>
		    일 8,000원<br>
		</button><br>
            <input type="button" value="추가" class="addBtn" onclick="updateQuantity('campEtcKit7', 1)">
            <input type="button" value="삭제" class="removeBtn" onclick="updateQuantity('campEtcKit7', -1)">
            <div id="campEtcKit7-quantity" class="quantity">수량: 0</div>
            <div id="campEtcKit7-total" class="total">총 금액: 0원</div>
    </div>
	<div class="campEtcKitBtn">
		<button id="campEtcKit8" class="campEtcKitBtnIn">
		    <img src="${pageContext.request.servletContext.contextPath}/resources/img/add_item/camp/etc/fur_8.jpg" alt="Camping Set"><br>
   		    스노우라인<br> 미니테이블<br>
		    일 7,000원<br>
		</button><br>
            <input type="button" value="추가" class="addBtn" onclick="updateQuantity('campEtcKit8', 1)">
            <input type="button" value="삭제" class="removeBtn" onclick="updateQuantity('campEtcKit8', -1)">
            <div id="campEtcKit8-quantity" class="quantity">수량: 0</div>
            <div id="campEtcKit8-total" class="total">총 금액: 0원</div>
    </div>
</div>

    <script>
        $(document).ready(function() {
            // 각 아이템의 가격과 이름을 정의
            var items = {
                'campEtcKit1': { price: 12000, name: '몬테라 마름 폴딩 롤테이블' },
                'campEtcKit2': { price: 17000, name: '아이언메쉬 화로대테이블' },
                'campEtcKit3': { price: 10000, name: '온리원 릴렉스체어' },
                'campEtcKit4': { price: 22000, name: '지프 헥사 비비큐 테이블' },
                'campEtcKit5': { price: 11000, name: '헬리녹스 릴렉스체어 다크블루' },
                'campEtcKit6': { price: 9000, name: '자칼 범페체어 라이트브라운' },
                'campEtcKit7': { price: 8000, name: '몬테라 우디체어' },
                'campEtcKit8': { price: 7000, name: '스노우라인 미니테이블' }
            };

            // 합계 금액과 아이템 목록을 업데이트하는 함수
            function updateTotal() {
                var totalSum = 0;
                var itemList = '';
                $('.total').each(function() {
                    var itemId = $(this).attr('id').replace('-total', '');
                    var totalText = $(this).text().replace('총 금액: ', '').replace('원', '').replace(/,/g, '');
                    var total = parseInt(totalText) || 0;
                    totalSum += total;
                    
                    var quantity = $('#' + itemId + '-quantity').text().replace('수량: ', '');
                    if (parseInt(quantity) > 0) {
                        itemList += items[itemId].name + ' (' + quantity + '개)<br>';
                    }
                });
                $('#itemList').html(itemList);
                $('#campEtcKitTotal').text('퍼니처 합계 금액: ' + totalSum.toLocaleString() + '원');
                return { totalSum, itemList };
            }

            // 수량 및 총 금액을 업데이트하는 함수
            function updateQuantity(itemId, change) {
                // 수량 요소를 선택
                var quantityElement = $('#' + itemId + '-quantity');
                // 총 금액 요소를 선택
                var totalElement = $('#' + itemId + '-total');
                
                // 수량을 가져와서 정수로 변환
                var quantity = parseInt(quantityElement.text().replace('수량: ', ''));
                // 수량을 변경하고 0 이상으로 유지
                quantity = Math.max(0, quantity + change);
                // 수량 요소 업데이트
                quantityElement.text('수량: ' + quantity);
                
                // 총 금액 계산
                var total = quantity * items[itemId].price;
                // 총 금액 요소 업데이트
                totalElement.text('총 금액: ' + total.toLocaleString() + '원');

                // 합계 금액 업데이트
                updateTotal();
            }

            // '추가' 버튼 클릭 이벤트 핸들러 설정
            $('.addBtn').click(function() {
                // 버튼의 형제 요소인 버튼의 id를 가져옴
                var itemId = $(this).siblings('button').attr('id');
                // 수량을 1 증가시킴
                updateQuantity(itemId, 1);
            });

            // '삭제' 버튼 클릭 이벤트 핸들러 설정
            $('.removeBtn').click(function() {
                // 버튼의 형제 요소인 버튼의 id를 가져옴
                var itemId = $(this).siblings('button').attr('id');
                // 수량을 1 감소시킴
                updateQuantity(itemId, -1);
            });

        });
    </script>