package com.korea.k1.company;

import java.util.List;

public interface CompanyDao {
 void insert(CompanyVO vo);
 void evinsert(EvSearchVO vo);
 EvSearchVO evselectOne(EvSearchVO vo);
 CompanyVO comselectOne(CompanyVO vo);
 List<EvSearchVO> Ev_list(EvSearchVO vo);
 List<CompanyVO> Com_list(CompanyVO vo);
}
