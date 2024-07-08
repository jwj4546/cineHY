package com.hy.myapp.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hy.myapp.payment.model.repository.PrePaymentRepository;
import com.siot.IamportRestClient.IamportClient;

@Service
public class PaymentServiceImpl implements PaymentService {

	private IamportClient api;
	
	@Autowired
	private PrePaymentRepository prePaymentRepository;
	
	public PaymentServiceImpl() {
		this.api = new IamportClient("8006731832536307", "Rzaw0rU4BFImk2cqDjAGXcGywGGgAzLfy16909OPBxtvdxzEe1zzWonqmoQwdbiJN45sSaGqTXc1BMJs");
	}
}
