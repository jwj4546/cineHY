package com.hy.myapp.product.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hy.myapp.product.model.vo.ProductVO;

@Mapper
public interface ProductRepository {

	List<ProductVO> findAll();

	int save(ProductVO productVO);

	ProductVO findById(int productId);

}
