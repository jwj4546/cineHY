<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원정보 상세보기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style> 
        .content {
            background-color: rgb(247, 245, 245);
            width: 80%;
            margin: auto;
        }
        .innerOuter {
            border: 1px solid lightgray;
            width: 80%;
            margin: auto;
            padding: 5% 10%;
            background-color: white;
        }
        table {
            width: 100%;
            margin: 5px 0;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>회원 상세보기</h2>
            <br>
            <a class="btn btn-secondary" style="float:right;" href="memberList">목록으로</a>
            <br><br>
            <table id="contentArea" class="table table-bordered">
                <tr>
				    <th>아이디</th>
				    <td>${member.userId}</td>
				</tr>
				<tr>
				    <th>이름</th>
				    <td>${member.userName}</td>
				</tr>
				<tr>
				    <th>이메일</th>
				    <td>${member.email}</td>
				</tr>
				<tr>
				    <th>연락처</th>
				    <td>${member.phoneNo}</td>
				</tr>
				<tr>
				    <th>성별</th>
				    <td>${member.gender}</td>
				</tr>
				<tr>
				    <th>생년월일</th>
				    <td>${member.birthDate}</td>
				</tr>
				<tr>
				    <th>선호장르 1순위</th>
				    <td>${member.preGenre1}</td>
				</tr>
				<tr>
				    <th>선호장르 2순위</th>
				    <td>${member.preGenre2}</td>
				</tr>
				<tr>
				    <th>닉네임</th>
				    <td>${member.userNick}</td>
				</tr>
				<tr>
				    <th>가입일</th>
				    <td>${member.joinDate}</td>
				</tr>
				<tr>
				    <th>이용상태</th>
				    <td>${member.status}</td>
				</tr>
            </table>
            <br>
        </div>
        <br><br>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>
