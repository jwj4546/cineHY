package com.hy.myapp.review.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hy.myapp.review.model.repository.ReviewRepository;
import com.hy.myapp.review.model.vo.Review;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	
	private final ReviewRepository reviewRepository;
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public Review reviewCount() {
		return reviewRepository.reviewCount(sqlSession);
	}

}
