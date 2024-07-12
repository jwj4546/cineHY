package com.hy.myapp.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hy.myapp.member.model.repository.MemberRepository;
import com.hy.myapp.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	
	private final SqlSessionTemplate sqlSession;
	private final MemberRepository memberRepository;
	
	public int returnNum() {
		
		return 1;
	}

    @Override
    public Member login(Member member) {
       // System.out.println("Logging in with userId: " + member.getUserId());
        Member result = memberRepository.login(sqlSession, member);
       // System.out.println("Result from database: " + result);
        return result;
    }

	@Override
	public int insert(Member member) {
		return memberRepository.insert(sqlSession, member);
	}

	@Override
	public int update(Member member) {
				return 0;
	}

	@Override
	public int delete(String userId) {
				return 0;
	}

	@Override
	public int idCheck(String checkId) {
		
		return memberRepository.idcheck(sqlSession, checkId);
	}

	@Override
	public int nickCheck(String checkNick) {
		return memberRepository.nickCheck(sqlSession, checkNick);
	}

}
