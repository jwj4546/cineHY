package com.hy.myapp.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hy.myapp.order.model.service.OrderServiceImpl;
import com.hy.myapp.order.model.vo.OrderVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OrderController {

	private final OrderServiceImpl orderService;
	
	@PostMapping("saveOrder")
	@ResponseBody
	public String saveOrder(@RequestBody OrderVO order) {
		return orderService.saveOrder(order) > 0 ? "true" : "false";
	}
	
}
