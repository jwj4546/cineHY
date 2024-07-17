<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>오픈톡메인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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


        #page3{
          height: 340px;
          width: 1200px;
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          margin: 0 auto;
          gap: 10px;
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

        .card{
			height: 700px;
            
			border-radius: 15px !important;
			background-color: rgba(0,0,0,0.4) !important;
		}

       

        .chat-icon {
            z-index: 0;
            position: fixed;
            height: 45px;
            width: 50px;
            bottom: 50px;
            right: 50px;
            z-index: 1;
            display: flex;
            justify-content: center;
            border: none;
            border-radius: 16px;
            background: rgb(41, 185,165);
            color: white;
            padding: 12px;
            font-weight: bold;
            box-shadow: 0px 5px 15px gray;
            cursor: pointer;
            
        }

        

        .chat{
			margin-top: auto;
			margin-bottom: auto;
		}
		.chat-card{
            
            z-index: 1;
            display: none; /* 처음에는 숨겨진 상태 */
            position: fixed;
            bottom: 120px;
            right: 50px;
            width: 600px;
            background-color: #fdebeb;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 15px !important;
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
		
		color: gray;
		font-size: 10px;
	}
	.msg_time_send{
		position: absolute;
		right:0;
		bottom: -15px;
		color: gray;
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
	.userID{
		position: absolute;
		bottom: -15px;
		margin-right:0px;
		color: gray;
		font-size: 10px;
		left: -45px;
	}


                
       
    </style>
    
</head>
<body>
    <header>
		<jsp:include page="../common/menubar.jsp"></jsp:include>
    </header>
      
  
     
      <div class="album py-5 bg-light">
        <div class="container">

			<!-- chat아이콘 -->
            <button class="chat-icon" id="chatIcon" onclick="chatAlert();">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat-right-text-fill" viewBox="0 0 16 16">
                    <path d="M16 2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h9.586a1 1 0 0 1 .707.293l2.853 2.853a.5.5 0 0 0 .854-.353zM3.5 3h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1 0-1m0 2.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1 0-1m0 2.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1"/>
                  </svg>
            </button>
            <button onclick="disconnect();">전화끊기</button>
            
            <script>
            
            	//처음에 채팅 이모티콘 눌렀을때만 소켓 접속하도록
                let firstConnect = false; 

                window.chatAlert = function() {
                    if (!firstConnect) { 
                        if (confirm("오픈톡에 참여하시겠습니까?")) {
                            connect();
                            firstConnect = true;
                        }
                    }
                };

                
	
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
						console.log("e",e);
						
						 const currentTime = new Date().toLocaleTimeString();
						 
						 //session에 있는 아이디와 메세지로 받은 아이디가 같으면 msg_cotainer_send 영역에 받기 -- 걍 1:1에만 적용할까
						 
					        // 채팅 메시지 출력할 부분
					        
					        	const data = JSON.parse(e.data);
            					const userId = data.userId;
            					const message = data.message;
								console.log(userId);
								console.log(message);
					        	
					        	const chatBox = $(`
							            <div class="d-flex justify-content-start mb-4">
							                <div class="img_cont_msg">
							                    <img src="https://i.namu.wiki/i/M0j6sykCciGaZJ8yW0CMumUigNAFS8Z-dJA9h_GKYSmqqYSQyqJq8D8xSg3qAz2htlsPQfyHZZMmAbPV-Ml9UA.webp" class="rounded-circle user_img_msg">
							                </div>
							                <div class="msg_cotainer">
							                    <span class="message-text"></span>
							                    <span class="msg_time"></span>
							                    <span class="userID"></span>
							                </div>
							            </div>
							        `);

							        chatBox.find('.message-text').text(message);  //메세지 내용 담음
							        chatBox.find('.userID').text(userId);
							        console.log(chatBox);
							        chatBox.find('.msg_time').text(currentTime);  //보낸 시간 담음
							        $('#contentArea').append(chatBox);  
					        	
					        
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
                <div class="container-fluid h-100">
                    <div class="row justify-content-center h-100">
        
        
                        <div class="col-md-8 col-xl-6 chat">
                            
                            <div class="chat-card" id="chatCard" >
                                <div class="card-header msg_head">
                                    <div class="d-flex bd-highlight">
                                        <div class="img_cont">
                                            <img src="https://i.namu.wiki/i/M0j6sykCciGaZJ8yW0CMumUigNAFS8Z-dJA9h_GKYSmqqYSQyqJq8D8xSg3qAz2htlsPQfyHZZMmAbPV-Ml9UA.webp" class="rounded-circle user_img">
                                            
                                        </div>
                                        <div class="user_info">
                                            <span>오픈톡</span>
                                           
                                        </div>
                                        
                                    </div>
                                    <span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
                                    <div class="action_menu">
                                        <ul>
                                            <li><i class="fas fa-user-circle"></i> View profile</li>
                                            <li><i class="fas fa-users"></i> Add to close friends</li>
                                            <li><i class="fas fa-plus"></i> Add to group</li>
                                            <li><i class="fas fa-ban"></i> Block</li>
                                        </ul>
                                    </div>
                                </div>
                                <!--채팅메세지-->
                                <div style="overflow-y: scroll; height: 500px;" id="contentArea" class="card-body msg_card_body">
        							
        							
        						
                                    
                                    <c:forEach var="talk" items="${openTalkList}">
							            <div class="d-flex justify-content-start mb-4">
							                <div class="img_cont_msg">
							                    <img src="https://i.namu.wiki/i/M0j6sykCciGaZJ8yW0CMumUigNAFS8Z-dJA9h_GKYSmqqYSQyqJq8D8xSg3qAz2htlsPQfyHZZMmAbPV-Ml9UA.webp" class="rounded-circle user_img_msg">
							                </div>
							                <div class="msg_cotainer">
							                    <span class="message-text">${talk.talkContent}</span>
							                    <span class="msg_time">${talk.talkSendDate}</span>
							                    <span class="userID">${talk.userId}</span>
							                </div>
							            </div>
        							</c:forEach>
                                    
                                </div>
                                <!--입력 창-->
                                <div class="card-footer">
                                    <div class="input-group">
                                        
                                        <textarea id="message" class="form-control type_msg" placeholder="Type your message..."></textarea>
                                        <div class="input-group-append">
                                            <button class="input-group-text send_btn" onclick="send();"><i class="fas fa-location-arrow"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>

    </main>

    <script>    
        document.getElementById('chatIcon').addEventListener('click', function() {
            var chatBox = document.getElementById('chatCard');
            if (chatBox.style.display === 'none' || chatBox.style.display === '') {
                chatBox.style.display = 'block';
            } else {
                chatBox.style.display = 'none';
            }
        });
        
        



    </script>
    
</body>
</html>