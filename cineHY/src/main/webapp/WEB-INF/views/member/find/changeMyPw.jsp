<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
        body {
            width: 100%;
            margin: 0;
            padding-top: 100px;
            padding-bottom: 200px;
        }
        
        .card {
            margin: 0 auto; 
            float: none; 
            margin-bottom: 10px; 
        }
        
        #btn-Yes {
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
        
        .card-title {
            margin-left: 30px;
        }
        
        a { 
            color: #555; 
            text-decoration: none; 
        }
        
        .links {
            text-align: center;
            margin-bottom: 10px;
        }
        
        .buttons {
            display: flex;
            justify-content: space-between;
        }
    </style>
    
    <script>
        function pwCheck() {
            const $pwdInput = $('#userPwd');
            const $pwdInput2 = $('#userPwd2');
            const regPw = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%&*^?]).{8,16}$/;

            if (regPw.test($pwdInput.val())) {
                if ($pwdInput.val() === $pwdInput2.val()) {
                    $('#pwdCheckResult').show().css('color', 'green').text('비밀번호가 일치하며 유효한 형식입니다!');
                } else {
                    $('#pwdCheckResult').show().css('color', 'crimson').text('비밀번호가 서로 다릅니다. 다시 확인해주세요!');
                }
            } else {
                $('#pwdCheckResult').show().css('color', 'crimson').text('비밀번호는 최소 8자에서 16자까지 영문자, 숫자 및 특수 문자를 각각 하나 이상 포함해야 합니다.');
            }
        }

        function formsub(event) {
            event.preventDefault();
            const $pwdInput = $('#userPwd');
            const $pwdInput2 = $('#userPwd2');
            const regPw = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%&*^?]).{8,16}$/;

            if (regPw.test($pwdInput.val())) {
                if ($pwdInput.val() === $pwdInput2.val()) {
                    $('#changeMyPwForm').off('submit').submit(); // Prevent double submission
                } else {
                    alert('비밀번호가 일치해야 합니다!');
                }
            } else {
                alert('비밀번호 양식을 다시 확인해주세요!');
            }
        }

        $(document).ready(function() {
            $('#userPwd, #userPwd2').on('input', pwCheck);
            $('#change-btn').on('click', formsub);
        });
    </script>
</head>
<body>
    <div class="card align-middle" style="width:25rem;">
        <div class="card-title" style="margin-top:30px;">
            <h2>비밀번호 변경</h2>
        </div>
        <div class="card-body">
            <form id="changeMyPwForm" action="changeMyPw.do" class="form-signin" method="POST">     
                <input type="hidden" id="userId" name="userId" value="${userId}">
                <input type="hidden" id="userName" name="userName" value="${userName}">
                <input type="hidden" id="phoneNo" name="phoneNo" value="${phoneNo}">
                
                <label for="userPwd">새 비밀번호:</label>
                <input type="password" class="form-control" id="userPwd" name="userPwd" required><br>
                <label for="userPwd2">새 비밀번호 재입력:</label>
                <input type="password" class="form-control" id="userPwd2" name="userPwd2" required><br>
                <div>
                    <span id="pwdCheckResult" style="font-size:12px; font-weight:bold;"></span>
                </div>
                <div class="buttons">
                    <button type="submit" id="change-btn" class="btn btn-success">수정</button>
                    <a class="btn btn-danger" href="logout" role="button">돌아가기</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
