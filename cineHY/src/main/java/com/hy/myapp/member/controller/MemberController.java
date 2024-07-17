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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hy.myapp.member.model.service.MemberService;
import com.hy.myapp.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@SessionAttributes("member")
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
	    try {
	        // 회원 탈퇴 처리
	        if (memberService.delete(member.getUserId()) > 0) {
	            session.setAttribute("alertMsg", "탈퇴 성공");
	            session.removeAttribute("loginUser");
	            return "redirect:/"; 
	        } else {
	            model.addAttribute("errorMsg", "회원 탈퇴 실패");
	            return "common/errorPage";
	        }
	    } catch (Exception e) {
	        model.addAttribute("errorMsg", "회원 탈퇴 중 오류가 발생했습니다.");
	        return "common/errorPage";
	    }
	}
	
	@PostMapping("myInfoUpdate")
	public String myInfoUpdate(Member member, HttpSession session, Model model) {
		if(memberService.update(member) > 0) {
			session.setAttribute("loginUser", memberService.login(member));
			session.setAttribute("alertMsg", "회원정보가 업데이트 되었습니다!");
			
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg","실패!");
			return "common/errPage";
		}
	}
	
	
	@GetMapping("findMyId")
	public String findMyId() {
		
		return "member/find/findMyId";
	
	}
	
	@RequestMapping(value = "findMyId.do", method = RequestMethod.POST)
    @ResponseBody
    public String findMyId(@RequestParam("userName") String userName, 
                           @RequestParam("phoneNo") String phoneNo, 
                           @RequestParam("email") String email) {
       // System.out.println("userName의 이름=" + userName);
      //  System.out.println("phoneNo의 번호=" + phoneNo);
     //   System.out.println("email의 주소=" + email);

        Member member = memberService.findMyId(userName, phoneNo, email);
        if (member == null) {
            return null;
        } else {
            return member.getUserId();
        }
    }
	
	
	@GetMapping("findMyPw")
	public String findMyPw() {
		return "member/find/findMyPw";
	}
	
	@RequestMapping(value = "findMyPw.do", method = RequestMethod.POST)
	@ResponseBody
	public String findMyPw(@RequestParam("userId") String userId,
						   @RequestParam("userName") String userName,
						   @RequestParam("phoneNo") String phoneNo) {
		
	      // System.out.println("userName =" + userName);
	       //System.out.println("userId=" + userId);
	      // System.out.println("phoneNo =" + phoneNo);
	       
	      Member member = memberService.findMyPw(userId, userName, phoneNo);
	      if (member == null) {
	    	  return null;
	      } else {
	    	  return member.getUserPwd();
	      }
	     	      
	      
	}
	
	@GetMapping("changeMyPw")
	public String changeMyPw() {
		return "member/find/changeMyPw";
	}
	
	@PostMapping("changeMyPw.do")
    public String changePw(@RequestParam("userId") String userId,
                           @RequestParam("userName") String userName,
                           @RequestParam("phoneNo") String phoneNo,
                           @RequestParam("newPwd") String newPwd,
                           Model model) {
        System.out.println("Received Parameters - userId: " + userId + ", userName: " + userName + ", phoneNo: " + phoneNo);

        // 새로운 비밀번호 암호화
        String encPwd = bcryptPasswordEncoder.encode(newPwd);
        System.out.println("Encoded Password: " + encPwd);

        // Member 객체에 정보 설정
        Member member = new Member();
        member.setUserId(userId);
        member.setUserName(userName);
        member.setPhoneNo(phoneNo);
        member.setUserPwd(encPwd);

        String viewName;
        if (memberService.changePw(member) > 0) {
            System.out.println("Password changed successfully for userId: " + userId);
            model.addAttribute("member", member);
            return "redirect:/";
        } else {
            System.out.println("Failed to change password for userId: " + userId);
            model.addAttribute("errorMessage", "비밀번호 변경에 실패했습니다.");
            viewName = "common/errorPage";
        }
        return viewName;
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
