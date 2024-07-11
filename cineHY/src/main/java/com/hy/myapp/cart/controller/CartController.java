package com.hy.myapp.cart.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.hy.myapp.cart.model.service.CartService;
import com.hy.myapp.cart.model.vo.CartVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CartController {

	private final CartService cartService;
	
	@PostMapping("cartlist")
	public String findById(CartVO cart,
								  Model model) {
		
		List<CartVO> cartList = cartService.findById(cart);
		model.addAttribute("list", cartList);
		return "cart/list";
		
	}
}
