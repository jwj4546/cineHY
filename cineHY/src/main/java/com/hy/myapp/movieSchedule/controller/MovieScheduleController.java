package com.hy.myapp.movieSchedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieScheduleController {
	
	@GetMapping("movieScheduleEnroll")
	public String getScheduleForm() {
		return "movieSchedule/scheduleEnroll";
	}
}
