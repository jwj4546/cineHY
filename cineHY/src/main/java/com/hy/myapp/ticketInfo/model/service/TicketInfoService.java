package com.hy.myapp.ticketInfo.model.service;

import java.util.List;

import com.hy.myapp.ticketInfo.model.vo.TicketInfoVO;

public interface TicketInfoService {

	int saveTicket(TicketInfoVO ticketInfo);

	List<TicketInfoVO> ticketFindById(String userId);

}
