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
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        table * {margin:5px;}
        table {width:100%;}
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

            <table id="contentArea" algin="center" class="table">
            
            
            
                <tr>
                    <th >아이디</th>
                    <td >${member.userId }</td>               
                    <th>이름</th>
                    <td>${member.userName }</td>
                    <th>이메일</th>
                    <td>${member.email}</td>
                    <th>연락처</th>
                    <td>${member.phoneNo}</td>
                     <th>성별</th>
                    <td>${member.gender}</td>
                     <th>생년월일</th>
                    <td>${member.birthDate}</td>
                     <th>선호장르 1순위</th>
                    <td>${member.preGenre1}</td>
                     <th>선호장르 2순위</th>
                    <td>${member.preGenre2}</td>
                     <th>닉네임</th>
                    <td>${member.userNick}</td>
                     <th>가입일</th>
                    <td>${member.joinDate}</td>
                     <th>이용상태</th>
                    <td>${member.status}</td>                   
                </tr>
                
                
            </table>
            <br>

       
            </div>
            <br><br>
        </div>
        <br><br>
    </div>
    
    <script>
    
    
   
    
    
    
    		
    		
    	}
    	
    </script>
    
     <jsp:include page="../common/footer.jsp" />
    
    
    
    
</body>
</html>