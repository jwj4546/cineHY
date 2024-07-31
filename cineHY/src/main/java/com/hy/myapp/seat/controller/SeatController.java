package com.hy.myapp.seat.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hy.myapp.seat.model.service.SeatService;
import com.hy.myapp.seat.model.vo.SeatVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class SeatController {

	private final SeatService seatService;
	
	@PostMapping("saveSeat")
	public ResponseEntity<?> saveSeat(@RequestBody SeatVO seat) {
		
		seatService.saveSeat(seat);
		
		return ResponseEntity.ok("success");
	}
	
	@GetMapping("reservedSeats")
	public List<String> reservedSeats(@RequestParam int screeningId) {
		log.info("screeningId" + screeningId);
		return seatService.reservedSeats(screeningId);
	}
}
