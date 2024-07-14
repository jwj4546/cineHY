package com.hy.myapp.review.model.repository;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hy.myapp.review.model.vo.Review;

@Repository
public class ReviewRepository {

	public List<Review> findAllReview(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("reviewMapper.findAllReview");
	}

	public List<Review> getMovieOfReview(SqlSessionTemplate sqlSession, int movieCode) {
		return sqlSession.selectList("reviewMapper.getMovieOfReview", movieCode);
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
		return sqlSession.update("reviewMapper.deleteReview", reviewNo);
	}

	public List<Review> selectMyReview(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectList("reviewMapper.selectMyReview", userId);
	}

//	public Double getRatingAvg(SqlSessionTemplate sqlSession, int reviewNo) {
//		return sqlSession.;
//	}
}