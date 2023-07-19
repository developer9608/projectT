package com.korea.controller;

import java.io.PrintWriter;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.korea.k1.board.gradeVO;
import com.korea.k1.board.koreaServiceImpl;
import com.korea.k1.board.koreaVO;


@Controller
public class koreaController {
	
	koreaController(){
		System.out.println("===> 컨트롤러 확인");
	}
	
	@Autowired
	koreaServiceImpl service;
	
	@RequestMapping(value = "/insertKorea.do")
	public String insertKorea(
			koreaVO vo,
			@RequestParam("grade") String grade) throws Exception {
		vo.setGrade(grade);
		String password = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt())  ; 
		vo.setPassword(password);	
		service.insert(vo);
		return "/selectKoreaAll.do";
	}

	@RequestMapping(value = "/updateKorea.do")
	public String updateKorea(
			koreaVO vo,
			@RequestParam("address") String address,
			@RequestParam("zipcode") String zipcode
			) throws Exception {
		vo.setAddress(address);
		vo.setZipcode(zipcode);
		System.out.println("======" + vo.toString());
		service.update(vo);
		System.out.println("######" + vo.toString());
		return "/selectKoreaAll.do";
	}

	@RequestMapping(value = "/getKorea.do")
	public String getKorea(koreaVO vo, Model model) throws Exception { 
		model.addAttribute("p", service.selectOne(vo));
		return "/board/koreaGet.jsp";
	}

	@RequestMapping(value = "/selectKoreaAll.do")
	public String selectKoreaAll(
			Model model, koreaVO vo) {
	
		model.addAttribute("li",service.selectAll(vo));

		return "/board/list.jsp";
	}

	@RequestMapping(value = "/selectKoreaMax.do")
	public String selectKoreaMax(Model model) {
		model.addAttribute("custno", service.custno());
		return "/board/form.jsp";
	}

	@RequestMapping(value = "/selectGradeKorea.do")
	public ModelAndView selectGradeKorea(ModelAndView mav) {
		List<koreaVO> vo_m = service.selectAll(null);
		List<gradeVO> vo_g = service.selectAllGrade(null);

		int[] temp_int = new int[vo_m.size()];

		for (int i = 0; i < vo_m.size(); i++) {
			for (int j = 0; j < vo_g.size(); j++) {
				if (vo_m.get(i).getCustno() == vo_g.get(j).getCustno()) {
					temp_int[i] += vo_g.get(j).getPrice();
				} // if
			} // for j
			vo_m.get(i).setSum(temp_int[i]);

			switch (vo_m.get(i).getGrade()) {
			case "A":
				vo_m.get(i).setGradeKor("VIP");
				break;
			case "B":
				vo_m.get(i).setGradeKor("일반");
				break;
			case "C":
				vo_m.get(i).setGradeKor("직원");
				break;
			default:
				vo_m.get(i).setGradeKor("오류");
				break;

			}
		} // for i

		List<koreaVO> sortList = vo_m.stream().sorted(Comparator.comparingInt(koreaVO::getSum).reversed()).collect(Collectors.toList());

		mav.addObject("li", sortList);
		mav.setViewName("/board/korea_grade.jsp");
		return mav;
	}
	
	   @RequestMapping("/IdCk.do")
	   void IdCk(HttpServletResponse response ,koreaVO vo ) throws Exception   {
	    
		    PrintWriter out=response.getWriter();
		    String str = service.idCk(vo);
		    System.out.println("===> str:" + vo);
		    
		    if (str==null) {
		      if (vo.getId()!="") {	
		        out.print("T");
		      }
		    }else {
		      out.print("F");	
		    }
	   
	   }
}

