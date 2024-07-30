package com.hy.myapp.ticketInfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hy.myapp.ticketInfo.model.service.TicketInfoService;
import com.hy.myapp.ticketInfo.model.vo.TicketInfoVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class TicketInfoController {

	private final TicketInfoService ticketInfoService;
	
	@PostMapping("saveTicket")
	@ResponseBody
	public String saveTicket(@RequestBody TicketInfoVO ticketInfo) {
		
		ticketInfoService.saveTicket(ticketInfo);
		
		return ticketInfo.getMerchantUid(); 
	}
}
