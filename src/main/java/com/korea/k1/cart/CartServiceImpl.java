package com.korea.k1.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDao dao;
	
	@Override
	public void insert(CartVO vo) {
		dao.insert(vo);
		
	}

	@Override
	public List<CartVO> cartList(CartVO vo) {
		return dao.cartList(vo);
	}

}
