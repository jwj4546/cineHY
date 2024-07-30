package com.hy.myapp.theater.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hy.myapp.movieSchedule.model.service.MovieScheduleService;
import com.hy.myapp.theater.model.vo.Theater;

@Controller
public class TheaterController {
	
	@Autowired
    private MovieScheduleService movieScheduleService;
	
	@GetMapping("theater")
	public String getTheater(Model model) {
		
		List<Theater> theaters = movieScheduleService.getTheaterList();
        model.addAttribute("theaters", theaters);
		
		return "theater/theater";
	}
	
	
}
