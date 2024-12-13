# project-1st-camcar-



배포주소
http://c5d2403t1.itwillbs.com/CamCar/

관리자 계정
- ID : admin
- PW : 1234

## 1. 프로젝트 개요

### ⛺ 서비스 요약
-------------------
- 이용자 편의를 위한 메인페이지 내 예약 시스템

- 편리한 공지사항 게시글 관리 (MVC 패턴)

- 차량 등록 및 차량 관리 (Ajax)

- 카카오톡 결제를 활용한 예약 시스템 (포트원 API)

### 🌲 개발 기간
-----------------
2024.05.14 ~ 업데이트중

|개발 환경||
|------|---|
|버전 관리|<img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/>|
|개발 도구|<img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse%20IDE&logoColor=white">|
|개발 언어 및 프레임워크|<img src="https://img.shields.io/badge/java-007396?style=flat-square&logo=java&logoColor=white"/><img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/>|
|라이브러리|<img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jQuery&logoColor=white"/><img src="https://img.shields.io/badge/MyBatis-000000?style=for-the-badge&logo=MyBatis&logoColor=white">|
|데이터베이스|<img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/>|
|협업 도구|<img alt="Slack" src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white" /><img src="https://img.shields.io/badge/Google%20Sheets-34A853?style=for-the-badge&logo=google-sheets&logoColor=white"/>|

### 👨‍💻 팀원
----------------
|팀장|부팀장|서기|팀원|팀원|
|------|---|---|---|---|
|<div align="center">[진성민](https://github.com/ns0304)</div>|<div align="center">[최민석](https://github.com/CHOIMINSEOK-KORR)</div>|<div align="center">[옥혜지](https://github.com/devok11)</div>|<div align="center">[최지민](https://github.com/yeonjinnk)</div>|<div align="center">[하지형](https://github.com/morehaji)</div>|
|관리자페이지<br>관리자페이지 CSS|회원가입/로그인<br>고객센터|메인 페이지<br>결제/예약|예약<br>차량 리스트<br>차량 상세조회|마이페이지<br>1:1문의|


## 2. 주요 기능
---------------------------------------------------------------------

|메인페이지|
|------|
|<img src="https://github.com/user-attachments/assets/8fee0113-264c-4b3c-96b6-e374556581aa"  width="800" height="750"/>|
|- 예약 시스템<br>- 공지사항 게시글<br>- 자주 묻는 질문|

|로그인|회원가입|
|------|---|
|<img src="https://github.com/user-attachments/assets/a358ee4b-f0d8-41ff-a179-2eb4805f85d2"  width="600" height="400"/>|<img src="https://github.com/user-attachments/assets/0e7d1ebc-f6de-4fb5-8b90-c351d6194179"  width="400" height="600"/>|
|- 로그인<br>- 이메일 인증 서비스와 휴대폰 번호 인증|-|


|마이페이지|
|------|
|<img src="https://github.com/user-attachments/assets/aa177e7e-7943-4fbc-a100-2d9bb114727c"  width="800" height="600"/>|
|- 판매내역<br>- 구매내역<br>- 찜한상품<br>- 회원정보 수정|

|스토어 상품|결제|
|------|------|
|<img src="https://github.com/user-attachments/assets/056aa97c-5f95-4f9f-b857-418d2e8286e4"  width="400" height="300"/>|<img src="https://github.com/user-attachments/assets/4024a029-bbab-4c1b-b7ff-70e87f455c5a"  width="400" height="300"/>|
|- 상세 이미지 확대<br>- 수량 변경|- 카카오페이 결제|

|채팅|채팅 알림|
|------|------|
|<img src="https://github.com/user-attachments/assets/da0b6dfc-eaa6-4c1b-b2b1-78f62b7601ac"  width="400" height="300"/>|<img src="https://github.com/user-attachments/assets/fee04af6-5d43-4c19-931e-ab12cc4a37b6"  width="400" height="300"/>|
|- 1:1채팅<br>- 버튼 통해 판매자는 금액 입력 및 구매자는 결제 가능<br>- 채팅 신고하기<br>- 채팅 종료|- 미확인 채팅 알림 메뉴 위 적색 아이콘으로 표시<br>- 수신된 채팅 내용을 알림 메뉴에서 확인 가능|

|최근 검색어|인기 검색어|
|------|------|
|<img src="https://github.com/user-attachments/assets/55c1ee20-209f-4ed6-9cf1-f8307c130cc2"  width="400" height="300"/>|<img src="https://github.com/user-attachments/assets/c720475e-1593-43e5-82f4-31952df56875"  width="400" height="300"/>|
|- 최근 검색어 확인|- 인기 검색어 1~20위 확인|

|상품 목록|상품 상세|
|------|------|
|<img src="https://github.com/user-attachments/assets/12da34f9-a662-44ea-a0b8-d7a1c8be7069"  width="400" height="300"/>|<img src="https://github.com/user-attachments/assets/daabd340-8ef4-4a44-88bd-7d46d993792f"  width="400" height="300"/>|
|- 카테고리 선택 <br>- 아래로 스크롤 시 게시글 자동 로딩|- 상품의 이미지가 슬라이드 형식으로 출력<br>- 거래하기, 찜하기 버튼 및 판매자 정보<br>- 판매자 본인은 수정하기/삭제하기/끌어올리기 가능

|









