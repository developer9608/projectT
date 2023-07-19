package com.korea.k1.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService{
	
	@Autowired
	private CompanyDao dao;
	
	@Override
	public void insert(CompanyVO vo) {
		dao.insert(vo);
	}

	@Override
	public void evinsert(EvSearchVO vo) {
		dao.evinsert(vo);
	}

	@Override
	public List<EvSearchVO> Ev_list(EvSearchVO vo) {
		return dao.Ev_list(vo);
	}

	@Override
	public List<CompanyVO> Com_list(CompanyVO vo) {
		return dao.Com_list(vo);
	}

	@Override
	public CompanyVO comselectOne(CompanyVO vo) {
		return dao.comselectOne(vo);
	}

	@Override
	public EvSearchVO evselectOne(EvSearchVO vo) {
		return dao.evselectOne(vo);
	}

}
