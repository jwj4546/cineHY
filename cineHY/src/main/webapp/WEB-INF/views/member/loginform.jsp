<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>login</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
      html,
body {
  height: 100%;
}

body {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="userId"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 20px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
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


    </style>

  
  </head>
  <body class="text-center">
    
<form class="form-signin" id= "login_form" action = "login.do" method="post">

  <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
  <label for="userId" class="sr-only">ID</label>
  <input type="text" id="userId" class="form-control" name="userId" placeholder="ID를 입력하세요." required autofocus>
  <label for="userPwd" class="sr-only">Password</label>
  <input type="password" id="userPwd" class="form-control" name="userPwd" placeholder="Password를 입력하세요." required>
  <div class="image_btn" id = "image_btn">
    <div>
      <button><img src="https://cdn-icons-png.flaticon.com/128/3991/3991999.png" alt="카카오 아이콘"> 카카오 로그인 </button>
      <button><img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTGDlEVgNyqjAJN8vqSZP3q6aZ5QcgQsaKHDrZuCsdSYmGdKa5Z">네이버 로그인</button>
  </div>
  </div>
  <div class = "login_line" id="login_line">
    <hr>
  </div>
  <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
  
  <div class = "member_add mt-3">
    <a href="join">회원가입&nbsp;|</a> 
    <a href="findMyId">아이디 찾기&nbsp;|</a> 
    <a href="findMyPw">비밀번호 찾기</a>
    </div>
  
</form>


    
  </body>
</html>
