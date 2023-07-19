package com.korea.k1.board;

import java.util.List;

public interface koreaDao {
	void insert(koreaVO vo);
	void update(koreaVO vo);
	koreaVO selectOne(koreaVO vo);
	int custno();
	String idCk(koreaVO vo);
	List<koreaVO> selectAll(koreaVO vo);
	List<gradeVO> selectAllGrade(gradeVO vo);
}
