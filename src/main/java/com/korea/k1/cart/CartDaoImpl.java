package com.korea.k1.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public void insert(CartVO vo) {
		mybatis.insert("cartDAO.INSERT", vo);
		
	}

	@Override
	public List<CartVO> cartList(CartVO vo) {

		return mybatis.selectList("cartDAO.SELECTALL", vo);
	}

}
