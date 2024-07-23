package com.hy.myapp.review.model.repository;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hy.myapp.review.model.vo.Review;

@Repository
public class ReviewRepository {

	public List<Review> findAllReview(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("reviewMapper.findAllReview");
	}

	public List<Review> getMovieOfReview(SqlSessionTemplate sqlSession,Map<String, Object> map) {
		return sqlSession.selectList("reviewMapper.getMovieOfReview", map);
	}

	public String getTicketNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.getTicketNo");
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("reviewMapper.insertReview", review);
	}

	public int updateReview(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("reviewMapper.updateReview", review);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.delete("reviewMapper.deleteReview", reviewNo);
	}

	public List<Review> selectMyReview(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectList("reviewMapper.selectMyReview", map);
	}
	
	public List<Review> selectNoReview(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectList("reviewMapper.selectNoReview", map);

	}
	public Double getStarAvg(SqlSessionTemplate sqlSession, int movieCode) {
		return sqlSession.selectOne("reviewMapper.starAvg", movieCode);
	}

	public int reviewCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.reviewCount");

	}

	public int myReviewCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("reviewMapper.myReviewCount", userId);
	}

	public int NoReviewCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("reviewMapper.NoReviewCount", userId);
	}

	public int MovieOfReviewCount(SqlSessionTemplate sqlSession, int movieId) {
		return sqlSession.selectOne("reviewMapper.MovieOfReviewCount", movieId);

	}
	

	
	}

//	public Double getRatingAvg(SqlSessionTemplate sqlSession, int reviewNo) {
//		return sqlSession.;
//	}
