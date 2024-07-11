package com.hy.myapp.movieSchedule.model.service;

import java.time.LocalDate;
import java.util.List;

import com.hy.myapp.theater.model.vo.Theater;
import com.siot.IamportRestClient.response.Schedule;

public interface MovieScheduleService {


	List<Theater> getTheaterList();


	List<Schedule> getScheduleList(int movie, String theater, LocalDate date);


}
