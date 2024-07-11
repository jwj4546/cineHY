package com.hy.myapp.movieSchedule.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hy.myapp.movie.model.vo.Message;
import com.hy.myapp.movieSchedule.model.service.MovieScheduleService;
import com.hy.myapp.theater.model.vo.Theater;
import com.siot.IamportRestClient.response.Schedule;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("movieSchedule/")
public class MovieScheduleApiController {
	
	@Autowired
	private MovieScheduleService movieScheduleService;
	
	@GetMapping(value="theater", produces="application/json; charset=UTF-8")
	public ResponseEntity<Message> getTheaterList() { 
		
		List<Theater> theaterList = movieScheduleService.getTheaterList();
		
		if(theaterList.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
								 .body(Message.builder()
									 .message("조회결과존재없음")
									 .build());
		}
		//log.info("조회된 theater 목록 : {}", theaterList);
		
		Message responseMsg = Message.builder()
									 .data(theaterList)
									 .message("조회성공")
									 .build();
	 
		 return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}
	
	@GetMapping(value="schedule/{movie}/{theater}/{date}", produces="application/json; charset=UTF-8")
	public ResponseEntity<Message> getSchedule(
			@PathVariable int movie, 
            @PathVariable String theater, 
            @PathVariable @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date) { 
		
		List<Schedule> scheduleList = movieScheduleService.getScheduleList(movie, theater, date);
		
		if(scheduleList.isEmpty()) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
								 .body(Message.builder()
									 .message("조회결과존재없음")
									 .build());
		}
		log.info("조회된 schedule 목록 : {}", scheduleList);
		
		Message responseMsg = Message.builder()
									 .data(scheduleList)
									 .message("조회성공")
									 .build();
	 
		 return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}
}
