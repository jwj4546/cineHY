package com.hy.myapp.payment.model.repository;

import org.apache.ibatis.annotations.Mapper;

import com.hy.myapp.payment.model.vo.PrePaymentVO;

@Mapper
public interface PrePaymentRepository {

	public void save(PrePaymentVO request);

	PrePaymentVO findById(String merchantUid);

}
