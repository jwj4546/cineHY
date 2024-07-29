package com.hy.myapp.review.model.vo;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
@Builder
public class PageInfo {
	
	private int listCount;  
	private int currentPage;  
	private int pageLimit;  
	private int reviewLimit;  
	
	private int maxPage; 
	private int startPage; 
	private int endPage; 
	
	
}