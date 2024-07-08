package com.hy.myapp.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hy.myapp.member.model.service.MemberService;
import com.hy.myapp.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MemberController {
	
	
	private final MemberService memberService;
	
	
	@GetMapping("join")
	public String joinform() {
		
		return "member/joinform";
	}

	@PostMapping("join.do")
	public String join(Member member, Model model) {
		
		log.info("회원가입 객체 : {}", member);
		
		String viewName = "";
		if(memberService.insert(member) > 0) {
			
			return "redirect:/";
			
		} else {
			model.addAttribute("errorMsg", "회원가입 실패");
			viewName = "common/errorPage";
		}
			
		return viewName;
		
	}
	
	
}
