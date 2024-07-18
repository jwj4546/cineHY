package com.hy.myapp.qna.handler;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@ServerEndpoint("/admin")  
public class adminHandler {
	
	
	@GetMapping("getQna")
	public String QnaSelect() {
		return "qna/qna_admin";
	}
	
	//수정
	BufferedOutputStream bos;
	private static Session admin = null;
  
  
  
  
  // 운영자 유저가 접속을 하면 발생하는 이벤트 함수
  @OnOpen
  public void handleOpen(Session userSession) {
    // 기존에 운영자 유저의 소켓이 접속중이라면
    if (admin != null) {
      try {
        // 접속을 끊는다.
        admin.close();
      } catch (IOException e) {
 
      }
    }
    // 운영자 유저의 세션을 바꾼다.
    admin = userSession;
     //기존에 접속해 있는 유저의 정보를 운영자 client로 보낸다.
    for(String key : UserHandler.getUserKeys()) {
       //전송.. 전송
      visit(key);
    }
    
  }
  
  
  // 운영자 유저가 메시지를 보내면 발생하는 이벤트
  @OnMessage
  public void handleMessage(String message, Session userSession) throws IOException {
      // 메시지를 "#####"로 나누기.
      String[] split = message.split("#####", 2);
      
      // split 배열의 길이를 확인하여 오류를 방지
      if (split.length < 2) {
          // 배열의 길이가 2보다 작으면 예외를 발생시키지 않고 로그
          System.err.println("Invalid message format: " + message);
          return;  // 처리를 중단후 반환
      }else {
    	  

          // 앞은 key 데이터
          String key = split[0];
          // 뒤 정보는 메시지
          String msg = split[1];
          
          // 일반 유저의 key로 탐색 후 메시지 전송
          UserHandler.sendMessage(key, msg);
    	  
    	  
          System.err.println("성공: " + message);
          System.err.println("key: " + key);
          System.err.println("msg: " + msg);
          //분리 성공!
      }
      
  }
  
  
  // 접속이 끊기면 위 운영자 세션을 null 처리
  @OnClose
  public void handleClose(Session userSession) {
    admin = null;
  }
  
  // 운영자 유저로 메시지를 보내는 함수
  private static void send(String message) {
    if (admin != null) {
      try {
        admin.getBasicRemote().sendText(message);
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }
  // 일반 유저가 접속했을 때, 운영자 유저에게 알리는 함수
  public static void visit(String key) {
    // json 구조로 status는 visit이고 key는 유저 키 정보이다.(javascript와 맞추는 프로토콜)
    send("{\"status\":\"visit\", \"key\":\"" + key + "\"}");
  }
  // 일반 유저가 메시지를 보낼 때, 운영자 유저에게 알리는 함수
  public static void sendMessage(String key, String message) {
    // json 구조로 status는 message이고 key는 유저 키 정보이다.(javascript와 맞추는 프로토콜) message는 보내는 메시지이다.
    send("{\"status\":\"message\", \"key\":\"" + key + "\", \"message\":\"" + message + "\"}");
  }
  // 일반 유저가 접속을 끊을 때, 운영자 유저에게 알리는 함수
  public static void bye(String key) {
    // json 구조로 status는 bye이고 key는 유저 키 정보이다.(javascript와 맞추는 프로토콜)
    send("{\"status\":\"bye\", \"key\":\"" + key + "\"}");
  }
}