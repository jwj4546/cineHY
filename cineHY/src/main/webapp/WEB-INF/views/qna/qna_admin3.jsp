<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
        <meta charset="UTF-8">
		<title>1:1문의 관리자용</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
		
		<style>
		
	body,html{
	    height: 100%;
	    margin: 0;
	  
	}
	
	.chat{
	    margin-top: auto;
	    margin-bottom: auto;
	}
	.card{
	    height: 700px;
	    
	    border-radius: 15px !important;
	    background-color: rgba(0,0,0,0.4) !important;
	}
	.contacts_body{
	    padding:  0.75rem 0 !important;
	    overflow-y: auto;
	    white-space: nowrap;
	}
	.msg_card_body{
	    overflow-y: auto;
	}
	.card-header{
	    border-radius: 15px 15px 0 0 !important;
	    border-bottom: 0 !important;
	}
	.card-footer{
	border-radius: 0 0 15px 15px !important;
	    border-top: 0 !important;
	}
	.container{
	    align-content: center;
	}
	.search{
	    border-radius: 15px 0 0 15px !important;
	    background-color: rgba(0,0,0,0.3) !important;
	    border:0 !important;
	    color:white !important;
	}
	.search:focus{
	     box-shadow:none !important;
	   outline:0px !important;
	}
	.type_msg{
	    background-color: rgba(0,0,0,0.3) !important;
	    border:0 !important;
	    color:white !important;
	    height: 60px !important;
	    overflow-y: auto;
	}
	    .type_msg:focus{
	     box-shadow:none !important;
	   outline:0px !important;
	}
	.attach_btn{
	border-radius: 15px 0 0 15px !important;
	background-color: rgba(0,0,0,0.3) !important;
	    border:0 !important;
	    color: white !important;
	    cursor: pointer;
	}
	.send_btn{
	border-radius: 0 15px 15px 0 !important;
	background-color: rgba(0,0,0,0.3) !important;
	    border:0 !important;
	    color: white !important;
	    cursor: pointer;
	}
	.search_btn{
	    border-radius: 0 15px 15px 0 !important;
	    background-color: rgba(0,0,0,0.3) !important;
	    border:0 !important;
	    color: white !important;
	    cursor: pointer;
	}
	.contacts{
	    list-style: none;
	    padding: 0;
	}
	.contacts li{
	    width: 100% !important;
	    padding: 5px 10px;
	    margin-bottom: 15px !important;
	}
	.active{
	    background-color: rgba(0,0,0,0.3);
	}
	.user_img{
	    height: 70px;
	    width: 70px;
	    border:1.5px solid #f5f6fa;
	
	}
	.user_img_msg{
	    height: 40px;
	    width: 40px;
	    border:1.5px solid #f5f6fa;
	
	}
	.img_cont{
	    position: relative;
	    height: 70px;
	    width: 70px;
	}
	.img_cont_msg{
	    height: 40px;
	    width: 40px;
	}
	.online_icon{
	position: absolute;
	height: 15px;
	width:15px;
	background-color: #4cd137;
	border-radius: 50%;
	bottom: 0.2em;
	right: 0.4em;
	border:1.5px solid white;
	}
	.offline{
	background-color: #c23616 !important;
	}
	.user_info{
	margin-top: auto;
	margin-bottom: auto;
	margin-left: 15px;
	}
	.user_info span{
	font-size: 20px;
	color: white;
	}
	.user_info p{
	font-size: 10px;
	color: rgba(255,255,255,0.6);
	}
	.video_cam{
	margin-left: 50px;
	margin-top: 5px;
	}
	.video_cam span{
	color: white;
	font-size: 20px;
	cursor: pointer;
	margin-right: 20px;
	}
	.msg_cotainer{
	margin-top: auto;
	margin-bottom: auto;
	margin-left: 10px;
	border-radius: 25px;
	background-color: #82ccdd;
	padding: 10px;
	position: relative;
	}
	.msg_cotainer_send{
	margin-top: auto;
	margin-bottom: auto;
	margin-right: 10px;
	border-radius: 25px;
	background-color: #78e08f;
	padding: 10px;
	position: relative;
	}
	.msg_time{
	position: absolute;
	left: 0;
	bottom: -15px;
	color: rgba(255,255,255,0.5);
	font-size: 10px;
	}
	.msg_time_send{
	position: absolute;
	right:0;
	bottom: -15px;
	color: rgba(255,255,255,0.5);
	font-size: 10px;
	}
	.msg_head{
	position: relative;
	}
	#action_menu_btn{
	position: absolute;
	right: 10px;
	top: 10px;
	color: white;
	cursor: pointer;
	font-size: 20px;
	}
	.action_menu{
	z-index: 1;
	position: absolute;
	padding: 15px 0;
	background-color: rgba(0,0,0,0.5);
	color: white;
	border-radius: 15px;
	top: 30px;
	right: 15px;
	display: none;
	}
	.action_menu ul{
	list-style: none;
	padding: 0;
	margin: 0;
	}
	.action_menu ul li{
	width: 100%;
	padding: 10px 15px;
	margin-bottom: 5px;
	}
	.action_menu ul li i{
	padding-right: 10px;
	
	}
	.action_menu ul li:hover{
	cursor: pointer;
	background-color: rgba(0,0,0,0.2);
	}
	@media(max-width: 576px){
	.contacts_card{
	margin-bottom: 15px !important;
	}
	}
	</style>
   		
    
    </head>
    
<body>
    <jsp:include page="../common/menubar.jsp"></jsp:include>
    <div class="container-fluid h-100">
        <div class="row justify-content-center h-100">
            <div class="col-md-4 col-xl-3 chat">
                <div class="card mb-sm-3 mb-md-0 contacts_card">
                    <div class="card-header">
                        <div class="input-group">
                            <input type="text" placeholder="Search..." name="" class="form-control search">
                            <div class="input-group-prepend">
                                <span class="input-group-text search_btn"><i class="fas fa-search"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="card-body contacts_body">
                        <ul class="contacts" id="userList">
                            <!-- 동적으로 추가될 유저 목록 -->
                        </ul>
                    </div>
                </div>
            </div>
            <div id="chatContainer" class="col-md-8 col-xl-6 chat">
                <div id="chatTemplate" class="card d-none">
                    <div class="card-header msg_head">
                        <div class="d-flex bd-highlight">
                            <div class="img_cont">
                                <img src="https://i.namu.wiki/i/M0j6sykCciGaZJ8yW0CMumUigNAFS8Z-dJA9h_GKYSmqqYSQyqJq8D8xSg3qAz2htlsPQfyHZZMmAbPV-Ml9UA.webp" class="rounded-circle user_img">
                            </div>
                            <div class="user_info">
                                <span class="chat_user_name">관리자</span>
                                <p class="msg_count">0 Messages</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-body msg_card_body">
                    </div>
                    <div class="card-footer">
                        <div class="input-group">
                        	<form>
	                            <textarea id="console" class="form-control type_msg" placeholder="메시지를 입력하세요..."></textarea>
	                            <div class="input-group-append">
	                                <input type="button"  class="input-group-text send_btn"  value="Send" type="button" class="sendBtn"/>    
	                            </div>
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        var webSocket = new WebSocket("ws://localhost:82/myapp/admin");

        webSocket.onopen = function(message) {
            console.log('서버에 연결 성공');
        };

        webSocket.onclose = function(message) {
            console.log('서버와 연결 종료');
        };

        webSocket.onerror = function(message) {
            console.log('연결 문제');
        };

        webSocket.onmessage = function(message) {   //유저한테서 메세지가 옴
        	
        	console.log(message);
        
            let node = JSON.parse(message.data);
        
            const currentTime = new Date().toLocaleTimeString();

            if (node.status === "visit") {
            	
            	let form = $(".card-body").html();
            	
            	form = $("<div class='float-left'></div>").attr("data-key", node.key).append(form);
            	$("body").append(form);  
            	
            	
                const userKey = node.key;
                const userList = document.getElementById('userList');
                const userItem = document.createElement('li');
                userItem.classList.add('active');
                userItem.setAttribute('data-key', userKey);
                userItem.innerHTML = `
                    <div class="d-flex bd-highlight">
                        <div class="img_cont">
                            <img src="https://i.namu.wiki/i/M0j6sykCciGaZJ8yW0CMumUigNAFS8Z-dJA9h_GKYSmqqYSQyqJq8D8xSg3qAz2htlsPQfyHZZMmAbPV-Ml9UA.webp" class="rounded-circle user_img">
                        </div>
                        <div class="user_info">
                            <span>${userKey}</span>
                            <p>Online</p>
                        </div>
                    </div>
                `;
                userList.appendChild(userItem);

                const chatContainer = document.getElementById('chatContainer');
                const chatTemplate = document.getElementById('chatTemplate').cloneNode(true);
                chatTemplate.classList.remove('d-none');
                chatTemplate.setAttribute('data-key', userKey);
                chatContainer.appendChild(chatTemplate);
                
            } else if (node.status === "message") {
            	
            	let $div = $("[data-key='"+node.key+"']");    
            	let log = $div.find("#console").val();             
            	$div.find("#console").val(log +node.message + "\n");  
            	
                const chatBox = document.querySelector(`div[data-key='${data.key}'] .msg_card_body`);
                const messageDiv = document.createElement('div');
                messageDiv.classList.add('d-flex', 'justify-content-start', 'mb-4');
                messageDiv.innerHTML = `
                    <div class="img_cont_msg">
                        <img src="https://i.namu.wiki/i/M0j6sykCciGaZJ8yW0CMumUigNAFS8Z-dJA9h_GKYSmqqYSQyqJq8D8xSg3qAz2htlsPQfyHZZMmAbPV-Ml9UA.webp" class="rounded-circle user_img_msg">
                    </div>
                    <div class="msg_cotainer">
                        <span class="message-text">${data.message}</span>
                        <span class="msg_time">${currentTime}</span>
                    </div>
                `;
                chatBox.appendChild(messageDiv);
                
            } else if (node.status === "bye") {
                document.querySelector(`div[data-key='${data.key}']`).remove();
                document.querySelector(`li[data-key='${data.key}']`).remove();
            }
        };
        
        
     // 전송 버튼을 클릭하면 발생하는 이벤트    
		$(document).on("click", ".sendBtn", function(){      // div 태그를 찾는다.      
			let $div = $(this).closest(".float-left");      
			let message = $div.find(".message").val();         
			let key = $div.data("key");          
			let log = $div.find(".console").val();      // 아래에 메시지를 추가한다.     
			
			// 텍스트 메시지 영역에 관리자가 보낸 메시지 추가
		    $div.find(".console").val(log + "(관리자) => " + message + "\n");

		    // 텍스트 박스 값 초기화
		    $div.find(".message").val("");

		    // 웹 소켓으로 메시지 보냄
		    webSocket.send(key + "#####" + message);
		});   
		/*
        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('send_btn')) {
                const chatCard = event.target.closest('.card');
                const message = chatCard.querySelector('.type_msg').value.trim();
                if (message) {
                    const userKey = chatCard.getAttribute('data-key');
                    const currentTime = new Date().toLocaleTimeString();

                    const messageDiv = document.createElement('div');
                    messageDiv.classList.add('d-flex', 'justify-content-end', 'mb-4');
                    messageDiv.innerHTML = `
                        <div class="msg_cotainer_send">
                            <span class="message-text">${message}</span>
                            <span class="msg_time">${currentTime}</span>
                        </div>
                    `;
                    chatCard.querySelector('.msg_card_body').appendChild(messageDiv);

                    //webSocket.send(JSON.stringify({ key: userKey, message: message }));
                    webSocket.send(userkey+"#####"+message);
                }
            }
        });
		*/

        document.addEventListener('keydown', function(event) {
            if (event.target.classList.contains('type_msg') && event.key === 'Enter') {
                event.preventDefault();
                event.target.closest('.card').querySelector('.send_btn').click();
            }
        });
    </script>
</body>


</html>
