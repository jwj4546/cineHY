package com.hy.myapp.member.model.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hy.myapp.member.model.vo.Member;

@Repository
public class MemberRepository {

	public int insert(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("MemberMapper.insert", member);
	}

	public Member login(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectOne("MemberMapper.login", member);
	}


	public int idcheck(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("MemberMapper.idcheck", checkId);
	}

	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		
		return sqlSession.selectOne("MemberMapper.nickCheck", checkNick);
	}

	
	
	
	
	
	
}
