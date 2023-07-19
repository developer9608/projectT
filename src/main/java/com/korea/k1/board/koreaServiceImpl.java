package com.korea.k1.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class koreaServiceImpl implements koreaService{

	@Autowired
	private koreaDao dao;
	@Override
	public void insert(koreaVO vo) {
		dao.insert(vo);
		
	}

	@Override
	public List<koreaVO> selectAll(koreaVO vo) {
		return dao.selectAll(vo);
	}

	@Override
	public int custno() {
		return dao.custno();
	}

	@Override
	public void update(koreaVO vo) {
		dao.update(vo);
	}

	@Override
	public koreaVO selectOne(koreaVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public List<gradeVO> selectAllGrade(gradeVO vo) {
		return dao.selectAllGrade(vo);
	}

	@Override
	public String idCk(koreaVO vo) {
		return dao.idCk(vo);
	}

}
