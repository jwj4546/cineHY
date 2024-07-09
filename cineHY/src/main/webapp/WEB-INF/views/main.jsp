<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hy.myapp.member.model.vo.Member" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
             
            <ul class="navbar-nav" style="justify-content: flex-end;">
                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                    	<div class = "welcome">
                        <label>${sessionScope.loginUser.userNick}님 환영합니다</label> &nbsp;&nbsp;
                        </div>
                        <li class="nav-item active" style="float: right;">
                          <a class="nav-link" href="mypage">마이페이지</a>
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
</body>
</html>
