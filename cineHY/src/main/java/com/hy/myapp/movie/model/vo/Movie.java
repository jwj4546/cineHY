package com.hy.myapp.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Movie {
	private String movieCode;
	private String movieTitle;
	private String genre;
	private String summer;
	private String director;
	private String actor;
	private String runningTime;
	private String rating;
	private String posterURL;
	private String openedDate;
	
}
