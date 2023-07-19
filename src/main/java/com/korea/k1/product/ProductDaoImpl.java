package com.korea.k1.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void pdInsert(ProductVO vo) {
		mybatis.insert("ProductDAO.pdINSERT", vo);
		
	}

	@Override
	public void pdUpdate(ProductVO vo) {
		mybatis.update(null);
		
	}

	@Override
	public void pdDelete(ProductVO vo) {
		mybatis.delete("ProductDAO.pdDELETE", vo);
		
	}

	@Override
	public ProductVO pdSelect(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.pdSELECTONE", vo);
		
	}

	@Override
	public List<ProductVO> pdSelectAll(ProductVO vo) {
		return mybatis.selectList("ProductDAO.pdSELECTALL");
	}

}
