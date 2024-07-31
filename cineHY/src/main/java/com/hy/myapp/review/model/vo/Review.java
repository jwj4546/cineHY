package com.hy.myapp.review.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Review {
	
	private int reviewNo;  
	private String reviewContent;
	private String reviewDate;
	private int star;
	private String status;
	private String userId;
	private int movieCode;
	private String ticketNo;
	private double ratingAvg;
	private String movieTitle;
    private String paymentTime;
    private String merchantUid;
}
