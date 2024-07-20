package com.hy.myapp.order.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hy.myapp.order.model.vo.OrderVO;

@Mapper
public interface OrderRepository {

	int saveOrder(OrderVO order);

	int deleteCart(OrderVO order);

	List<OrderVO> findById(String merchantUid);

}
