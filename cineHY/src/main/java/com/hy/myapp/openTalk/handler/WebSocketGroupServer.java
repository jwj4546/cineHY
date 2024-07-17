package com.hy.myapp.openTalk.handler;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.hy.myapp.member.model.vo.Member;
import com.hy.myapp.openTalk.model.service.OpenTalkService;
import com.hy.myapp.openTalk.model.vo.OpenTalk;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
@RequestMapping("/phone")
public class WebSocketGroupServer extends TextWebSocketHandler {

	// 사용자 정보 저장용
	private Set<WebSocketSession> users = new CopyOnWriteArraySet();
	
	//사용자 Httpsession userId 저장용
	private Map<String, Object> userID; 
	
	@Autowired
	private OpenTalkService openTalkService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("사용자 접속");
		users.add(session);  //사용자 추가
		log.info("현재 {}명 접속중", users.size());
		//session.sendMessage(new TextMessage("Session ID: " + session.getId()));
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String clientMessage = message.getPayload();
		
		//TextMessage newMessage = new TextMessage((CharSequence)message.getPayload());
		//TextMessage newMessage2 = new TextMessage(session.getAttributes()+"님이 입장함"); Member객체 출력
		
		userID = session.getAttributes();
		
		Member loginUser = (Member)userID.get("loginUser");
		String userId = loginUser.getUserId();
		
		
		//json으로 전송
		String jsonMessage = String.format("{\"userId\": \"%s\", \"message\": \"%s\"}", userId, clientMessage);

		    // 모든 접속된 사용자에게 메시지 전송
		    for (WebSocketSession ws : users) {
		        ws.sendMessage(new TextMessage(jsonMessage));
		        log.info(userId);
		        
		    }
		    
		    // 메시지 저장
		    OpenTalk openTalk = new OpenTalk();
		    openTalk.setUserId(userId);
		    openTalk.setTalkContent(clientMessage);
		    int test = openTalkService.insertMsessage(openTalk);
		    
	
		 
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
		log.info("접속종료 현재 {}명 접속중", users.size());
	}
	
	

}