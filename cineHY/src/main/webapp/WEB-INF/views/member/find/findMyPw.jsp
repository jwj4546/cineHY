<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find_id</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
    
    </style>
  </head>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
            <h2>비밀번호 찾기</h2>
		</div>
        
		<div class="card-body">
      <form action="findId" class="form-signin" method="POST">
        <label for="userName"> 아이디 : </label>
        <input type="text" class="form-control" id="userId" placeholder="아이디를 입력해주세요." name="userId" required> <br>

        <label for="email"> 이름 : </label>
        <input type="text" class="form-control" id="userName" placeholder="이름을 입력해주세요." name="userName" required> <br>

        <label for="age"> 전화번호 </label>
        <input type="number" class="form-control" id="phone" placeholder="전화번호를 입력해주세요." name="phone" required> <br>

        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" type="submit">비밀번호 찾기</button>
      </form>
      
		</div>
        <div class="links">
            <a href="findMyId">아이디 찾기</a> | <a href="login">로그인</a> | <a href="join">회원가입</a>

        </div>
	</div>
  
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비빌번호</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label"> 이름 </label>
            <input type="text" class="form-control" id="userName" value="고길동">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label"> 비밀번호</label>
            <input type = "text" textarea class="form-control" id="userPwd" value="너의 비밀번호"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
  </body>
</html>

