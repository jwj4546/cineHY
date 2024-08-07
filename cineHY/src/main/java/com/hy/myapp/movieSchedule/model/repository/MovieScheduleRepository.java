package com.hy.myapp.movieSchedule.model.repository;

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


	public List<Schedule> getScheduleList(SqlSessionTemplate sqlSession, int movie, String theater, String startdate, String enddate) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("movieCode", movie);
	    params.put("theaterCode", theater);
	    params.put("startDate", startdate);
	    params.put("endDate", enddate);

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


	public List<Schedule> allScheduleList(SqlSessionTemplate sqlSession, String theaterCode, String selectedTabDate) {
		Map<String, Object> params = new HashMap<>();
	    params.put("theaterCode", theaterCode);
	    params.put("date", selectedTabDate);
		
		return sqlSession.selectList("movieScheduleMapper.allScheduleListByDate", params);
	}


	public int delete(SqlSessionTemplate sqlSession, int screeningId) {
		return sqlSession.delete("movieScheduleMapper.delete", screeningId);
	}


	public double getReservationRate(SqlSessionTemplate sqlSession, int movieCode) {
		return sqlSession.selectOne("movieScheduleMapper.getReservationRate", movieCode);
	}

}
