package com.hy.myapp.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hy.myapp.review.model.service.ReviewService;
import com.hy.myapp.review.model.vo.Review;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ReviewController {
	
	private final ReviewService reviewService;
	
	@GetMapping("/reviews")
	public String forwarding(Model model) {
		
		List<Review> reviewList = reviewService.findAllReview();
		
		
		//log.info("조회된 리뷰 개수 : {}", reviewList.size());
		//log.info("------");
		//log.info("조회된 리뷰 목록 : {}", reviewList);
		
		model.addAttribute("list",reviewList);
		
		return "review/review";

	}
	
	@GetMapping("/getReview")
	public String reviewSelect(Review review, HttpSession session, Model model) {
		
		
		review = (Review) session.getAttribute("review");

		//List<Review> ReviewList = reviewService.getMovieOfReview(review.getMovieCode());
		List<Review> ReviewList = reviewService.getMovieOfReview(1);
		//log.info("리스트 : {}", ReviewList);
		model.addAttribute("getReviewList", ReviewList);
		
		
	
		session.setAttribute("ReviewList", ReviewList); //ReviewList.movieCode쓰려고
		
		return "review/review";
	}
	
	
	
	
	
//	@ResponseBody      
//	@GetMapping(value="insertTReview22", produces="application/json; charset=UTF-8")
//	public String insertTReview(int movieCode) {
//		return new Gson().toJson(reviewService.getMovieOfReview(movieCode));
//	}
	
	
	@ResponseBody
	@PostMapping("insertReview")
	public String saveReview(Review review){
		
		log.info("리스트 : {}", review);
		
		return reviewService.insertReview(review)>0? "success":"fail";
	}
	
	
	@ResponseBody
	@GetMapping(value="selectReview", produces="application/json; charset=UTF-8")
	public List<Review> selectReview(int movieCode) {
		
		//review = (Review) session.getAttribute("review");

		//List<Review> ReviewList = reviewService.getMovieOfReview(review.getMovieCode());
		
		
		
		List<Review> selectReviewList = reviewService.getMovieOfReview(1);
		log.info("리스트 : {}", selectReviewList);
	
		
		return reviewService.getMovieOfReview(movieCode);
		
		
	}
	
	@ResponseBody
	@PostMapping("ReviewUpdate")
	public String updateReview(Review review){
		
		//log.info("업데이트할 리뷰 : {}", review);
		
		return reviewService.updateReview(review)>0? "success":"fail";
	}
	
	 @DeleteMapping("deleteReview")
	    @ResponseBody
	    public String deleteReview(Review review) {
	        // 리뷰 삭제 로직 구현
		 
		 log.info(" N 리뷰 : {}", review);
		 return reviewService.updateReview(review)>0? "success":"fail";
	    }
}


