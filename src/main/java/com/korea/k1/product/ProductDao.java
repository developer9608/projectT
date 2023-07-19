package com.korea.k1.product;

import java.util.List;

public interface ProductDao {
	void pdInsert(ProductVO vo);
	void pdUpdate(ProductVO vo);
	void pdDelete(ProductVO vo);
	ProductVO pdSelect(ProductVO vo);
	List<ProductVO> pdSelectAll(ProductVO vo);
}
