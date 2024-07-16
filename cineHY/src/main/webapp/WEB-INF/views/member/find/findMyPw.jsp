<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find_pw</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
   
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	

	body {
	    width:100%;
	    margin: 0;
  		padding-top: 100px;
  		padding-bottom: 200px;
	}
	
    .card {
        margin: 0 auto; 
        float: none; 
        margin-bottom: 10px; 
	}

    #btn-Yes{
        background-color: #555;
        border: none;
    }
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
 
    .card-title{
        margin-left: 30px;
    }


    a{ 
    	color: #555; text-decoration: none; 
    }

    .links{
        text-align: center;
        margin-bottom: 10px;
    }
    
    .changePw {
    	visibility : hidden;
    }
    
    </style>
  </head>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
            <h2>비밀번호 찾기</h2>
		</div>
        
		<div class="card-body">
      <form action="findPw" class="form-signin" method="POST">
        <label for="userId"> 아이디 : </label>
        <input type="text" class="form-control" id="userId" placeholder="아이디를 입력해주세요." name="userId" required> <br>

        <label for="userName"> 이름 : </label>
        <input type="text" class="form-control" id="userName" placeholder="이름을 입력해주세요." name="userName" required> <br>

        <label for="phoneNo"> 전화번호 </label>
        <input type="tel" class="form-control" id="phoneNo" placeholder="전화번호를 입력해주세요." name="phoneNo" required> <br>
		<div>
            <span id="findPwResult" style="font-size:12px; font-weight:bold;"></span>
        </div>
        <button id="find-btn" class="btn btn-lg btn-primary btn-block" type="button" onclick="findPw()">정보 확인하기</button><br>
        <div class = "changePw">
        <a id="change-btn" class="btn btn-lg btn-danger btn-block" href="changeMyPw" role="button" >비밀번호 변경하기</a>
        </div>

        
      </form>     
		</div>
        <div class="links">
            <a href="findMyId">아이디 찾기</a> | <a href="login">로그인</a> | <a href="join">회원가입</a>

        </div>
	</div>
	
	<script>
	
	
	function findPw() {
		
		var userId = $('#userId');
		var userName = $('#userName');
		var phoneNo = $('#phoneNo');
			
		
		if(userId.val() === ""){
			alert("아이디를 입력해주세요");
			userId.focus();
			return;
		}
		
		if(userName.val() === ""){
			alert("이름을 입력해주세요");
			userName.focus();
			return;
		}
		
		if(phoneNo.val() === ""){
			alert("전화번호를 입력해주세요");
			phoneNo.focus();
			return;
		}
		
		
		$(() => {
			
			
			const $changePwBtn = $('#change-btn')
		
			<!-- 
		const $findBtn = $('#find-btn')
		
		-->
		
		var data = {
	                userId: userId.val(),
	                phoneNo: phoneNo.val(),
	                userName: userName.val()
	            	};
		

		<!-- 
		
		$findBtn.click(() => {
			
			console.log('checked button');
			
			-->	
		$.ajax({
			url : 'findMyPw.do',
			data : data,
			type : 'POST',
			success : function(response) {
				if(!(response)){
					$('#findPwResult').show().css('color','crimson').text("일치하는 정보가 없습니다.");
					$('#change-btn').css('visibility', 'hidden')
					
				} else {
					$('#findPwResult').show().css('color','green').text("정보가 일치합니다");
					$('#change-btn').css('visibility', 'visible')
				}
			}, error : function(xhr) {
				alert("오류번호 =" + xhr.status);
			} 
		});
		
		});
	});
		
		
	}
	

	
	
	
	

	</script>
  </body>
</html>


