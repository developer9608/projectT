package com.korea.k1.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korea.k1.board.koreaVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao  dao;
	
	@Override
	public koreaVO loginOne(koreaVO vo) {
		return dao.loginOne(vo);
	}

}
