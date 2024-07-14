package com.hy.myapp.review.model.service;


import java.util.List;
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
	List<Review> getMovieOfReview(int movieCode);

	//리뷰 작성
	int insertReview(Review review);

	//board랑 board에 딸린 reply랑 같이 조회할거임ㅋㅋ
	Review reviewAndReview(int boardNo);

	//다섯개의 개시글 정보
	List<Review> findTopBoard();

	int updateReview(Review review);
	
	//리뷰 삭제
	int deleteReview(int reviewNo);

	//마이리뷰
	List<Review> selectMyReview(String userId);
	
	//평균 평점 구하기
//	Double getRatingAverage(int reviewNo);
	
	

	

	
	
}