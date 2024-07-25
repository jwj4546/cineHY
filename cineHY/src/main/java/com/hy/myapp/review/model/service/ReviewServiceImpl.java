package com.hy.myapp.review.model.service;

import java.util.List;
import java.util.Map;

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
	public List<Review> getMovieOfReview(Map<String, Object> map) {
		return reviewRepository.getMovieOfReview(sqlSession, map);
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

	@Override
	public int updateReview(Review review) {
		return reviewRepository.updateReview(sqlSession, review);
	}

	@Override
	public int deleteReview(int reviewNo) {
		return reviewRepository.deleteReview(sqlSession, reviewNo);
	}

	@Override
	public List<Review> selectMyReview(Map<String, Object> map) {
		return reviewRepository.selectMyReview(sqlSession, map);
	}
	
	@Override
	public List<Review> selectNoReview(Map<String, Object> map) {
		return reviewRepository.selectNoReview(sqlSession, map);
	}


	@Override
	public Double getStarAvg(int movieCode) {
		return reviewRepository.getStarAvg(sqlSession, movieCode);
	}

	@Override
	public int myReviewCount(String userId) {
		return reviewRepository.myReviewCount(sqlSession, userId);
	}
	
	@Override
	public int NoReviewCount(String userId) {
		return reviewRepository.NoReviewCount(sqlSession, userId);
	}


	@Override
	public int reviewCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int MovieOfReviewCount(int movieId) {
		return reviewRepository.MovieOfReviewCount(sqlSession, movieId);
	}

	
	

	

	

}