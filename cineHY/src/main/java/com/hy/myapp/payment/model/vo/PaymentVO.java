package com.hy.myapp.payment.model.vo;


import java.math.BigDecimal;

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
public class PaymentVO {

	private String merchantUid;
	private BigDecimal paidAmount;
	private String impUid;
}
