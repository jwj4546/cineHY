package com.hy.myapp.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hy.myapp.review.model.vo.PageInfo;
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
	
	
	/*
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
	*/
	
	@ResponseBody
	@GetMapping(value = "selectReview", produces = "application/json; charset=UTF-8")
	public Map<String, Object> selectReview(@RequestParam(value = "movieId") int movieId, 
	                                    @RequestParam(value="page", defaultValue="1") int page
	                                   ) {
	    //log.info("movieId : {}", movieId); // 로그로 userId 확인
	    
	    //log.info("page : {}", page); // 로그로 userId 확인
	    
	    int listCount = reviewService.MovieOfReviewCount(movieId);  // 총 게시글의 수 
	    //log.info("listCount : {}", listCount);
	    
	    int currentPage = page;
	    int pageLimit = 10;
	    int reviewLimit = 3;
	    
	    int maxPage = (int)Math.ceil((double) listCount / reviewLimit);
	    int startPage = (currentPage-1)/pageLimit * pageLimit + 1;
	    int endPage = startPage + pageLimit - 1;
	    if(endPage > maxPage) endPage = maxPage;
	  
	    
	    PageInfo pageInfo = PageInfo.builder() 
	                                .listCount(listCount)
	                                .currentPage(currentPage)
	                                .pageLimit(pageLimit)
	                                .reviewLimit(reviewLimit)
	                                .maxPage(maxPage)
	                                .startPage(startPage)
	                                .endPage(endPage)
	                                .build();
	    
	    Map<String, Object> map = new HashMap<>();
	    int startValue = (currentPage-1) * reviewLimit + 1;
	    int endValue = startValue + reviewLimit - 1;
	    
	    map.put("movieCode", movieId);
	    map.put("startValue", startValue);
	    map.put("endValue", endValue);
	    
	    List<Review> selectReview = reviewService.getMovieOfReview(map);  //movieId로 리뷰 출력함
	    //log.info("selectReview : {}", selectReview);
	    Map<String, Object> response = new HashMap<>();
	    response.put("reviews", selectReview);
	    response.put("pageInfo", pageInfo);
	    
	    //log.info("response : {}", response);
	    
	    return response;
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
	        
		 
		 //log.info(" 삭제할 리뷰 : {}", reviewNo);
		 return reviewService.deleteReview(reviewNo)>0? "success":"fail";
	    }
	 
	 
	 
	@ResponseBody
	@GetMapping(value = "MyReview", produces = "application/json; charset=UTF-8")
	public Map<String, Object> MyReview(@RequestParam(value = "userId", required = false) String userId,
	                                    @RequestParam(value="page", defaultValue="1") int page,
	                                    Model model) {
	    log.info("userId : {}", userId); // 로그로 userId 확인
	    
	    int listCount = reviewService.myReviewCount(userId);  // 총 게시글의 수 
	   
	    log.info("listCount:{}",listCount);
	    
	    int currentPage = page;
	    int pageLimit = 10;
	    int reviewLimit = 3;
	    
	    int maxPage = (int)Math.ceil((double) listCount / reviewLimit);
	    int startPage = (currentPage-1)/pageLimit * pageLimit + 1;
	    int endPage = startPage + pageLimit - 1;
	    if(endPage > maxPage) endPage = maxPage;
	  
	    
	    PageInfo pageInfo = PageInfo.builder() 
	                                .listCount(listCount)
	                                .currentPage(currentPage)
	                                .pageLimit(pageLimit)
	                                .reviewLimit(reviewLimit)
	                                .maxPage(maxPage)
	                                .startPage(startPage)
	                                .endPage(endPage)
	                                .build();
	    
	    Map<String, Object> map = new HashMap<>();
	    int startValue = (currentPage-1) * reviewLimit + 1;
	    int endValue = startValue + reviewLimit - 1;
	    
	    map.put("userId", userId);
	    map.put("startValue", startValue);
	    map.put("endValue", endValue);
	    
	    List<Review> selectMyReview = reviewService.selectMyReview(map); //얘만 안나옴
	    
	    log.info("selectMyReview:{}",selectMyReview);
	    log.info("pageInfo:{}",pageInfo);
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("reviews", selectMyReview);
	    response.put("pageInfo", pageInfo);
	    
	    log.info("response:{}",response);
	    return response;
	}

	
	

	
	    
	    @ResponseBody
	    @GetMapping(value = "NoReview", produces = "application/json; charset=UTF-8")
	    public Map<String, Object> NoReview(@RequestParam(value = "userId") String userId,
	    									@RequestParam(value="page", defaultValue="1") int page,
	    									Model model) {
	        log.info("userId : {}", userId); // 로그로 userId 확인
			
			int listCountNo = reviewService.NoReviewCount(userId);  // 총 게시글의 수 
			log.info("listCountNo : {}", listCountNo); 
			
		    int currentPage = page;
		    int pageLimit = 10;
		    int reviewLimit = 3;
		    
		    int maxPage = (int)Math.ceil((double) listCountNo / reviewLimit);
		    int startPage = (currentPage-1)/pageLimit * pageLimit + 1;
		    int endPage = startPage + pageLimit - 1;
		    if(endPage > maxPage) endPage = maxPage;
		  
		    
		    PageInfo pageInfoNo = PageInfo.builder() 
		                                .listCount(listCountNo)
		                                .currentPage(currentPage)
		                                .pageLimit(pageLimit)
		                                .reviewLimit(reviewLimit)
		                                .maxPage(maxPage)
		                                .startPage(startPage)
		                                .endPage(endPage)
		                                .build();
		    
		    Map<String, Object> mapNo = new HashMap<>();
		    int startValue = (currentPage-1) * reviewLimit + 1;
		    int endValue = startValue + reviewLimit - 1;
		    
		    mapNo.put("userId", userId);
		    mapNo.put("startValue", startValue);
		    mapNo.put("endValue", endValue);
		    
		    List<Review> selectNoReview = reviewService.selectNoReview(mapNo);
		    
		    Map<String, Object> responseNo = new HashMap<>();
		    responseNo.put("reviews_No", selectNoReview);
		    responseNo.put("pageInfo2", pageInfoNo);
		    
		    return responseNo;
			

	    }
	    
	    
	    @ResponseBody
		@GetMapping(value="starAvg", produces="application/json; charset=UTF-8")
		public double selectStarAvg(int movieCode) {
			
			//review = (Review) session.getAttribute("review");

			//List<Review> ReviewList = reviewService.getMovieOfReview(review.getMovieCode());
			
			log.info("별점의 movieCode : {}", movieCode);
			//log.info("ReviewList : {}", ReviewList);
			double StarAvg = reviewService.getStarAvg(movieCode);
			log.info("StarAvgList : {}", StarAvg);
		
			
			return reviewService.getStarAvg(movieCode);
			
			
		}
}


