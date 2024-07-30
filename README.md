## 📃목차 

 - [Project Members](#팀원) 
 - [소개](#소개) 
 - [프로젝트 개요](#프로젝트-개요)
 - [개발 환경](#개발-환경)
 - [사용 기술](#사용-기술)
 - [테이블 설계](#테이블-설계)
 - [화면 구성](#화면-구성)
 - [핵심 기능](#핵심-기능)
   - [로그인/회원가입](#로그인회원가입)
   - [프로필](#프로필)
   - [게시글 CRUD](#게시글-crud)
   - [영화/해시태그 검색](#영화해시태그-검색)
   - [영화 상세 페이지](#영화-상세-페이지)
   - [영화 메인 페이지](#영화-메인-페이지)
 - [CI/CD](#cicd)
   - [무중단 배포](#무중단-배포)
 - [도메인 적용](#도메인-적용)
 - [Trouble Shooting](#trouble-shooting)
 - [UI reference license](#ui-reference-license)


## 팀원

<table>
   <tr>
    <td align="center"><b><a href="https://github.com/jwj4546">조우진</a></b></td>
    <td align="center"><b><a href="https://github.com/Kimmingle">김민아</a></b></td>
    <td align="center"><b><a href="https://github.com/kimpilgyu0214">김필규</a></b></td>
    <td align="center"><b><a href="https://github.com/leeyangie">이연정</a></b></td>
  <tr>
     <td align="center"><a href="https://github.com/jwj4546"><img src="https://avatars.githubusercontent.com/u/83587579?v=4" width="100px" /></a></td>
    <td align="center"><a href="https://github.com/Kimmingle"><img src="https://avatars.githubusercontent.com/u/110553201?v=4" width="100px" /></a></td>
     <td align="center"><a href="https://github.com/kimpilgyu0214"><img src="https://avatars.githubusercontent.com/u/160584279?v=4" width="100px" /></a></td>
      <td align="center"><a href="https://github.com/leeyangie"><img src="https://avatars.githubusercontent.com/u/160584076?v=4" width="100px" /></a></td>
  </tr>
  <tr>
    <td align="center"><b>Web Developer</b></td>
    <td align="center"><b>Web Developer</b></td>
    <td align="center"><b>Web Developer</b></td>
    <td align="center"><b>Web Developer</b></td>
</table>

## cineHY

**프로젝트 기간**: 2024-06-11 ~ 2024-08-02  
**팀 명**: 화양영화  
**한 줄 소개**: The prime of one's life  
**GitHub**: [cineHY GitHub Repository](https://github.com/jwj4546/cineHY)

## 프로젝트 개요

cineHY는 다양한 영화 목록을 외부 API를 통해 JSON 형식으로 데이터를 전달 받아 사용자가 개인 맞춤형 영화 예매를 할 수 있는 웹 사이트를 제공합니다. 영화 선호도에 따라 추천과 예매 시스템을 구현하여 사용자에게 최적의 영화 경험을 제공합니다.

## 개발 환경

- **운영체제**: Windows 10 (개발환경) / AWS EC2_Windows (운영환경)
- **IDE**: STS3 (Spring Tool Suite) 3.9.8 RELEASE, Visual Studio Code 1.91
- **DBMS**: Oracle Release 21.0.0.0.0
- **WAS**: Apache Tomcat 10
- **Language**: Java (Amazon Corretto JDK 17), JavaScript
- **Front-end**: HTML5, CSS3
- **Library**: JSTL, jQuery 3.7.1
- **Collaboration Tools**: Notion, Slack, GitHub, Google Spreadsheet

## 테이블 설계
<img src="README_IMG/erd_image.png" width="100%" />

### 주요 테이블 설명

- **TB_MOVIE_SCHEDULE Entity**
  - 영화 상영 스케줄 정보를 저장하기 위한 테이블입니다.
  - 스케줄 등록 시 일정 기간 동안 같은 상영시간을 반복 등록할 수 있도록 `STARTDATE`와 `ENDDATE` 컬럼을 구성했습니다.
  - `SCREENING_ID` 컬럼을 PK로 구성하고 SEQUENCE를 통해 값을 INSERT합니다.
  - 1개의 영화, 극장, 상영관이 여러 스케줄을 가질 수 있으며, 이 관계를 외래키로 설정하고 CASCADE 삭제를 적용했습니다.

- **TB_MOVIE Entity**
  - 상영하는 영화의 정보를 저장하기 위한 테이블입니다.
  - 영화 Open API 데이터를 조회하여 선택된 영화의 데이터를 INSERT합니다.
  - 영화 Open API의 고유값인 영화 코드를 PK로 구성했습니다.

- **TB_THEATER Entity**
  - 극장 정보를 저장하기 위한 테이블입니다.
  - 중복되지 않는 PK로 `THEATER_CODE`를 구성했습니다.

- **TB_SCREEN Entity**
  - 상영관 정보를 저장하기 위한 테이블입니다.
  - 중복되지 않는 PK로 `SCREEN_CODE`를 구성했습니다.

### 테이블 설계 시 느꼈던 점

- **데이터 모델링의 복잡성**: 이론적으로 배운 내용을 실제로 구현할 때 예상치 못한 복잡한 상황들이 발생했습니다. 조인 테이블의 설계와 데이터 타입 선택 등에서 많은 경험이 필요하다는 것을 느꼈습니다.
- **팀 협업의 중요성**: 테이블 설계는 혼자서 하는 작업이 아니라 팀원들과의 협업이 필수적입니다. 데이터베이스 구조에 대한 공통된 이해를 공유하는 것이 중요합니다.
- **정규화**: 데이터 중복을 최소화하고 무결성을 유지하기 위한 정규화의 중요성을 배웠습니다. 그러나 지나친 정규화는 성능 저하와 데이터 관리의 어려움을 초래할 수 있습니다.

## 구현 기능

### 사용자 기능

- **회원 서비스**: 로그인, 아이디 찾기, 비밀번호 찾기, 로그아웃, 회원가입, 회원탈퇴, 마이페이지 (내 정보 수정, 내 주변 영화관 찾기, 내가 작성한 리뷰 조회, 미작성 리뷰 조회), WebSocket을 통한 실시간 메시지 수신/송신, 공지사항 목록 조회 및 글 상세 보기
- **메인 페이지**: TOP5 영화, 상영예정작 게시, 스토어 목록 게시, 영화 및 영화인 통합 검색 기능
- **영화**: 상영중인 영화 조회, 상영 예정 영화 조회, 선호도별 추천 영화 조회, 영화 상세정보 보기
- **극장**: 극장별 및 날짜별 영화 스케줄 조회
- **예매**: 예매 정보 선택, 좌석 선택, 예매 결제, 예매 정보 출력 및 조회
- **스토어**: 상품 리스트 조회, 상품 상세 보기, 장바구니 추가, 수량 조절, 삭제, 결제 금액 검증, 결제 기능, 결제 정보 확인

### 관리자 기능

- **회원 관리**: 회원 목록 조회, 선택 회원 정보 상세조회, 회원 강제 탈퇴
- **영화 관리**: 영화 등록 (Open API 조회), 영화 상세정보 보기, 영화 등록, 삭제, 등록 리스트 조회, 영화 스케줄 (등록된 스케줄 조회, 영화 및 날짜별 스케줄 조회, 스케줄 등록, 삭제)
- **공지 관리**: 공지 글 등록, 삭제, 수정 (관리자만)
- **스토어 관리**: 스토어 상품 등록, 수정, 삭제

## 기여도

- **담당 기능**: 데이터베이스 설계 및 테이블 관리, 일부 기능 구현 및 테스트

## 화면 구성
| ![main](README_IMG/main.png) | ![로그인](README_IMG/login.png) | ![회원가입](README_IMG/enrollform.png) | ![마이페이지](README_IMG/mypage.png) |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|                        메인페이지                         |                       로그인                       |                       회원가입 페이지                       |                 마이페이지                  |



| ![영화리스트](README_IMG/movielist.png) | ![극장별 스케줄](README_IMG/theater.png) | ![예매페이지](README_IMG/reservation.png) | ![영화 상세페이지](README_IMG/detail.png) |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|                        영화리스트                         |                       극장별 영화스케줄                       |                       예매페이지 페이지                       |                 영화 상세페이지                  |

| ![영화검색](README_IMG/search.png) | ![리뷰](README_IMG/review.png) | ![스토어](README_IMG/product.png) | ![좌석](README_IMG/seat.png) |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|                        영화리스트                         |                       영화리뷰                      |                       스토어                       |                 좌석 선택                  |

| ![1:1 채팅](README_IMG/chat.png) | ![오픈톡](README_IMG/openchat.png) | ![영화검색](README_IMG/search.png) | ![영화 등록](README_IMG/scheduleform.png) | 
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|                        1:1채팅문의                         |                       오픈톡                      |                       영화검색                       |                 영화 스케줄 등록                  |

| ![회원정보수정](README_IMG/info.png) | ![회원관리](README_IMG/memberlist.png) | ![장바구니](README_IMG/cart.png) | ![주변영화관 찾기](README_IMG/location.png) |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|                        회원정보 수정                         |                       회원관리                      |                       장바구니                       |                 영화관 찾기                  |