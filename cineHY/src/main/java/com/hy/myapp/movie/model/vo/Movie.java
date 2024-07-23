package com.hy.myapp.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Movie {
	private int movieCode;
	private String movieTitle;
	private String genre;
	private String summary;
	private int runningTime;
	private String rating;
	private String openedDate;
	private String status;
	
}
