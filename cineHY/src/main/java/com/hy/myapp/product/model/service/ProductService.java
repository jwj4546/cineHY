package com.hy.myapp.product.model.service;

import java.util.List;

import com.hy.myapp.product.model.vo.ProductVO;

public interface ProductService {

	List<ProductVO> findAll();
	int findCount(String id);
	
	int save(ProductVO productVO);

	ProductVO findById(int productId);

	int update(ProductVO productVO);

	int delete(int productId);

	
}
