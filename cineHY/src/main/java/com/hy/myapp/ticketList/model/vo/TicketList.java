package com.hy.myapp.ticketList.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class TicketList {
		
	private String ticketNo;
	private String userId;
	private int seatAmount;
	private String paymentTime;
	private String seatNo;
	private String startTime;
	private String ticketDate;

}
