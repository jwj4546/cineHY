package com.hy.myapp.review.model.service;


import java.util.List;

import com.hy.myapp.review.model.vo.Review;

public interface ReviewService {
	//리뷰 전체조회
	List<Review> findAllReview();
	
	//특정 영화번호의 리뷰 조회
	//List<Review> getListOfMovie(Long mno);
	
}