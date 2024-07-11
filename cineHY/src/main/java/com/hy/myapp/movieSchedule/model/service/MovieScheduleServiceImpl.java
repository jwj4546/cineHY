package com.hy.myapp.movieSchedule.model.service;

import java.time.LocalDate;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hy.myapp.movieSchedule.model.repository.MovieScheduleRepository;
import com.hy.myapp.theater.model.vo.Theater;
import com.siot.IamportRestClient.response.Schedule;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MovieScheduleServiceImpl implements MovieScheduleService {

	private final MovieScheduleRepository movieScheduleRepository;
	private final SqlSessionTemplate sqlSession;
	
	@Override
	public List<Theater> getTheaterList() {
		return movieScheduleRepository.getTheaterList(sqlSession);
	}

	@Override
	public List<Schedule> getScheduleList(int movie, String theater, LocalDate date) {
		return movieScheduleRepository.getScheduleList(sqlSession, movie, theater, date);
	}

}
