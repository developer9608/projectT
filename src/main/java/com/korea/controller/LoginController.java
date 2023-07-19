package com.korea.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.k1.login.LoginService;
import com.korea.k1.board.koreaVO;

@Controller
public class LoginController {

	@Autowired
	private LoginService  service;
	
    @RequestMapping("/login.do")
	String  login( koreaVO vo , HttpSession session) 
			                            throws Exception { 

    	koreaVO  m = service.loginOne(vo);
    	System.out.println("mmmmmmmmmmmmmmmmmmmmm" + m);
    	if(m.getId()==null || m.getId().equals(null)) {
    		System.out.println("아이디가 존재하지 않습니다.");
    		return "/login/login.jsp";	
    	}else {
    		if(BCrypt.checkpw(vo.getPassword(), m.getPassword())) {
    			System.out.println("로그인 성공");
    			session.setAttribute("m", m);    			
        		return "/pdList.do";
    		}else {
    			System.out.println("암호가 일치하지 않습니다.");
        		return "/login/login.jsp";	
    		}
    	}
	}
    
    @RequestMapping("/logout.do")
	String  logout( HttpSession session ) 
			                    throws Exception {
    	session.invalidate();
    	return "/index.jsp";     	
	}
	
}
