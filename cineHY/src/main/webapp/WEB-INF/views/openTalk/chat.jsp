<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#input-form{
		
		border: 1px solid lightgrey;
		margin :auto;
		
		> input{
			width:80%;
		}
		> button{
			width:14%;
		}
	}
	
	
	#contentArea{
		width: 800px;
		height: 600px;
		border: 1px solid lightgrey;
	}

</style>
</head>
<body>


	<h1>웹소켓 테스트~~</h1>
	
	<jsp:include page="../common/menubar.jsp" /> 


	<button onclick="connect();">전화걸기</button>
	<button onclick="disconnect();">전화끊기</button>
	
	
	
	
	<script>
	
	
		var phone;
		
		function connect(){
			//접속주소(매핑값)
			
			const uri='ws://localhost:82/cineHY/group';
			phone = new WebSocket(uri);
			
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
				
				const wrap=$('<div></div>');
				wrap.text( "유저 => " + e.data + "\n");
				console.log('세션아이디 : {}',session.getId());
				//contentArea.value += "유저 => " + e.data + "\n"; 
				$('#contentArea').append(wrap);
				
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
	
	
	<div id="input-form">
		<input type="text" id="message">
		<button onclick="send();">메세지 전송</button>
		
		
	</div>
	
	<div id="contentArea">
		
	</div>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- 클라이언트용 소켓 -->
	

</body>
</html>