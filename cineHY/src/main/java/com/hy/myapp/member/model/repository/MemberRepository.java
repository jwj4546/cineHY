package com.hy.myapp.member.model.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hy.myapp.member.model.vo.Member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MemberRepository {

    @Autowired
    private SqlSessionTemplate sqlSession;

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

    public Member findMyId(String userName, String phoneNo, String email) {
        Map<String, String> params = new HashMap<>();
        params.put("userName", userName);
        params.put("phoneNo", phoneNo);
        params.put("email", email);
        return sqlSession.selectOne("MemberMapper.findMyId", params);
    }

	public Member findMyPw(String userId, String userName, String phoneNo) {
		Map<String, String> params = new HashMap<>();
		params.put("userId", userId);
		params.put("userName", userName);
		params.put("phoneNo", phoneNo);
		return sqlSession.selectOne("MemberMapper.findMyPw", params);
	}

	public int changePw(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("MemberMapper.changePw", member);
	}

	public int update(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("MemberMapper.myInfoChange", member);
	}

	public int delete(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("MemberMapper.resign", userId);
	}

	 public List<Member> findAll(Map<String, Integer> map) {
	        return sqlSession.selectList("MemberMapper.findAll", map);
	}
}
