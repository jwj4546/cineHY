<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓</title>
</head>
<body>

	<h1>웹소켓 테스트~~</h1>


	<button onclick="connect();">전화걸기</button>
	<button onclick="disconnect();">전화끊기</button>
	<script>
	
	
		var phone;
		
		function connect(){
			//접속주소(매핑값)
			
			const uri='ws://localhost:82/myapp/phone';
			phone = new WebSocket(uri); //자바에 존재하는 웹 소켓 객체생성
			
			phone.onopen =()=>{ //소켓이 연결되었을때 수행되는 핸들러
				console.log('서버에 연결 성공');
			};
			phone.onclose =()=>{ //소켓이 연결종료 되었을때 수행되는 핸들러
				console.log('서버와 연결 종료');
			};
			phone.onerror =e=>{ //
				console.log('연결 문제');
			};
			
			phone.onmessage =e=>{ 
				console.log(e);
			};
		};
		
		function disconnect(){
			phone.close();
		}
		function send(){
			const message = document.getElementById('message').value;
			phone.send(message);
		}
	
	
	</script>
	
		<input type="text" id="message">
		<button onclick="send();">메세지 전송</button>
	

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- 클라이언트용 소켓 -->
	
</body>
</html>