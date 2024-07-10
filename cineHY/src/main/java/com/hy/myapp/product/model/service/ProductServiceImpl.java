package com.hy.myapp.product.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hy.myapp.product.model.repository.ProductRepository;
import com.hy.myapp.product.model.vo.ProductVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

	private final ProductRepository productRepository;
	
	@Override
	public List<ProductVO> findAll() {
		return productRepository.findAll();
	}

	@Override
	public int save(ProductVO productVO) {
		return productRepository.save(productVO);
	}

	@Override
	public ProductVO findById(int productId) {
		return productRepository.findById(productId);
	}

	@Override
	public int update(ProductVO productVO) {
		return productRepository.update(productVO);
	}

	@Override
	public int delete(int productId) {
		return productRepository.delete(productId);
	}

}
