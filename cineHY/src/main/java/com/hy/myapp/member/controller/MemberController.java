package com.hy.myapp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hy.myapp.member.model.service.MemberService;
import com.hy.myapp.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MemberController {
	
	
    @Autowired
    private MemberService memberService;

    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("join")
	public String joinform() {
		
		return "member/joinform";
	}

	@PostMapping("join.do")
	public String join(Member member, Model model) {
		
		
		
		//log.info("평문 : {}", member.getUserPwd() );
		String encPwd = bcryptPasswordEncoder.encode(member.getUserPwd());
		//log.info("암호문 : {}", encPwd);
		member.setUserPwd(encPwd);
		
		String viewName = "";
		if(memberService.insert(member) > 0) {
			
			return "redirect:/";
			
		} else {
			model.addAttribute("errorMsg", "회원가입 실패");
			viewName = "common/errorPage";
		}
			
		return viewName;
		
	}
	
	@GetMapping("login")
	public String loginform() {
		
		return "member/loginform";
	}
	
    @PostMapping("login.do")
    public ModelAndView login(Member member, ModelAndView mv, HttpSession session) {
       System.out.println("Attempting login for user: " + member.getUserId());
        Member loginUser = memberService.login(member);
        
        if (loginUser != null) {
            System.out.println("User found: " + loginUser);
            if (bcryptPasswordEncoder.matches(member.getUserPwd(), loginUser.getUserPwd())) {
                session.setAttribute("loginUser", loginUser);
                mv.setViewName("redirect:/");
            } else {
                System.out.println("Password mismatch for user: " + member.getUserId());
                mv.addObject("errorMsg", "로그인 실패").setViewName("common/errorPage");
            }
        } else {
            System.out.println("User not found, showing error page.");
            mv.addObject("errorMsg", "로그인 실패").setViewName("common/errorPage");
        }
        return mv;
    }

	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
