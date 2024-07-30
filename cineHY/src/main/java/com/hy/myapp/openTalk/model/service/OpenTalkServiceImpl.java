package com.hy.myapp.openTalk.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hy.myapp.openTalk.model.repository.OpenTalkRepository;
import com.hy.myapp.openTalk.model.vo.OpenTalk;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OpenTalkServiceImpl implements OpenTalkService {

	
	private final OpenTalkRepository openTalkRepository;
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public List<OpenTalk> selectMessage() {

		return openTalkRepository.selectMessage(sqlSession);
	}
	
	@Override
	public int insertMsessage(OpenTalk opentalk) {
		return openTalkRepository.insertMessage(sqlSession, opentalk);
	}

}
