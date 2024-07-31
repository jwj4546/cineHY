package com.hy.myapp.seat.model.service;

import java.util.List;

import com.hy.myapp.seat.model.vo.SeatVO;

public interface SeatService {

	int saveSeat(SeatVO seat);

	List<String> reservedSeats(int screeningId, String ticketDate);

}
