package com.hy.myapp.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReservationController {
	
	
	@GetMapping("reservation")
	public String showReservationPage(Model model) {
	    return "reservation/reservation";
	}
	
	@GetMapping("reservationById")
    public String reservationById(@RequestParam("movieId") int movieId, Model model) {
        model.addAttribute("movieCode", movieId);
        return "reservation/reservation";
    }

	@PostMapping("reservationFromTheater")
    public String reservationFromTheater(@RequestParam("movieCode") int movieCode,
                                         @RequestParam("ticketDate") String ticketDate,
                                         @RequestParam("screenCode") int screenCode,
                                         @RequestParam("theaterCode") String theaterCode,
                                         @RequestParam("startTime") String startTime,
                                         @RequestParam("screeningId") int screeningId,
                                         Model model) {


        model.addAttribute("movieCode", movieCode);
        model.addAttribute("ticketDate", ticketDate);
        model.addAttribute("screenCode", screenCode);
        model.addAttribute("theaterCode", theaterCode);
        model.addAttribute("startTime", startTime);
        model.addAttribute("screeningId", screeningId);

        
        return "reservation/reservation";
    }

}
