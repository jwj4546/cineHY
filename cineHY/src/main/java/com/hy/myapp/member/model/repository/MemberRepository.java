package com.hy.myapp.member.model.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hy.myapp.member.model.vo.Member;

@Repository
public class MemberRepository {

	public int insert(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("MemberMapper.insert", member);
	}

	
	
	
	
	
	
}
