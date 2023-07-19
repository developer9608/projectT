package com.korea.k1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao dao;
	
	@Override
	public void pdInsert(ProductVO vo) {
		dao.pdInsert(vo);
		
	}

	@Override
	public void pdUpdate(ProductVO vo) {
		dao.pdUpdate(vo);
		
	}

	@Override
	public void pdDelete(ProductVO vo) {
		dao.pdDelete(vo);
		
	}

	@Override
	public ProductVO pdSelect(ProductVO vo) {
		return dao.pdSelect(vo);
	}

	@Override
	public List<ProductVO> pdSelectAll(ProductVO vo) {
		return dao.pdSelectAll(vo);
	}

}
