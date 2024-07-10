package com.hy.myapp.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CartVO {

	private int cartNo;
	private String userId;
	private int productId;
	private int cartAmount;
	private String productName;
	private String productCategory;
	private String productComment;
	private int productPrice;
	private String changeImage;
	
}
