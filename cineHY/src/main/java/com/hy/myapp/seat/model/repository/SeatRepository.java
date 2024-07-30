package com.hy.myapp.seat.model.repository;

import org.apache.ibatis.annotations.Mapper;

import com.hy.myapp.seat.model.vo.SeatVO;

@Mapper
public interface SeatRepository {

	int saveSeat(SeatVO seat);

}
