package com.hy.myapp.openTalk.handler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.json.simple.JSONObject;
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
	
	    List<OpenTalk> openTalkList = openTalkService.selectMessage();
	    session.getAttributes().put("openTalkList", openTalkList);

	    
	    if (session.getAttributes().get("isInitialized") == null) {
	        for (OpenTalk talk : openTalkList) {
	            JSONObject previousMessage = new JSONObject();
	            previousMessage.put("userId", talk.getUserId());
	            previousMessage.put("message", talk.getTalkContent());
	            previousMessage.put("sendDate", talk.getTalkSendDate().toString()); // 날짜를 문자열로 변환
	            session.sendMessage(new TextMessage(previousMessage.toString()));
	            log.info("세션에 담은 previousMessage: {}", previousMessage.toString());
	        }
	        // 초기화 상태를 세션 속성에 기록
	        session.getAttributes().put("isInitialized", true);
	    }
		
		
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String clientMessage = message.getPayload();
		log.info("clientMessage:{}",clientMessage);
	    Map<String, Object> userID = session.getAttributes();
	    
	    Member loginUser = (Member) userID.get("loginUser");
	    String userId = loginUser.getUserId();
	    
	    
	    
	    JSONObject chatMessage = new JSONObject();
	    chatMessage.put("userId", userId);
	    chatMessage.put("message", clientMessage);
	    chatMessage.put("sendDate", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())); // 현재 시간
	    for (WebSocketSession s : users) {
	        s.sendMessage(new TextMessage(chatMessage.toString()));
	    }
	    log.info("Broadcasted chatMessage: {}", chatMessage.toString());
	    
	    
		
//		//json으로 전송
//		JSONObject jsonMessage = new JSONObject();
//		jsonMessage.put("userId", userId);
//	    jsonMessage.put("message", clientMessage);
	    
		     //모든 접속된 사용자에게 메시지 전송
//		    for (WebSocketSession ws : users) {
//		        ws.sendMessage(new TextMessage(jsonMessage.toString()));
//		        
//		    }
		    
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