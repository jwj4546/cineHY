package com.hy.myapp.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Payment {

	private String merchantUid;
	private String userId;
	private String userName;
	private String payMethod;
	private int amount;
	private String phoneNo;
}
