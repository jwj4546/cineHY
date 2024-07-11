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
}