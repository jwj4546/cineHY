package com.hy.myapp.movieSchedule.model.repository;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hy.myapp.movieSchedule.model.vo.MovieSchedule;
import com.hy.myapp.theater.model.vo.Theater;
import com.siot.IamportRestClient.response.Schedule;

@Repository
public class MovieScheduleRepository {


	public List<Theater> getTheaterList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("movieScheduleMapper.getTheaterList");
	}


	public List<Schedule> getScheduleList(SqlSessionTemplate sqlSession, int movie, String theater, String date) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("movie", movie);
	    params.put("theater", theater);
	    params.put("date", date);

	    return sqlSession.selectList("movieScheduleMapper.getScheduleList", params);
	}


	public int checkSchedule(SqlSessionTemplate sqlSession, 
							String theaterCode, int screenCode, String startDate, String endDate,
							String startTime, String endTime) {
		
		Map<String, Object> params = new HashMap<>();
	    params.put("theaterCode", theaterCode);
	    params.put("screenCode", screenCode);
	    params.put("startDate", startDate);
	    params.put("endDate", endDate);
	    params.put("startTime", startTime);
	    params.put("endTime", endTime);
	    

	    return sqlSession.selectOne("movieScheduleMapper.checkSchedule", params);
	}


	public int insert(SqlSessionTemplate sqlSession, MovieSchedule movieSchedule) {
		return sqlSession.insert("movieScheduleMapper.insert", movieSchedule);
	}

}
