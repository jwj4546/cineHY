package com.hy.myapp.ticketInfo.model.repository;

import org.apache.ibatis.annotations.Mapper;

import com.hy.myapp.ticketInfo.model.vo.TicketInfoVO;

@Mapper
public interface TicketInfoRepository {

	int saveTicket(TicketInfoVO ticketInfo);
	

}
