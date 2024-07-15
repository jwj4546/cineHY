package com.hy.myapp.cart.model.service;

import java.util.List;

import com.hy.myapp.cart.model.vo.CartVO;

public interface CartService {

	/* List<CartVO> findById(CartVO cart); */

	int findByCart(CartVO cart);
	
	int apply(CartVO cart);

	int delete(CartVO cart);
}
