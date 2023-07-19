package com.korea.k1.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class koreaDaoImpl implements koreaDao{
	

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insert(koreaVO vo) {
		mybatis.insert("koreaDAO.korea_INSERT", vo);
	}

	@Override
	public void update(koreaVO vo) {
		mybatis.update("koreaDAO.korea_UPDATE", vo);		
	}

	@Override
	public koreaVO selectOne(koreaVO vo) {
		return mybatis.selectOne("koreaDAO.korea_SELECTONE", vo);
	}
	
	@Override
	public List<koreaVO> selectAll(koreaVO vo) {
		return mybatis.selectList("koreaDAO.korea_SELECTALL", vo);
	}

	@Override
	public int custno() {
		return mybatis.selectOne("koreaDAO.korea_SELECTMAX");
	}

	@Override
	public List<gradeVO> selectAllGrade(gradeVO vo) {
		return mybatis.selectList("koreaDAO.korea_SELECTGRADE", vo);
	}

	@Override
	public String idCk(koreaVO vo) {
		return mybatis.selectOne("koreaDAO.IDCK", vo);
	}

}
