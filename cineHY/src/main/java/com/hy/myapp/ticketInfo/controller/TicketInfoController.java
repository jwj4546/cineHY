package com.hy.myapp.ticketInfo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.hy.myapp.member.model.vo.Member;
import com.hy.myapp.ticketInfo.model.service.TicketInfoService;
import com.hy.myapp.ticketInfo.model.vo.TicketInfoVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class TicketInfoController {

	private final TicketInfoService ticketInfoService;
	
	@PostMapping("saveTicket")
	public String saveTicket(@RequestBody TicketInfoVO ticketInfo) {
		
		//ticketInfoService.saveTicket(ticketInfo);
		
		return ticketInfo.getMerchantUid(); 
	}

	@GetMapping("ticketFindById") 
	public ModelAndView ticketFindById(HttpServletRequest request,
										   ModelAndView mv) {
		
		HttpSession session = request.getSession();
		String userId = ((Member)(session.getAttribute("loginUser"))).getUserId();
		List<TicketInfoVO> ticket = ticketInfoService.ticketFindById(userId);
		mv.addObject("ticket", ticket);
		mv.setViewName("member/myPage/myTicketList");
		log.info("userId : {}", userId);
		log.info("ticketInfo : {}", ticket);
		
		return mv;
	}
		
	
	
}
