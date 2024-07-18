package com.hy.myapp.payment.model.repository;

import org.apache.ibatis.annotations.Mapper;

import com.siot.IamportRestClient.response.Payment;

@Mapper
public interface PaymentRepository {

	int savePay(Payment payment);

}
