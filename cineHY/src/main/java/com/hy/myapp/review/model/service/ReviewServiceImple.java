//package com.hy.myapp.review.model.service;
//
//import java.util.List;
//import java.util.Map;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.stereotype.Service;
//
//import com.hy.myapp.review.model.repository.ReviewRepository;
//import com.hy.myapp.review.model.vo.Review;
//
//import lombok.RequiredArgsConstructor;
//
//@RequiredArgsConstructor
//public class ReviewServiceImple implements ReviewService {
//
//	private final ReviewRepository reviewRepository;
//	private final SqlSessionTemplate sqlSession;
//	
//	@Override
//	public List<Review> findAllReview() {
//		return reviewRepository.findAllReview(sqlSession);
//	}
//
//	@Override
//	public List<Review> getMovieOfReview(Map<String, String> map) {
//		return reviewRepository.getMovieOfReview(sqlSession, map);
//	}
//
//}
