package com.hy.myapp.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {

	@GetMapping("payment")
	public String payment() {
		return "payment/payment";
	}
}