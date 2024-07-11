package com.hy.myapp.movieSchedule.model.vo;

import java.time.LocalDate;

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
public class MovieSchedule {
	
	private int screeningId;
	private int screenCode;
	private String startime;
	private String endtime;
	private LocalDate startDate;
	private LocalDate endDate;
	private int movieCode;

}
