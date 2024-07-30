package com.hy.myapp.seat.model.service;

import org.springframework.stereotype.Service;

import com.hy.myapp.seat.model.repository.SeatRepository;
import com.hy.myapp.seat.model.vo.SeatVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SeatServiceImpl implements SeatService {

	private final SeatRepository seatRepository;
	
	@Override
	public int saveSeat(SeatVO seat) {
		return seatRepository.saveSeat(seat);
	}

}
