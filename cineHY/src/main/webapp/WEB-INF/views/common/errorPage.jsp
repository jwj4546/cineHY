<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<style>
	h1
</style>

</head>
<body>
<!-- 메뉴바 -->
    <jsp:include page="../common/menubar.jsp" />

	<br>
    <div align="center">
        <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-256.png">
        <br><br>
        <h1 style="font-weight:bold;">${ erroMsg }</h1>
    </div>
    <br>
</body>
</html>