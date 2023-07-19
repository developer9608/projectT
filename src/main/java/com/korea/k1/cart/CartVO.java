package com.korea.k1.cart;

import lombok.Data;

@Data
public class CartVO {
	 private int cartId;  
	 private int  custNo;
	 private int productId ;
	 private int amount;  
	 
	 private String productName;
	 private int productPrice;
	 private String productImgStr;
}
