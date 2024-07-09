package com.hy.myapp.product.model.vo;

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
public class ProductVO {

	private int productId;
	private String productName;
	private String productCategory;
	private String productComment;
	private int productPrice;
	private String productImage;
	private String changeImage;
}
