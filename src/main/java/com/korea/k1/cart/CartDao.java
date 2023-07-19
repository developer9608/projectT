package com.korea.k1.cart;

import java.util.List;

public interface CartDao {
	//1. 장바구니 추가	
	void insert(CartVO vo);
	//2. 장바구니 목록
	List<CartVO> cartList(CartVO vo);
}
