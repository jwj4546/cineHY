package com.hy.myapp.seat.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hy.myapp.seat.model.vo.SeatVO;

@Mapper
public interface SeatRepository {

	int saveSeat(SeatVO seat);

	List<String> reservedSeats(@Param("screeningId") int screeningId,
											@Param("ticketDate") String ticketDate);

}
