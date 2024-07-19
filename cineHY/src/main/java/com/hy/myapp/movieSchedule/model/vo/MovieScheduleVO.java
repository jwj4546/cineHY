package com.hy.myapp.movieSchedule.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class MovieScheduleVO {
	
	private String movieTitle;
	private int screeningId;
	private String theaterCode;
	private int screenCode;
	private String startTime;
	private String endTime;
	private String startDate;
	private String endDate;
	private int movieCode;
	private String rating;

}
