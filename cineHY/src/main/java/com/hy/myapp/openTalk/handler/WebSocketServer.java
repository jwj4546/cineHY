package com.hy.myapp.openTalk.handler;


import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

/*웹 소켓 서버용 클래스 (전화 교환원)
 * 
 * - 1. 인터페이스구현 
 * - 2. 클래스 상속
 * 
 * 참고로 webskSocketSession 과 httpSession은 아무런 연관이 없다. 
 * */
//public class WebSocketServer implements WebSocketHandler{	

@Slf4j
public class WebSocketServer extends TextWebSocketHandler{
	
	//connect에서 이 메서드가 호출됨
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("전화받음");
		log.info("이 세션이 뭔데", session);//접속한 사용자의 정보 id(식별값), uri
	}

	
	//클라이언트로부터 메세지 수신시에 호출이 되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		log.info("당연히 : {}", session); //사용자 정보
		log.info("메세지 : {}", message); //payload :실실적으로 전송된 데이터, byteCount :보낸 메세지의 크기(Byte단위), last :한번에 보냈는지(true) 잘라서 보냈는지 
	
		session.sendMessage(message); //서버가 보낸 메세지가 매개변수가 들어옴
	}

	
	//클라이언트가 서버로부터 연결을 끊으면 발생하는 메서든
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		
		log.info("전화끊음");	
		log.info("접속종료한 세션 : {}", session);
		log.info("접속종료한 세션 : {}", status); //code랑 reason	- 접속이 종료된 원인과 관련된 정보
	}
	
	
	
}
