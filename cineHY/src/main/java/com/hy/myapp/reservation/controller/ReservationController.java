package com.hy.myapp.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hy.myapp.movieSchedule.model.service.MovieScheduleService;
import com.hy.myapp.theater.model.vo.Theater;

@Controller
public class ReservationController {
	
	@Autowired
	private MovieScheduleService movieScheduleService;
	
	@GetMapping("reservation")
	public String showReservationPage(Model model) {
	    List<Theater> theaters = movieScheduleService.getTheaterList();
	    model.addAttribute("theaters", theaters);
	    
	    return "reservation/reservation";
	}
	
	@PostMapping("reservationById")
    public String reservationById(@RequestParam("movieId") int movieId, Model model) {
        model.addAttribute("movieCode", movieId);
        List<Theater> theaters = movieScheduleService.getTheaterList();
        model.addAttribute("theaters", theaters);
        return "reservation/reservation";
    }

	@PostMapping("reservationFromTheater")
    public String reservationFromTheater(@RequestParam("movieCode") String movieCode,
                                         @RequestParam("ticketDate") String ticketDate,
                                         @RequestParam("screenCode") String screenCode,
                                         @RequestParam("theaterCode") String theaterCode,
                                         @RequestParam("startTime") String startTime,
                                         @RequestParam("screeningId") String screeningId,
                                         Model model) {

//        System.out.println("movieCode: " + movieCode);
//        System.out.println("ticketDate: " + ticketDate);
//        System.out.println("screenCode: " + screenCode);
//        System.out.println("theaterCode: " + theaterCode);
//        System.out.println("startTime: " + startTime);
//        System.out.println("screeningId: " + screeningId);

        model.addAttribute("movieCode", movieCode);
        model.addAttribute("ticketDate", ticketDate);
        model.addAttribute("screenCode", screenCode);
        model.addAttribute("theaterCode", theaterCode);
        model.addAttribute("startTime", startTime);
        model.addAttribute("screeningId", screeningId);
        

        List<Theater> theaters = movieScheduleService.getTheaterList();
        model.addAttribute("theaters", theaters);
        System.out.println(model);
        
        
        
        return "reservation/reservation";
    }

}
