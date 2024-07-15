<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>find_id</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
            <h2>아이디 찾기</h2>
		</div>
        
		<div class="card-body">
      <form action="findId" class="form-signin" method="POST">
        <label for="userName"> 이름 : </label>
        <input type="text" class="form-control" id="userName" placeholder="이름을 입력해주세요." name="userName" required> <br>

        <label for="email"> 전화번호 : </label>
        <input type="tel" class="form-control" id="phoneNo" placeholder="전화번호를 입력해주세요." name="phoneNo" required> <br>

        <label for="age"> 이메일 </label>
        <input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요." name="email" required> <br>
                <div>
                    <span id="findIdResult" style="font-size:12px; font-weight:bold;"></span>
                </div>
                <button id="find-btn" class="btn btn-lg btn-primary btn-block" type="button" onclick="findId()">아이디 찾기</button>
            </form>
        </div>
        <div class="links" style="text-align: center; margin-top: 20px;">
            <a href="findMyPw">비밀번호 찾기</a> | <a href="login">로그인</a> | <a href="join">회원가입</a>
        </div>
    </div>

    <!-- JavaScript and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function findId() {
            var $form = $('#findForm');
            if ($('#userName').val() === "") {
                alert("이름을 입력하세요.");
                $('#userName').focus();
                return;
            }
            if ($('#phoneNo').val() === "") {
                alert("전화번호를 입력하세요");
                $('#phoneNo').focus();
                return;
            }
            if ($('#email').val() === "") {
                alert("이메일을 입력하세요.");
                $('#email').focus();
                return;
            }

            var data = {
                userName: $('#userName').val(),
                phoneNo: $('#phoneNo').val(),
                email: $('#email').val()
            };

            $.ajax({
                url: 'findMyId.do',
                method: 'POST',
                data: data,
                success: function(response) {
                    if (response) {
                        $('#findIdResult').show().css('color', 'green').text("아이디 = " + response);
                    } else {
                        $('#findIdResult').show().css('color', 'crimson').text("그런 아이디 없습니다.");
                    }
                },
                error: function(xhr) {
                    alert("에러코드 = " + xhr.status);
                }
            });
        }
    </script>
</body>
</html>