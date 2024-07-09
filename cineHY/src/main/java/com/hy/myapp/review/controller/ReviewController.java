package com.hy.myapp.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
		
		log.info("리뷰스");
		List<Review> reviewList = reviewService.findAllReview();
		
		
		log.info("조회된 글의 개수 : {}", reviewList.size());
		log.info("------");
		log.info("조회된 게시글 목록 : {}", reviewList);
		
		model.addAttribute("list",reviewList);
		
		return "review/review";

	}
}