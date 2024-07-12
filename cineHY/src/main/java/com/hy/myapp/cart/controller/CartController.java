package com.hy.myapp.cart.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hy.myapp.cart.model.service.CartService;
import com.hy.myapp.cart.model.vo.CartVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CartController {

	private final CartService cartService;
	
	@PostMapping("cartlist")
	public ModelAndView findById(ModelAndView mv,
								  			  String userId) {

		List<CartVO> list = cartService.findById(userId);
		
		mv.addObject("list", list);
		mv.setViewName("cart/list");
		
		return mv;
		
	}
}
