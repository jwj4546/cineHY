package com.hy.myapp.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {
	
	private int orderId;
	private int cartNo;
	private String userId;
	private String userName;
	private int productId;
	private String productName;
	private String payMethod;
	private int amount;
	private int movieCode;
	private String movieTitle;
	private int price;
	private String phoneNo;
	private String orderDay;
}
