package com.hy.myapp.review.controller;

import java.util.ArrayList;
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
	public String reviewSelect() {
		return "review/review";
	}
	
	@GetMapping("/MyReview")
	public String MyReviewTest() {
		return "review/myReview";
	}
	
	
	@ResponseBody
	@PostMapping("insertReview")
	public String saveReview(Review review){
		
		log.info("리스트 : {}", review);
		
		return reviewService.insertReview(review)>0? "success":"fail";
	}
	
	
	@ResponseBody
	@GetMapping(value="selectReview", produces="application/json; charset=UTF-8")
	public List<Review> selectReview(int movieCode, Review review, HttpSession session) {
		
		//review = (Review) session.getAttribute("review");

		//List<Review> ReviewList = reviewService.getMovieOfReview(review.getMovieCode());
		
		log.info("movieCode : {}", movieCode);
		//log.info("ReviewList : {}", ReviewList);
		List<Review> selectReviewList = reviewService.getMovieOfReview(movieCode);
		log.info("selectReviewList : {}", selectReviewList);
	
		
		return reviewService.getMovieOfReview(movieCode);
		
		
	}
	
	@ResponseBody
	@PostMapping("ReviewUpdate")
	public String updateReview(Review review){
		
		log.info("업데이트할 리뷰 : {}", review);
		
		return reviewService.updateReview(review)>0? "success":"fail";
	}
	
	@PostMapping("deleteReview")
	    @ResponseBody
	    public String deleteReview(int reviewNo) {
	        
		 
		 log.info(" N 리뷰 : {}", reviewNo);
		 return reviewService.deleteReview(reviewNo)>0? "success":"fail";
	    }
	 
	 
	 

	    @ResponseBody
	    @GetMapping(value = "MyReview", produces = "application/json; charset=UTF-8")
	    public List<Review> MyReview(@RequestParam(value = "userId", required = false) String userId) {
	        log.info("userId : {}", userId); // 로그로 userId 확인
	        List<Review> selectMyReview = reviewService.selectMyReview(userId);
	        
	        
	        log.info("마이리뷰 : {}", selectMyReview);
			return reviewService.selectMyReview(userId);

	    }
	    
	    @ResponseBody
	    @GetMapping(value = "NoReview", produces = "application/json; charset=UTF-8")
	    public List<Review> NoReview(@RequestParam(value = "userId", required = false) String userId) {
	        log.info("userId : {}", userId); // 로그로 userId 확인
	        List<Review> selectNoReview = reviewService.selectNoReview(userId);
	        
	        
	        log.info("미리뷰 : {}", selectNoReview);
			return reviewService.selectNoReview(userId);

	    }
	    
	    
	    @ResponseBody
		@GetMapping(value="starAvg", produces="application/json; charset=UTF-8")
		public double selectStarAvg(int movieCode) {
			
			//review = (Review) session.getAttribute("review");

			//List<Review> ReviewList = reviewService.getMovieOfReview(review.getMovieCode());
			
			log.info("movieCode : {}", movieCode);
			//log.info("ReviewList : {}", ReviewList);
			double StarAvg = reviewService.getStarAvg(movieCode);
			log.info("StarAvgList : {}", StarAvg);
		
			
			return reviewService.getStarAvg(movieCode);
			
			
		}
}


