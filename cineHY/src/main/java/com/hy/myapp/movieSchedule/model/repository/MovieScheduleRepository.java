package com.hy.myapp.movieSchedule.model.repository;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hy.myapp.theater.model.vo.Theater;
import com.siot.IamportRestClient.response.Schedule;

@Repository
public class MovieScheduleRepository {


	public List<Theater> getTheaterList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("movieScheduleMapper.getTheaterList");
	}


	public List<Schedule> getScheduleList(SqlSessionTemplate sqlSession, int movie, String theater, LocalDate date) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("movie", movie);
	    params.put("theater", theater);
	    params.put("date", date);

	    return sqlSession.selectList("movieScheduleMapper.getScheduleList", params);
	}

}
