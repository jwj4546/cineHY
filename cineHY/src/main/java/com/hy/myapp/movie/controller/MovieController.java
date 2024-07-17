package com.hy.myapp.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@AllArgsConstructor
public class MovieController {
	
	
	@GetMapping("movieEnroll")
	public String getEnrollMoive() {
		return "movie/movieEnroll";
	}
	
	@GetMapping("movieList")
	public String getMovieList() {
		return "movie/movieList";
	}
	
	@GetMapping("movieDetails")
	public String getMovieDetails() {
		return "movie/movieDetails";
	}
	
	

}
