package com.hy.myapp.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieForwardController {
	
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
