<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
        <meta charset="UTF-8">
		<title>1:1 유저</title>
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
	<!--Coded With Love By Mutiullah Samim-->
	
	  
<body>
	
	
    
	<div class="container-fluid h-100">
        <div class="row justify-content-center h-100">
            <div class="col-md-8 col-xl-6 chat">
                <div class="card">
                    <div class="card-header msg_head">
                        <div class="d-flex bd-highlight">
                            <div class="img_cont">
                                <img src="https://i.namu.wiki/i/M0j6sykCciGaZJ8yW0CMumUigNAFS8Z-dJA9h_GKYSmqqYSQyqJq8D8xSg3qAz2htlsPQfyHZZMmAbPV-Ml9UA.webp" class="rounded-circle user_img">
                            </div>
                            <div class="user_info">
                                <span>1:1 문의하기</span>
                            </div>
                        </div>
                        <span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
                        <div class="action_menu">
                            <ul>
                                <li><i class="fas fa-user-circle"></i> 프로필 보기</li>
                                <li><i class="fas fa-users"></i> 친구 추가</li>
                                <li><i class="fas fa-plus"></i> 그룹에 추가</li>
                                <li><i class="fas fa-ban"></i> 차단</li>
                            </ul>
                        </div>
                    </div>
                    <div id="textmsg" class="card-body msg_card_body">
                        <div class="d-flex justify-content-start mb-4">
                            <div class="img_cont_msg">
                                <img src="https://i.namu.wiki/i/M0j6sykCciGaZJ8yW0CMumUigNAFS8Z-dJA9h_GKYSmqqYSQyqJq8D8xSg3qAz2htlsPQfyHZZMmAbPV-Ml9UA.webp" class="rounded-circle user_img_msg">
                            </div>
                            <div id="startmsg" class="msg_cotainer">
                                huuuuuu
                                <span class="msg_time">8:40 AM, Today</span>
                            </div>
                        </div>
                        <div class="d-flex justify-content-end mb-4">
                            <div id="endmsg" class="msg_cotainer_send">
                                <span class="msg_time_send">8:55 AM, Today</span>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="input-group">
                            <div class="input-group-append">
                                <span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
                            </div>
                            <textarea id="textMessageArea" class="form-control type_msg" placeholder="메시지를 입력하세요..."></textarea>
                            <div class="input-group-append">
                                <button  id="sendBtn" class="input-group-text send_btn"><i class="fas fa-location-arrow"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <script>
    
  
    
        $(document).ready(function() {
        	var webSocket = new WebSocket("ws://localhost:82/cineHY/user");
            var messageTextArea = document.getElementById("textMessageArea");  

            webSocket.onopen = function(message) {
                console.log('서버에 연결 성공');
            };

            webSocket.onclose = function(message) {
                console.log('서버와 연결 종료');
            };

            webSocket.onerror = function(message) {
                console.log('연결 문제');
            };

            webSocket.onmessage = e=> {  //메세지 받으면 출력
            	
            	const node = JSON.parse(e.data);
                const userId = node.userId;
				const message = node.message;
				//console.log("message",message)
                
                    let msgHTML = `
                    <div class="d-flex justify-content-end mb-4">
                        <div class="msg_cotainer_send">
                            ${message}
                            <span class="msg_time_send">, Today</span>
                        </div>
                    </div>`;
                    $("#textmsg").append(msgHTML);
               
            };
        /*
        function sendMessage() {
            const message = document.getElementById('textMessageArea').value;
          	console.log("message",message)
            webSocket.send(message); //메세지 전송하고
            
          //현재 화면에도 출력
            let msgHTML = ` 						
            <div class="d-flex justify-content-end mb-4">
                <div class="msg_cotainer_send">
                    ${message}
                    <span class="msg_time_send">, Today</span>
                </div>
            </div>`;
            $("#textmsg").append(msgHTML);
            document.getElementById('textMessageArea').value = '';
        }
        */
        
        $(document).on("click", "#sendBtn", function() {
        	const message = document.getElementById('textMessageArea').value;
        	
        	console.log(message);
        	
            if (message.trim() !== "") {
                //webSocket.send(JSON.stringify({ status: "message", message: message }));
               
                const msgHTML = $(`
                    <div class="d-flex justify-content-end mb-4">
                        <div class="msg_cotainer_send">
                            <span class="message-text"></span>
                            <span class="msg_time"></span>
                        </div>
                    </div>
                `);
                msgHTML.find('.message-text').text(message);
                $("#textmsg").append(msgHTML);
            }
            send();
        });

        function loadPreviousMessages() {
            $.ajax({
                url: '/getPreviousMessages',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    displayMessages(data);
                },
                error: function(error) {
                    console.error('이전 메시지 로드 에러:', error);
                }
            });
        }

        function displayMessages(messages) {
            let messageTextArea = document.getElementById('messageTextArea');
            messages.forEach(message => {
                messageTextArea.value += `${message.sender} => ${message.chatMsg}\n`;
            });
        }

        $(document).ready(function() {
            // 이전 메시지 로드
            // loadPreviousMessages();
        });

       

        function enter() {
            if (event.keyCode === 13) {
                sendMessage();
                return false;
            }
            return true;
        }

        function disconnect() {
            webSocket.close();
        }

        function send() {
            const message = document.getElementById('textMessageArea').value;
            webSocket.send(message);
            console.log("message보냄", message);
        }
        });

    </script>
	</body>
</html>
