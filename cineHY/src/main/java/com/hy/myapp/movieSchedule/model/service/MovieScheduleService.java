package com.hy.myapp.movieSchedule.model.service;

import java.util.List;

import com.hy.myapp.movieSchedule.model.vo.MovieSchedule;
import com.hy.myapp.theater.model.vo.Theater;
import com.siot.IamportRestClient.response.Schedule;

public interface MovieScheduleService {


	List<Theater> getTheaterList();


	List<Schedule> getScheduleList(int movie, String theater, String date);


	int checkSchedule(String theaterCode, int screenCode, String endDate, String startTime, String endTime, String endTime2);


	int insert(MovieSchedule movieSchedule);


	List<Schedule> allScheduleList(String theaterCode, String selectedTabDate);




}
