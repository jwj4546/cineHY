package com.hy.myapp.openTalk.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hy.myapp.openTalk.model.vo.OpenTalk;

@Repository
public class OpenTalkRepository {

	

	public List<OpenTalk> selectMessage(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("openTalkMapper.selectMessage");
	}

	public int insertMessage(SqlSessionTemplate sqlSession,OpenTalk opentalk) {
		return sqlSession.insert("openTalkMapper.insertMessage", opentalk);
	}

	//채팅 내역 조회
	
	
}
