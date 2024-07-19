package com.hy.myapp.notice.model.service;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hy.myapp.notice.model.repository.NoticeRepository;
import com.hy.myapp.notice.model.vo.Notice;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{

	private final NoticeRepository noticeRepository;
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public int noticeCount() {
		return noticeRepository.noticeCount(sqlSession);
	}

	@Override
	public List<Notice> findAll(Map<String, Integer> map) {
		return noticeRepository.findAll(sqlSession,map);
	}

	@Override
	public int searchCount(Map<String, String> map) {
		return noticeRepository.searchCount(sqlSession,map);
	}

	@Override
	public List<Notice> findByConditionAndKetword(Map<String, String> map, RowBounds rowBounds) {
		return noticeRepository.findByConditionAndKetword(sqlSession,map, rowBounds);
	}

	@Override
	public int insert(Notice notice) {
		return noticeRepository.insertNoti(sqlSession, notice);
	}

	@Override
	public int increadeCount(int noticeNo) {
		return noticeRepository.increadeCount(sqlSession, noticeNo);
	}

	@Override
	public Notice findbyId(int noticeNo) {
		return noticeRepository.findbyId(sqlSession, noticeNo);
	}

	@Override
	public int delete(int noticeNo) {
		return noticeRepository.delete(sqlSession, noticeNo);
	}

}
