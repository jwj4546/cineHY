<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

    <style>
       #page1 { height: 80px;}
        #page2 { 
          height: 80px;
          display: flex;
          justify-content: space-around;
          margin-right: 30px;
        }

        .Movie-enroll-title { 
          height: 60px;
          width: 600px;
          display: flex;
        }
        .Movie-enroll-title h2 {
          font-weight: 600;
          float: left;
          line-height: 1.7em;
        }

        #page3 {
          height: 340px;
          width: 1200px;
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          margin: 0 auto;
          gap: 10px;
        }
        
        .welcome {
          color : white;
        
        }

        #select-movie {
          grid-column: 2/3;
          grid-column-start: 1;
          grid-column-end: 3;
          width: 100%;
          height: 100%;
          display: flex;
          align-items: center;
          justify-content: center;
          background-color: darkslategrey;
        }

        #Movie-enroll-list {
          grid-column: 3/3;
          grid-column-start: 3;
          grid-column-end: 4;
          background-color: rgb(231, 231, 231);
          display: flex;
          align-items: center;
          justify-content: center;
        }

        #Movie-enroll-title-pagination {
          display: flex;
          justify-content: center;
          margin-top: 50px;
          margin-bottom: 50px;
        }

        #Movie-enroll-list-card {
          display: flex;
        }
        
p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.6em;
    font-weight: 500;
    line-height: 1.3em;
    color: pink;
}
a, a:hover, a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}

.navbar {
    padding: 15px 10px;
    background: #fff;
    border: none;
    border-radius: 0;
    margin-bottom: 40px;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}
.container-fluid {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    margin-top: 45px;
}
#sidebar .sidebar-header {
    padding: 20px;
    margin-top: 90px;
    background: #6d7fcc;
}
#sidebar .sidebar-header {
    padding: 20px;
    margin-top: 90px;
    background: #6d7fcc;
}

.navbar-btn {
    box-shadow: none;
    outline: none !important;
    border: none;
}

.line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

.wrapper {
    display: flex;
    width: 100%;
    align-items: stretch;
    perspective: 1500px;
}


#sidebar {
    min-width: 250px;
    max-width: 250px;
    background: #7386D5;
    color: #fff;
    transition: all 0.6s cubic-bezier(0.945, 0.020, 0.270, 0.665);
    transform-origin: bottom left;
}

#sidebar.active {
    margin-left: -250px;
    transform: rotateY(100deg);
}

#sidebar .sidebar-header {
    padding: 20px;
    background: #6d7fcc;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}
#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}

#sidebar ul li.active > a, a[aria-expanded="true"] {
    color: #fff;
    background: #6d7fcc;
}


a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}




/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */
#content {
    width: 100%;
    padding: 20px;
    min-height: 100vh;
    transition: all 0.3s;
}

#innerCont {
    width: 100%;
    min-height: 100vh;
}

#sidebarCollapse {
    width: 40px;
    height: 40px;
    background: #f5f5f5;
    cursor: pointer;
}

#sidebarCollapse span {
    width: 80%;
    height: 2px;
    margin: 0 auto;
    display: block;
    background: #555;
    transition: all 0.8s cubic-bezier(0.810, -0.330, 0.345, 1.375);
    transition-delay: 0.2s;
}

#sidebarCollapse span:first-of-type {
    transform: rotate(45deg) translate(2px, 2px);
}
#sidebarCollapse span:nth-of-type(2) {
    opacity: 0;
}
#sidebarCollapse span:last-of-type {
    transform: rotate(-45deg) translate(1px, -1px);
}


#sidebarCollapse.active span {
    transform: none;
    opacity: 1;
    margin: 5px auto;
}
.highlighted-item a {
    font-size: 1.2em; 
    font-weight: bold; 
    color: #fff; 
}

.highlighted-item a:hover {
    color: #f8f9fa; 
}

.centered-label {
    display: block; 
    text-align: center; 
    font-size: 2em;
    font-weight: bold;
    margin: 0; 
    padding: 20px; 
    color: #333; 
}

* {
    margin: 0;
    padding: 0;
    list-style: none;
    box-sizing: border-box;
    word-break: keep-all;
    outline: 0px solid silver;
    font-family: 'Noto Sans KR', sans-serif;
    color: black;
   
}

h1 {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 3rem;
    margin-bottom: 20px;

}

h4 {
    font-size: 0.8rem;
    margin-bottom: 40px;
}

img {
    width: 15px;
}

button {
    font-size: 0.75rem;
    text-align: center;
    border-radius: 5px;
    border: 1px solid #ddd;
    background: none;
    display: block;
    padding: 10px;
    width: 100%;
    margin: 10px auto;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    box-shadow: 2px 2px 4px #ddd;
}
 article {
    padding: 70px 8%;
    text-align: center;
    max-width: 800px;
    margin: 0 auto;
}

article>div {
    padding: 50px 25px;
    border-radius: 15px;
    border: 1px solid #ddd;
}

article input {
    text-align: left;
    width: 100%;
    padding: 10px 15px;
    margin: 5px auto;
    border-radius: 5px;
    border: 1px solid #ddd;
}
.join>div>:nth-child(2) button,
.join>div>:nth-child(8) button,
.join>div>:nth-child(9) button,
.terms div>:nth-child(4),
.sign div div>:first-child {
    background: #555;
    color: white;
}


.join>div>:nth-child(2) button:hover,
.join>div>:nth-child(8) button:hover,
.join>div>:nth-child(9) button:hover,
.terms div>:nth-child(4):hover,
.sign div div>:first-child:hover {
    box-shadow: 0px 0px;
    background: black;
}
.join div div {
    margin-bottom: 25px;
}

.join div div p {
    text-align: left;
    margin-bottom: 10px;
    font-weight: bold;
}

.join>div>:nth-child(2),
.join>div>:nth-child(8),
.join>div>:nth-child(9)
 {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.join>div>:nth-child(2) p,
.join>div>:nth-child(8) p,
.join>div>:nth-child(9) p{
    width: 100%;
}

.join>div>:nth-child(2) input {
    width: 77%;
    margin: 0;
}

.join div:nth-child(2) button {
    width: 20%;
    margin: 0;
}

.join>div>:nth-child(8) input {
    width: 62%;
    margin: 0;
}

.join div:nth-child(8) button {
    width: 35%;
    margin: 0; 
}


.join>div>:nth-child(9) input {
    width: 77%;
    margin: 0;
}
.join div:nth-child(9) button {
    width: 20%;
    margin: 0;
}



.join div:nth-child(10) div {
    text-align: left;
    padding: 10px 15px;
    border-radius: 5px;
    border: 1px solid #ddd;
    font-size: 0.9rem;
}

.join div:nth-child(10) div select {
    border: 1px;
}

.join div:nth-child(10) div select:not(.join div:nth-child(10) div select:first-of-type) {
    margin-left: 15px;
}

.join >div>:last-child div{
    font-size: 0.75rem;
    text-align: left;
    margin: 10px 0;
}

.join >div>:last-child >div:first-of-type{
    margin-bottom: 20px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 20px;
}

.join >div>:last-child div input{
    width: 5%;
    margin-right: 10px;
}

.join >div>:last-child div span{
    color: #ccc;
    font-weight: 300;
}

.join >div>:last-child div div button{
    margin: 0 5px;
    padding: 0;
    width: auto;
    border: none;
    display: inline;
}

.join >div>:last-child div div button:hover{
    box-shadow: 0 0;
}

.join >div>:last-child div button{
    margin-top: 25px;
}

.Male {
    margin-left: 4px; 
    margin-right: 20px; 
  }
  
.must {
    text-align: right;
    border: none;
}




/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
        transform: rotateY(90deg);
    }
    #sidebar.active {
        margin-left: 0;
        transform: none;
    }
    #sidebarCollapse span:first-of-type,
    #sidebarCollapse span:nth-of-type(2),
    #sidebarCollapse span:last-of-type {
        transform: none;
        opacity: 1;
        margin: 5px auto;
    }
    #sidebarCollapse.active span {
        margin: 0 auto;
    }
    #sidebarCollapse.active span:first-of-type {
        transform: rotate(45deg) translate(2px, 2px);
    }
    #sidebarCollapse.active span:nth-of-type(2) {
        opacity: 0;
    }
    #sidebarCollapse.active span:last-of-type {
        transform: rotate(-45deg) translate(1px, -1px);
    }


}


    </style>
    <title>영화등록 페이지</title>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <a href="#" class="navbar-brand d-flex align-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" 
                stroke-linecap="round" stroke-linejoin="round" class="mr-2">
                <rect x="2" y="7" width="20" height="15" rx="2" ry="2"></rect>
                <path d="M16 3l-4 4H3L7 3z"></path>
                <path d="M22 3l-4 4h-9L17 3z"></path>
            </svg>
              <strong>Cine HY</strong>
            </a>
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
              </li>
            </ul>
             
            <ul class="navbar-nav">
                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                    	<div class = "welcome">
                        <label>${sessionScope.loginUser.userNick}님 환영합니다</label> &nbsp;&nbsp;
                        </div>
                        <li class="nav-item active" style="float: right;">
                          <a class="nav-link" href="myPage">마이페이지</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="logout">로그아웃</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item active" style="float: right;">
                          <a class="nav-link" href="login">로그인</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="join">회원가입</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
          </div>
        </nav>
      </header>
      <!-- 사이드바  -->
      <div class="wrapper">
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>나의 화양영화</h3>
            </div>

            <ul class="list-unstyled components">
                <p>마이페이지</p>
                <li >
                    <a href="myInfoUpdate" >나의 정보수정 ></a>                 
                </li>
                <li>
                    <a href="myTicketList">나의 영화 예매내역</a>
                <li>
                    <a href="myProductList">나의 구매내역</a>
                </li>
                <li >
				    <a href="myReview">나의 영화 평점 & 리뷰</a>
				</li>
				<li>
                    <a href="chatAdmin">관리자와 1:1 채팅 </a>
                </li>
                <li>
                    <a href="myNearby">내 주변 영화관 찾기</a>
                </li>
                <li>
                    <a href="resign">회원탈퇴</a>
                </li>
            </ul>

        </nav>

        <div id="content">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <button type="button" id="sidebarCollapse" class="navbar-btn">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                    <div>
              		<label class="centered-label">안녕하세요! ${sessionScope.loginUser.userId}님의 마이페이지입니다</label>
              		</div>
                </div>
            </nav>
            
           <div id = "innerCont">
           
          <div class="content">
        <br><br>
        <div class="innerOuter">
           
        </div>
        <article class="changeInfo">
            <p style= "color:black; font-weight : bold"> * 회원정보 수정 *</p>
            
          
		    <form action="myInfoUpdate" method="post">
		    	
			   <br><br> <div>
			        <p>아이디는 변경이 불가합니다 </p>                
			        <input type="text" id="userId" name="userId" value="${ sessionScope.loginUser.userId }" readonly>	        
			    </div> <br><br>
			    <div>
			    	<p>비밀번호 </p>
			         <a id="change-btn" class="btn btn-lg btn-danger btn-block" href="changeMyPw" role="button" >비밀번호 변경하기</a>		        
			    </div>	 <br><br>	    
			    <div>
			        <p>이름 </p>
			        <input type="text" id="userName"  name="userName" value="${ sessionScope.loginUser.userName }">
			    </div> <br><br>
			    <div>
			        <p>이메일 </p>
			        <input type="email" id="email"  name="email" value="${ sessionScope.loginUser.email }">
			    </div> <br><br>
			    <div>
			        <p>휴대폰 </p>
			        <input type="tel" id="phoneNo"  name="phoneNo" value="${ sessionScope.loginUser.phoneNo}">
			    </div> <br><br>
			    <div>
			         <p>주소</p>
			        <div>
				    <input type="text" id="postcode" placeholder="우편번호">
				    <input type="text" id="address" placeholder="주소" name="address" value="${sessionScope.loginUser.address}"><br>
				    <input type="text" id="detailAddress" placeholder="상세주소" value="">
				    <input type="text" id="extraAddress" placeholder="참고항목" value="">
				    <input type="button" class="btn btn-dark" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
				</div> <br><br>			
			    <div>
			        <p>닉네임</p><span id="NickCheckResult" style="font-size:12px;"></span>
			        <input type="text" id="userNick" name="userNick" value="${ sessionScope.loginUser.userNick}" >
			    </div> <br><br>
			    <div class="gender" id="gender">
			        <p>성별</p>
			        <div style="display: flex; align-items: center;">
			            <input type="radio" id="Male" value="M" name="gender"><label for="Male">남자</label>
			            <input type="radio" id="Female" value="F" name="gender"><label for="Female">여자</label>
			        </div>
			    </div>	 <br><br>		   	   
			    <div>
			        <p>선호장르</p>
			        <div>
			            <div>
			                1순위 :
			               <select name="preGenre1" id="preGenre1">
						    <option value="멜로">멜로</option>
						    <option value="액션">액션</option>
						    <option value="애니메이션">애니메이션</option>
						    <option value="공포">공포</option>
						    <option value="코미디">코미디</option>
						    <option value="스릴러">스릴러</option>
						    <option value="SF">SF</option>
						    <option value="드라마">드라마</option>
						    <option value="로맨스">로맨스</option>
						    <option value="뮤지컬">뮤지컬</option>
						    <option value="판타지">판타지</option>
						    <option value="역사">역사</option>
						</select>
			                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                2순위 :
			               <select name="preGenre2" id="preGenre2">
						    <option value="멜로">멜로</option>
						    <option value="액션">액션</option>
						    <option value="애니메이션">애니메이션</option>
						    <option value="공포">공포</option>
						    <option value="코미디">코미디</option>
						    <option value="스릴러">스릴러</option>
						    <option value="SF">SF</option>
						    <option value="드라마">드라마</option>
						    <option value="로맨스">로맨스</option>
						    <option value="뮤지컬">뮤지컬</option>
						    <option value="판타지">판타지</option>
						    <option value="역사">역사</option>
						</select>
			            </div>
			        </div>
			    </div>
			    <button type="submit" id="info-btn"  class="join-btn btn-primary" >수정하기</button>
			    </form>
			
    
                    
                </div>
            </div>
        </div>

    </article>
          
   <script>
    
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
        });
        
        
		window.onload = () => {
			
			//속성 선택자
			//SessionScope.loginUser.gender
			//javascript
			//document.querySelector('input[value=${sessionScope.loginUser.gender}]').checked = true;
		}
		
		
		$(() => {
			
			//콘솔에 출력
			console.dir($('input[value="${sessionScope.loginUser.gender}"]'));
			
			$('input[value="${sessionScope.loginUser.gender}"]').attr('checked', true);
		})
			
			
		
		$(document).ready(function() {
  
		    var preGenre1 = "${sessionScope.loginUser.preGenre1}";
		    var preGenre2 = "${sessionScope.loginUser.preGenre2}";
		
		    
		    $('#preGenre1').val(preGenre1);
		    $('#preGenre2').val(preGenre2);
		});
		
	</script>
	
	  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();
	    }
	</script>

	
	
     
</body>
</html>
