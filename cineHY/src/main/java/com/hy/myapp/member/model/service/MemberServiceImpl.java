package com.hy.myapp.member.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hy.myapp.member.model.repository.MemberRepository;
import com.hy.myapp.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
		return memberRepository.update(sqlSession, member);
	}

	@Override
	public int delete(String userId) {
		return memberRepository.delete(sqlSession, userId);
	}

	@Override
	public int idCheck(String checkId) {
		
		return memberRepository.idcheck(sqlSession, checkId);
	}

	@Override
	public int nickCheck(String checkNick) {
		return memberRepository.nickCheck(sqlSession, checkNick);
	}

	@Override
    public Member findMyId(String userName, String phoneNo, String email) {
        return memberRepository.findMyId(userName, phoneNo, email);
    }

	@Override
	public Member findMyPw(String userId, String userName, String phoneNo) {
		return memberRepository.findMyPw(userId, userName, phoneNo);
	}

	
	  @Override
	    public List<Member> findAll(Map<String, Integer> map) {
	        return sqlSession.selectList("MemberMapper.findAll", map);
	}

	@Override
	public Member findById(String userId) {
		return memberRepository.findbyId(sqlSession, userId);
	}

	@Override
	public int forceDelete(String userId) {
		return memberRepository.forceDelete(sqlSession, userId);
	}

	 @Transactional
	    public int changePw(Member member) {
	        String encPwd = bcryptPasswordEncoder.encode(member.getUserPwd());
	        member.setUserPwd(encPwd);
	        
	       
	        return memberRepository.changePw(member);
	    }

	

	
	
	


	

}
