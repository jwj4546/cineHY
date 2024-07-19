package com.hy.myapp.order.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hy.myapp.order.model.repository.OrderRepository;
import com.hy.myapp.order.model.vo.OrderVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

	private final OrderRepository orderRepository;
	
	@Override
	public int saveOrder(OrderVO order) {
		return orderRepository.saveOrder(order);
	}
	public int deleteCart(OrderVO order) {
		return orderRepository.deleteCart(order);
	}
	
	public List<OrderVO> findById(String merchantUid) {
		return orderRepository.findById(merchantUid);
	}

}
