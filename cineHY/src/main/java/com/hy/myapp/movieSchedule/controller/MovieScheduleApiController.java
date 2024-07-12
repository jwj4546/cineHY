package com.hy.myapp.movieSchedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hy.myapp.movie.model.vo.Message;
import com.hy.myapp.movieSchedule.model.service.MovieScheduleService;
import com.hy.myapp.movieSchedule.model.vo.MovieSchedule;
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
            @PathVariable String date) { 
        
        List<Schedule> scheduleList;
        try {
            scheduleList = movieScheduleService.getScheduleList(movie, theater, date);
        } catch (Exception e) {
            // 조회 도중 오류 발생 시 INTERNAL_SERVER_ERROR 반환
            log.error("스케줄 조회 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body(Message.builder()
                                     .message("조회 중 오류 발생")
                                     .build());
        }
        
        if (scheduleList.isEmpty()) {
        	Message responseMsg = Message.builder()
					                    .data(scheduleList)
					                    .message("조회결과 없음")
					                    .build();
        	
        	return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
        }
        
        log.info("조회된 scheduleList 목록 : {}", scheduleList);
        
        Message responseMsg = Message.builder()
                                     .data(scheduleList)
                                     .message("조회성공")
                                     .build();
        log.info("조회된 scheduleList 목록 : {}", scheduleList);
        return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
    }
	
	
	
	@GetMapping(value="check/{theaterCode}/{screenCode}/{startDate}/{endDate}/{startTime}/{endTime}", produces="application/json; charset=UTF-8")
	public ResponseEntity<Message> checkSchedule(
	        @PathVariable String theaterCode, 
	        @PathVariable int screenCode,
	        @PathVariable String startDate,
	        @PathVariable String endDate,
	        @PathVariable String startTime,
	        @PathVariable String endTime){
	    
	    try {
	        int count = movieScheduleService.checkSchedule(theaterCode, screenCode, startDate, endDate, startTime, endTime);
	        
	        if (count >= 1) {
	        	Message responseMsg = Message.builder()
					                        .data(count)
					                        .message("등록된 스케줄 있음")
					                        .build();
	        	log.info("조회된 schedule 수 : {}", count);
	        	return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	        } else {
	            Message responseMsg = Message.builder()
	                                         .data(count)
	                                         .message("등록가능")
	                                         .build();
	            log.info("조회된 schedule 수 : {}", count);
	            return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	        }
	    } catch (Exception ex) {
	        log.error("스케줄 조회 중 오류 발생: {}", ex.getMessage());
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                             .body(Message.builder()
	                                 .message("스케줄 조회 중 오류 발생")
	                                 .build());
	    }
	}
	
	@PostMapping(value="insert", produces="application/json; charset=UTF-8")
	public ResponseEntity<Message> insertSchedule(@RequestBody MovieSchedule movieSchedule){
		
		int result = movieScheduleService.insert(movieSchedule);
		if (result == 0) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Message.builder()
															 .message("추가안됨")
															 .build());
        }

		Message responseMsg = Message.builder().data("영화상영스케줄 추가에 성공했습니다")
											   .message("서비스요청성공")
											   .build();
		
		return ResponseEntity.status(HttpStatus.OK).body(responseMsg);
	}
}