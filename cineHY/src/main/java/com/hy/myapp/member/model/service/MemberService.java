package com.hy.myapp.member.model.service;

import java.util.List;
import java.util.Map;

import com.hy.myapp.member.model.vo.Member;


public interface MemberService {

	int returnNum();
	
	Member login(Member member);
	
	int insert(Member member);
	
	int update(Member member);
	
	int delete(String userId);
	
	int idCheck(String checkId);
	
	int nickCheck(String checkNick);

	Member findMyId(String userName, String phoneNo, String email);
	
	Member findMyPw(String userId, String userName, String phoneNo);

	int changePw(Member member);
	
	List<Member> findAll(Map<String, Integer> map);

	Member findbyId(String userId);
	
	
	
	
}
 