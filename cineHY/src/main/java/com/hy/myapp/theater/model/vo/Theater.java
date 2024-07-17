package com.hy.myapp.theater.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Theater {
	
	private String theaterCode;
	private String theaterName;
	private String theaterAddr;
	private int locationX;
	private int locationY;

}
