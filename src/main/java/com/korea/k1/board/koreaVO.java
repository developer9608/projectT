package com.korea.k1.board;


import java.sql.Date;

import lombok.Data;

@Data
public class koreaVO {
	private int custno;
	private String custname;
	private String phone;
	
	private String address; // 주소	
	private String zipcode; // 우편번호
	private String addr3; // 상세주소
	
	private Date joindate;
	private String joindateStr;
	
	private String grade;
	private String city ;
	
	private String ch1;
	private String ch2;
	
	private String id;
	private String password;
	
	String gradeKor;
	int sum;
}
