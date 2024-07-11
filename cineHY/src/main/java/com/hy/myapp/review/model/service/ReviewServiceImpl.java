package com.hy.myapp.review.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hy.myapp.review.model.repository.ReviewRepository;
import com.hy.myapp.review.model.vo.Review;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReviewServiceImpl implements ReviewService {
	
	private final ReviewRepository reviewRepository;
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public List<Review> findAllReview() {
		return reviewRepository.findAllReview(sqlSession);
	}

	@Override
	public List<Review> getMovieOfReview(int movieCode) {
		return reviewRepository.getMovieOfReview(sqlSession, movieCode);
	}

	@Override
	public String getTicketNo() {
		return reviewRepository.getTicketNo(sqlSession);
	}

	@Override
	public Review getTicket() {
		return null;
	}

	@Override
	public int insertReview(Review review) {
		return reviewRepository.insertReview(sqlSession, review);
	}

	
	@Override
	public Review reviewAndReview(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> findTopBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	

}