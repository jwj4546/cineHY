package com.hy.myapp.review.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hy.myapp.review.model.vo.Review;

@Repository
public class ReviewRepository {

	public List<Review> reviewCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("reviewMapper.findAllReview");
	}

}
