package com.hy.myapp.movie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieFordwardController {
	
	@GetMapping("movieEnroll")
	public String getEnrollMoive() {
		return "movie/movieEnroll";
	}

}
