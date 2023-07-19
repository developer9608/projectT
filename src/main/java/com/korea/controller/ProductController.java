package com.korea.controller;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.korea.k1.product.ProductServiceImpl;
import com.korea.k1.product.ProductVO;



@Controller
public class ProductController {
	String path = "";
	
	@Autowired
	ProductServiceImpl service;
	
	@Autowired
	private ServletContext servlet;
	
	@PostConstruct
	public void init() {
		path = servlet.getRealPath("/product/files/");
		System.out.println("@@@@@@@@ RealPath " + path);
	}
	
	@RequestMapping(value = "/pdInsert.do")
	public String pdInsert(ProductVO vo) throws Exception{
		MultipartFile upload = vo.getProductImg();
		String FileName = upload.getOriginalFilename();

		File f = new File(path + FileName);
		if (!upload.isEmpty()) {
			if(f.exists()) {
				System.out.println("중복된 파일입니다.");
			}
		}else {
			FileName = "space.png";
		}
		upload.transferTo(new File(path+ FileName));
		vo.setProductImgStr(FileName);
		service.pdInsert(vo);                
		return "/pdList.do";
	}

	@RequestMapping(value = "/pdList.do")
	public String pdList(
			Model model) {
		    model.addAttribute("li", service.pdSelectAll(null));
		return "/product/pdList.jsp";
	}
	
	@RequestMapping(value = "/pdDelete.do")
	public String pdDelete(
			ProductVO vo) {
			service.pdDelete(vo);

		return "/product/pdList.jsp";
	}

	@RequestMapping(value = "/pdEdit.do")
	public String pdEdit(
			Model model, ProductVO vo) {
			model.addAttribute("o", service.pdSelect(vo));

		return "/product/pdEdit.jsp";
	}
}

