package com.hy.myapp.ticketInfo.model.service;

import org.springframework.stereotype.Service;

import com.hy.myapp.ticketInfo.model.repository.TicketInfoRepository;
import com.hy.myapp.ticketInfo.model.vo.TicketInfoVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TicketInfoServiceImpl implements TicketInfoService {

	private final TicketInfoRepository ticketInfoRepository;
	
	@Override
	public int saveTicket(TicketInfoVO ticketInfo) {
		return ticketInfoRepository.saveTicket(ticketInfo);
	}

}
