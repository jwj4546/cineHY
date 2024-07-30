package com.hy.myapp.seat.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hy.myapp.seat.model.vo.SeatVO;

@Mapper
public interface SeatRepository {

	int saveSeat(SeatVO seat);

	List<String> reservedSeats(int screeningId);

}
