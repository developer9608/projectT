package com.korea.k1.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.korea.k1.board.koreaVO;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private SqlSessionTemplate  mybatis;
	
	@Override
	public koreaVO loginOne(koreaVO vo) {
		return mybatis.selectOne("koreaDAO.LOGIN", vo);
	}

}
