package com.hy.myapp.movieSchedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hy.myapp.movieSchedule.model.service.MovieScheduleService;
import com.hy.myapp.theater.model.vo.Theater;

@Controller
public class MovieScheduleController {
	
	@Autowired
    private MovieScheduleService movieScheduleService;
	
	@GetMapping("movieScheduleEnroll")
	public String getScheduleForm(Model model) {
		List<Theater> theaters = movieScheduleService.getTheaterList();
        model.addAttribute("theaters", theaters);
		return "movieSchedule/scheduleEnroll";
	}
	
}
