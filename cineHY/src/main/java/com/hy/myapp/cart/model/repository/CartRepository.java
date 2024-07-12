package com.hy.myapp.cart.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hy.myapp.cart.model.vo.CartVO;

@Mapper
public interface CartRepository {

	List<CartVO> findById(String userId);

}
