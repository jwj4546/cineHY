package com.hy.myapp.ticketInfo.model.vo;

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
public class TicketInfoVO {
		
	private String merchantUid;
	private String movieCode;
	private String movieTitle;
	private int amount;
	private String seat;
}
