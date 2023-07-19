package com.korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.korea.k1.cart.CartServiceImpl;
import com.korea.k1.cart.CartVO;


@Controller
public class CartController {
	
	CartController(){
		System.out.println("===> 컨트롤러 확인");
	}
	
	@Autowired
	CartServiceImpl service;
	
	@RequestMapping(value = "/insertCart.do")
	public String insertCart(
			CartVO vo) throws Exception {
		System.out.println("===> insert " + vo);
		service.insert(vo);
		return "/CartList.do";
	}
	
	@RequestMapping(value = "/CartList.do")
	public String CartList(
			Model model,
			CartVO vo) throws Exception {
		model.addAttribute("li",service.cartList(vo));
		return "/cart/CartList.jsp";
	}
}

