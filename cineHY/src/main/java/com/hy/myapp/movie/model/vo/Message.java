package com.hy.myapp.movie.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;

@Builder
@AllArgsConstructor
public class Message {
	
	private String message;
	private Object data;

}
