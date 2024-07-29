<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원관리</title>
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

        #memberList { text-align: center; }
        #memberList > tbody > tr:hover { cursor: pointer; }

        #pagingArea { width: fit-content; margin: auto; }

        #searchForm {
            width: 80%;
            margin: auto;
        }
        #searchForm > * {
            float: left;
            margin: 5px;
        }
        .select { width: 20%; }
        .text { width: 53%; }
        .searchBtn { width: 20%; }
    </style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>회원관리</h2>
            <br>
            <br>
            <table id="memberList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>이름</th>
                        <th>닉네임</th>
                        <th>아이디</th>
                        <th>가입일</th>
                        <th>강제탈퇴</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- DB에서 가져온 내용 -->
                    <!-- 조회된 결과 있을때 -->
                    <c:choose>
                        <c:when test="${list.size() == 0}">
                            <tr>
                                <td colspan="6">조회된 결과가 존재하지 않습니다</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${list}" var="member">
                                <tr class="member-detail" id="memberNo-${member.userId}">
                                    <td>${member.userName}</td>
                                    <td>${member.userNick}</td>
                                    <td>${member.userId}</td>
                                    <td>${member.joinDate}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
            <br>
        </div>
        <br><br>
    </div>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>
