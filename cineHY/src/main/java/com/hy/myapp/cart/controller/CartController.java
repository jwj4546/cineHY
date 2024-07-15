package com.hy.myapp.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hy.myapp.cart.model.service.CartService;
import com.hy.myapp.cart.model.vo.CartVO;
import com.hy.myapp.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CartController {

	private final CartService cartService;
	
	@GetMapping("cartlist")
	public ModelAndView findById(ModelAndView mv,
											  HttpServletRequest request) {

		HttpSession session = request.getSession();
		String userId = ((Member)(session.getAttribute("loginUser"))).getUserId();
		
		List<CartVO> list = cartService.findById(userId);
		
		mv.addObject("list", list);
		mv.setViewName("cart/list");
		
		return mv; 
	}
	
	@ResponseBody
	@GetMapping("cart")
	public String findByCart(CartVO cart,
									  int productId,
									  HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String userId = ((Member)(session.getAttribute("loginUser"))).getUserId();
		
		cart.setUserId(userId);
		cart.setProductId(productId);
		
		return cartService.findByCart(cart) > 0 ? "YY" : "NN";
	}
	
	@ResponseBody
	@PostMapping("insert")
	public String apply(CartVO cart) {
		
		return cartService.apply(cart) > 0 ? "Y" : "N";
	}
	
	@ResponseBody
	@PostMapping("deleteCart")
	public String delete(CartVO cart,
								int productId,
								HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String userId = ((Member)(session.getAttribute("loginUser"))).getUserId();
		
		cart.setUserId(userId);
		cart.setProductId(productId);
		
		return cartService.delete(cart) > 0 ? "D" : "N";
	}
}
