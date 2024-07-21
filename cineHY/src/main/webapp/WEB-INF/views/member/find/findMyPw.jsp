<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Password</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
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
        
        
    </style>
</head>
<body>
    <div class="card align-middle" style="width:25rem;">
        <div class="card-title" style="margin-top:30px;">
            <h2>비밀번호 찾기</h2>
        </div>
        <div class="card-body">
            <form id="findPwForm" class="form-signin">
                <label for="userId">아이디 :</label>
                <input type="text" class="form-control" id="userId" name="userId" required> <br>
                <label for="userName">이름 :</label>
                <input type="text" class="form-control" id="userName" name="userName" required> <br>
                <label for="phoneNo">전화번호:</label>
                <input type="tel" class="form-control" id="phoneNo" name="phoneNo" required> <br>
                <div>
                    <span id="findPwResult" style="font-size:12px; font-weight:bold;"></span>
                </div>
                <button id="find-btn" class="btn btn-lg btn-primary btn-block" type="button" onclick="findPw()">정보 확인하기</button><br>
                <div class="changePw" style="display: none;">
                    <a id="change-btn" class="btn btn-lg btn-danger btn-block" href="#" role="button">비밀번호 변경하기</a>
                </div>
            </form>     
        </div>
        <div class="links">
            <a href="findMyId">아이디 찾기</a> | <a href="login">로그인</a> | <a href="join">회원가입</a>
        </div>
    </div>

    <script>
        function findPw() {
            var userId = $('#userId').val();
            var userName = $('#userName').val();
            var phoneNo = $('#phoneNo').val();
            
            if (userId === "" || userName === "" || phoneNo === "") {
                alert("모든 필드를 입력해주세요.");
                return;
            }

            $.ajax({
                url: 'findMyPw.do',
                type: 'POST',
                data: { userId: userId, userName: userName, phoneNo: phoneNo },
                success: function(response) {
                    if (response === "not_found") {
                        $('#findPwResult').show().css('color', 'crimson').text("일치하는 정보가 없습니다.");
                        $('.changePw').hide();
                    } else if (response === "found") {
                        $('#findPwResult').show().css('color', 'green').text("정보가 일치합니다.");
                        $('.changePw').show();
                        $('#change-btn').attr('href', 'changeMyPw?userId=' + encodeURIComponent(userId) + '&userName=' + encodeURIComponent(userName) + '&phoneNo=' + encodeURIComponent(phoneNo));
                    }
                },
                error: function(xhr) {
                    alert("오류번호 = " + xhr.status);
                }
            });
        }
    </script>
</body>
</html>
