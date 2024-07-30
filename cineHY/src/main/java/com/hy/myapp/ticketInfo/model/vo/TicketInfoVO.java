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
	private String userId;
	private String userName;
	private String phoneNo;
	private String payMethod;
	private String receipt;
	private int movieCode;
	private String movieTitle;
	private int price;
	private String seatCode;
	private String startTime;
	private int screeningId;
	private String theaterCode;
	private String ticketDate;
	private String paymentTime;
}
