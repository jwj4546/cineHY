<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <a href="${pageContext.servletContext.contextPath }" class="navbar-brand d-flex align-items-center" style="color: #29b9a5;">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mr-2" color="white">
                    <rect x="2" y="7" width="20" height="15" rx="2" ry="2"></rect>
                    <path d="M16 3l-4 4H3L7 3z"></path>
                    <path d="M22 3l-4 4h-9L17 3z"></path>
                </svg>
                <strong>Cine HY</strong>
            </a>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="movieList">영화</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="theater">극장</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="reservation">예매</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="productlist">스토어</a>
                </li>
            </ul>
            <form class="form-inline mt-2 mt-md-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
            </form>

             <ul class="navbar-nav" style="justify-content: flex-end;">

                <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                    	<div class = "welcome">
                        <label>${sessionScope.loginUser.userNick}님 환영합니다</label> &nbsp;&nbsp;
                        </div>
                        <li class="nav-item active" style="float: right;">

                          <a class="nav-link" href="myPage">마이페이지</a>

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
</html>