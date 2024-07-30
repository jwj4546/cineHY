package com.hy.myapp.seat.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.hy.myapp.seat.model.service.SeatService;
import com.hy.myapp.seat.model.vo.SeatVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class SeatController {

	private final SeatService seatService;
	
	@PostMapping("saveSeat")
	public ResponseEntity<?> saveSeat(@RequestBody SeatVO seat) {
		
		seatService.saveSeat(seat);
		
		return ResponseEntity.ok("success");
	}
	
	@GetMapping(value="/reserved/{screeningId}", produces="text/html; charset=UTF-8")
	public List<String> reservedSeats(@PathVariable int screeningId) {
		return seatService.reservedSeats(screeningId);
	}
}
