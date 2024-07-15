package com.hy.myapp.member.model.service;

import com.hy.myapp.member.model.vo.Member;

public interface MemberService {

	int returnNum();
	
	Member login(Member member);
	
	int insert(Member member);
	
	int update(Member member);
	
	int delete(String userId);
	
	int idCheck(String checkId);
	
	int nickCheck(String checkNick);
	
	
	
}
 