package com.hy.myapp.product.model.service;

import java.util.List;

import com.hy.myapp.product.model.vo.ProductVO;

public interface ProductService {

	List<ProductVO> findAll();

	int save(ProductVO productVO);

	ProductVO findById(int productId);
}
