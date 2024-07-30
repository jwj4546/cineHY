package com.hy.myapp.seat.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
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
}
