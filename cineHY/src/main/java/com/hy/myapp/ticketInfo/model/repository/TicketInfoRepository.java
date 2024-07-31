package com.hy.myapp.ticketInfo.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hy.myapp.ticketInfo.model.vo.TicketInfoVO;

@Mapper
public interface TicketInfoRepository {

	int saveTicket(TicketInfoVO ticketInfo);

	List<TicketInfoVO> ticketFindById(String userId);
	

}
