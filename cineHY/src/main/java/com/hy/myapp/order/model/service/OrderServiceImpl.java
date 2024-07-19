package com.hy.myapp.order.model.service;

import org.springframework.stereotype.Service;

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

}
