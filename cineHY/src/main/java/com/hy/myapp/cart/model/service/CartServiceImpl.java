package com.hy.myapp.cart.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hy.myapp.cart.model.repository.CartRepository;
import com.hy.myapp.cart.model.vo.CartVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

	private final CartRepository cartRepository;
	
	@Override
	public List<CartVO> findById(CartVO cart) {
		return cartRepository.findById(cart);
	}

}
