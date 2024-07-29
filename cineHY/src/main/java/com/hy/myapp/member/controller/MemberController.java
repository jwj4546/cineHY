package com.hy.myapp.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hy.myapp.member.model.service.MemberService;
import com.hy.myapp.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@SessionAttributes("member")
@Controller
@Slf4j
@RequiredArgsConstructor
public class MemberController {
	
	  
	
	
	private final MemberService memberService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
	
	@GetMapping("terms")
	public String terms() {
		return "member/terms";
	}
	
	@GetMapping("checkId")
	@ResponseBody
	public String checkId(String checkId) {
		log.info(checkId);
		
		return memberService.idCheck(checkId) > 0 ? "N" : "Y";
		
		
	}
	
	
	@GetMapping("checkNick")
	@ResponseBody
	public String checkNick(String checkNick) {
		log.info(checkNick);
		
		return memberService.nickCheck(checkNick) > 0 ? "N" : "Y";
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
	
	@GetMapping("myPage")
	public String mypage() {
		
		return "member/myPage/myPage";
	}
	
	@GetMapping("adminPage")
	public String adminPage() {
		return "member/myPage/adminPage";
	}
	
	@GetMapping("myReview")
	public String myReview() {
		
		return "member/myPage/myReview";
	}
	
	@GetMapping("chatAdmin")
	public String chatAdmin() {
		
		return "member/myPage/chatAdmin";
	}
	@GetMapping("myInfoUpdate")
	public String myInfoUpdate() {
		
		return "member/myPage/myInfoUpdate";
	}
	@GetMapping("myProductList")
	public String myProductList() {
		
		return "member/myPage/myProductList";
	}
	
	@GetMapping("myTicketList")
	public String myTicketList() {
		
		return "member/myPage/myTicketList";
	}
	
	@GetMapping("myNearby")
	public String myNearby() {
		
		return "member/myPage/myNearby";
	}
	
	
	@GetMapping("resign")
	public String resign() {
		
		return "member/myPage/resign";
	
	}
	
	@PostMapping("resign.do")
	public String resign(Member member, HttpSession session, Model model) {
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    if (loginUser == null) {
	        session.setAttribute("alertMsg", "로그인이 필요합니다.");
	        return "redirect:/login";
	    }

	    String plainPwd = member.getUserPwd();
	    String encPwd = loginUser.getUserPwd();

	    if (bcryptPasswordEncoder.matches(plainPwd, encPwd)) {
	        try {
	            if (memberService.delete(member.getUserId()) > 0) {
	                session.setAttribute("alertMsg","회원 탈퇴 성공!");
	                session.removeAttribute("loginUser");
	                return "redirect:/";
	            } else {
	                session.setAttribute("alertMsg", "회원 탈퇴 실패");
	                return "redirect:/errorPage"; // 실패 시 에러 페이지로 리다이렉트
	            }
	        } catch (Exception e) {
	            session.setAttribute("alertMsg", "회원 탈퇴 중 오류가 발생했습니다.");
	            return "redirect:/errorPage"; // 예외 발생 시 에러 페이지로 리다이렉트
	        }
	    } else {
	        session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
	        return "redirect:/resign"; // 비밀번호 불일치 시 재시도 페이지로 리다이렉트
	    }
	}
	
	@PostMapping("myInfoUpdate")
	public String myInfoUpdate(Member member, HttpSession session, Model model) {
		if(memberService.update(member) > 0) {
			session.setAttribute("loginUser", memberService.login(member));
			session.setAttribute("alertMsg", "회원정보가 업데이트 되었습니다!");
			
			return "redirect:/myInfoUpdate";
		} else {
			model.addAttribute("errorMsg","실패!");
			return "common/errPage";
		}
	}
	
	
	@GetMapping("findMyPw")
    public String findMyPwPage() {
        return "member/find/findMyPw"; // JSP 파일 경로를 지정
    }

    // 비밀번호 찾기 처리
    @PostMapping("findMyPw.do")
    @ResponseBody
    public String findMyPw(@RequestParam("userId") String userId,
                           @RequestParam("userName") String userName,
                           @RequestParam("phoneNo") String phoneNo) {
        Member member = memberService.findMyPw(userId, userName, phoneNo);
        if (member == null) {
            return "not_found"; // 비밀번호를 찾을 수 없다는 메시지 반환
        } else {
            return "found"; // 비밀번호를 찾았다는 메시지 반환
        }
    }

    // 비밀번호 변경 페이지를 위한 GET 요청 처리
    @GetMapping("changeMyPw")
    public String changeMyPwPage() {
        return "member/find/changeMyPw"; // JSP 파일 경로를 지정
    }

    // 비밀번호 변경 처리
    @PostMapping("changeMyPw.do")
    public String changePw(@RequestParam("userId") String userId,
                           @RequestParam("userName") String userName,
                           @RequestParam("phoneNo") String phoneNo,
                           @RequestParam("userPwd") String userPwd,
                           Model model) {
        // 비밀번호 암호화
        String encPwd = bcryptPasswordEncoder.encode(userPwd);

        // Member 객체에 정보 설정
        Member member = new Member();
        member.setUserId(userId);
        member.setUserName(userName);
        member.setPhoneNo(phoneNo);
        member.setUserPwd(encPwd);

        // 비밀번호 변경 시도
        int result = memberService.changePw(member);

        if (result > 0) {
            model.addAttribute("member", member);
            return "redirect:/"; // 비밀번호 변경 후 리다이렉트
        } else {
            model.addAttribute("errorMessage", "비밀번호 변경에 실패했습니다.");
            return "common/errorPage"; // 오류 페이지로 리턴
        }
    }
    
    
    @GetMapping("memberList")
    public String memberList(Model model) {
        Map<String, Integer> paramMap = new HashMap<>();
        List<Member> memberList = memberService.findAll(paramMap);
        model.addAttribute("list", memberList);
        return "member/memberList";
    }
	
    
    
    @GetMapping("memberDetail")
    public String findById(@RequestParam String userId, Model model) {
      
        Member member = memberService.findById(userId);

        if (member == null) {
            model.addAttribute("message", "해당 ID의 회원을 찾을 수 없습니다: " + userId);
            return "common/errorPage"; // 에러 페이지로 이동
        }

        model.addAttribute("member", member);
        return "member/memberDetail"; // 뷰 이름 반환
    }
    
    
    @PostMapping("forceDelete")
    public String forceDelete(@RequestParam("userId") String userId, RedirectAttributes redirectAttributes) {
        int result = memberService.forceDelete(userId);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("message", "해당 유저를 강제탈퇴 완료 : " + userId);
        } else {
            redirectAttributes.addFlashAttribute("message", "해당 유저를 강제탈퇴 실패 : " + userId);
        }

        return "redirect:memberList";
    }



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
