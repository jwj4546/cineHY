package com.hy.myapp.review.model.service;


import java.util.List;
import java.util.Map;

import com.hy.myapp.notice.model.vo.Notice;
import com.hy.myapp.review.model.vo.Review;

public interface ReviewService {
	//리뷰 전체조회
	List<Review> findAllReview();
	
	//특정 영화코드의 리뷰 조회
	//List<Review> getMovieOfReview(int movieCode);

	
	// 영화 구매내역 확인
	String getTicketNo();
	
	
	// 영화 구매내역 확인
	Review getTicket();
	
	//리뷰 추가
	//int insertReview(Review review);
	
		
	
	//ajax를 활용한 댓글 목록조회
	List<Review> getMovieOfReview(Map<String, Object> map);

	//리뷰 작성
	int insertReview(Review review);

	Review reviewAndReview(int boardNo);

	//다섯개의 개시글 정보
	List<Review> findTopBoard();

	int updateReview(Review review);
	
	//리뷰 삭제
	int deleteReview(int reviewNo);

	//마이 리뷰
	//List<Review> selectMyReview(String userId);
	List<Review> selectMyReview(Map<String, Object> map); 
	
	//미작성 리뷰
	List<Review> selectNoReview(Map<String, Object> map);

	//평균별점
	double getStarAvg(int movieCode);
	
	int reviewCount();
	
	int myReviewCount(String userId);
	int NoReviewCount(String userId);

	//해당 영화의 리뷰 갯수
	int MovieOfReviewCount(int movieId);

	

	
	

	
	
}