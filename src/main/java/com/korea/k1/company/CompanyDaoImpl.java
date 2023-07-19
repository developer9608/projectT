package com.korea.k1.company;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDaoImpl implements CompanyDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(CompanyVO vo) {
		mybatis.insert("CompanyDAO.INSERT",vo);		
	}

	@Override
	public void evinsert(EvSearchVO vo) {
		mybatis.insert("CompanyDAO.EV_INSERT",vo);
		
	}

	@Override
	public List<EvSearchVO> Ev_list(EvSearchVO vo) {
		return mybatis.selectList("CompanyDAO.EV_LIST");
	}

	@Override
	public List<CompanyVO> Com_list(CompanyVO vo) {
		return mybatis.selectList("CompanyDAO.COM_LIST");
	}

	@Override
	public CompanyVO comselectOne(CompanyVO vo) {
		return mybatis.selectOne("CompanyDAO.COM_ONE",vo);
	}

	@Override
	public EvSearchVO evselectOne(EvSearchVO vo) {
		return mybatis.selectOne("CompanyDAO.EV_ONE",vo);
	}

}
