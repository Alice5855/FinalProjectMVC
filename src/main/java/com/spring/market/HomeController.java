package com.spring.market;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.market.product.controller.ProductController;
import com.spring.market.product.domain.Criteria;
import com.spring.market.product.domain.PageDTO;
import com.spring.market.product.domain.ProductAttachVO;
import com.spring.market.product.domain.ProductVO;
import com.spring.market.product.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@RequestMapping("/")
@AllArgsConstructor
public class HomeController {
	private ProductService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@GetMapping("/")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//여기서부터 product 코딩
		
		
		
		List<ProductVO> productVOList = new ArrayList<ProductVO>();
		Criteria cri = new Criteria();
		productVOList = service.getList(cri);
		
		 for (ProductVO productVO : productVOList) {
		    	productVO.setPdNum(productVO.getPdNum());
		    }
		 model.addAttribute("list", productVOList);
		
			int total = service.getTotal(cri);
		 model.addAttribute("pageMaker", new PageDTO(cri, total));
		 
//		 Long pdNum;
//		 List<ProductAttachVO> productAttachList = new ArrayList<ProductAttachVO>();
//		productAttachList = service.selectAll(pdNum);
		
		return "index";
	}
	
	
	@GetMapping("/main")
	public void list(Criteria cri, Model m) {
	    List<ProductVO> productVOList = new ArrayList<ProductVO>();
	    productVOList = service.getList(cri);
	    for (ProductVO productVO : productVOList) {
	    	productVO.setPdNum(productVO.getPdNum());
	    }
	    m.addAttribute("list", productVOList);
		int total = service.getTotal(cri);
		log.info("total ===== " + total);
		m.addAttribute("pageMaker", new PageDTO(cri, total));
		
    }
    
	
	
}
