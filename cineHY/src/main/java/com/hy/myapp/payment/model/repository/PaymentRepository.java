package com.hy.myapp.payment.model.repository;

import org.apache.ibatis.annotations.Mapper;

import com.hy.myapp.payment.model.vo.Pay;


@Mapper
public interface PaymentRepository {

	int savePay(Pay pay);

}
