package com.hy.myapp.payment.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.hy.myapp.payment.model.service.PaymentServiceImpl;
import com.hy.myapp.payment.model.vo.PaymentVO;
import com.hy.myapp.payment.model.vo.PrePaymentVO;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PaymentController {


	private final PaymentServiceImpl paymentServiceImpl;
	
	@GetMapping("payment")
	public String payment() {
		return "payment/payment";
	}
	
	@PostMapping("/payment/prepare")
	public void preparePayment(@RequestBody PrePaymentVO request) throws IamportResponseException, IOException {
		paymentServiceImpl.postPrepare(request);
	}
	
	@PostMapping("/payment/validate")
	public Payment validatePayment(@RequestBody PaymentVO request) throws IamportResponseException, IOException {
		
		return paymentServiceImpl.validatePayment(request);
		
	}
}
