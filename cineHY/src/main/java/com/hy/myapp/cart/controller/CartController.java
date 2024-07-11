package com.hy.myapp.cart.controller;

import org.springframework.stereotype.Controller;

import com.hy.myapp.cart.model.service.CartService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CartController {

	private final CartService cartService;
	
	/*
	 * @PostMapping("cartlist") public String findById(CartVO cart, Model model) {
	 * 
	 * List<CartVO> cartList = cartService.findById(cart);
	 * model.addAttribute("list", cartList); return "cart/list";
	 * 
	 * }
	 */
}
