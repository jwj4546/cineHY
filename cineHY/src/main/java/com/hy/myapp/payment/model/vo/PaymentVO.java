package com.hy.myapp.payment.model.vo;

import java.math.BigDecimal;

import lombok.Getter;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.NoArgsConstructor;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PaymentVO {

	private String merchantUid;
	private BigDecimal amount;
	private String impUid;
}
