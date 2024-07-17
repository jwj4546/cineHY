package com.hy.myapp.openTalk.model.service;

import java.util.List;

import com.hy.myapp.openTalk.model.vo.OpenTalk;

public interface OpenTalkService {

	//오픈톡 내역 조회
	List<OpenTalk> selectMessage(); 
	
	//오픈톡 추가
	int insertMsessage(OpenTalk opentalk);

	

}
