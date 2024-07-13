package com.hy.myapp.movieSchedule.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hy.myapp.movieSchedule.model.repository.MovieScheduleRepository;
import com.hy.myapp.movieSchedule.model.vo.MovieSchedule;
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
	public List<Schedule> getScheduleList(int movie, String theater, String date) {
		return movieScheduleRepository.getScheduleList(sqlSession, movie, theater, date);
	}

	@Override
	public int checkSchedule(String theaterCode, int screenCode, String startDate, String endDate, String startTime, String endTime) {
		return movieScheduleRepository.checkSchedule(sqlSession, theaterCode, screenCode, startDate, endDate, startTime, endTime);
	}

	@Override
	public int insert(MovieSchedule movieSchedule) {
		return movieScheduleRepository.insert(sqlSession, movieSchedule);
	}

	@Override
	public List<Schedule> allScheduleList(String theaterCode, String selectedTabDate) {
		return movieScheduleRepository.allScheduleList(sqlSession, theaterCode, selectedTabDate);
	}

	@Override
	public int delete(int screeningId) {
		return movieScheduleRepository.delete(sqlSession, screeningId);
	}

}
