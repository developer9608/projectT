package com.korea.k1.company;

import lombok.Data;

@Data
public class EvSearchVO {
	private int idx; // 순번
	private String csNm; // 충전소 명칭
	private String addr; // 충전소 주소
	private String cpNm; // 충전기 명칭
	private String cpStat; // 충전기 분류
}
