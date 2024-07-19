package com.hy.myapp.order.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hy.myapp.order.model.service.OrderServiceImpl;
import com.hy.myapp.order.model.vo.OrderVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class OrderController {

	private final OrderServiceImpl orderService;
	
	@PostMapping("saveOrder")
	@ResponseBody
	public String saveOrder(@RequestBody OrderVO order) {
		
		orderService.saveOrder(order);
		orderService.deleteCart(order);
		
		return order.getMerchantUid(); 
	}
	
	
	@GetMapping("orderResult")
	public String findById(String merchantUid, Model model) {
		List<OrderVO> list = orderService.findById(merchantUid);
		model.addAttribute("list", list);
		log.info("뭐야 이거 {}", list);
		return "payment/result";
	}
	
}
