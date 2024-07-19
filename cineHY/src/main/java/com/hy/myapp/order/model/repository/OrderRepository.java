package com.hy.myapp.order.model.repository;

import org.apache.ibatis.annotations.Mapper;

import com.hy.myapp.order.model.vo.OrderVO;

@Mapper
public interface OrderRepository {

	int saveOrder(OrderVO order);

}
