package com.spring.market.product.controller;

import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.market.product.domain.Criteria;
import com.spring.market.product.domain.PageDTO;
import com.spring.market.product.domain.ProductAttachVO;
import com.spring.market.product.domain.ProductVO;
import com.spring.market.product.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller 
@Log4j
@RequestMapping("/product/*") 
@AllArgsConstructor 
public class ProductController {

	private ProductService service;
	
	@GetMapping("/register")
	public void register() {
	}
	
	@GetMapping("/list")
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
    
    public String getProductName(ProductVO productVO) {

		return productVO.getPdName();
	}
	
	@GetMapping(value="/getAttachListZero", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductAttachVO>> getAttachListZero(Long pdNum) {
		ProductAttachVO paVO = new ProductAttachVO();
		List<ProductAttachVO> result = new ArrayList<ProductAttachVO>();
		
		paVO = service.getAttachList(pdNum).get(0);
		result.add(paVO);
		
		log.info("getAttachList ===== " + pdNum);
		return new ResponseEntity<List<ProductAttachVO>>(result, HttpStatus.OK);
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductAttachVO>> getAttachList(Long pdNum) {
		log.info("getAttachList ===== " + pdNum);
		return new ResponseEntity<List<ProductAttachVO>>(service.getAttachList(pdNum), HttpStatus.OK);
	}

	@PostMapping("/register")
	public void register(ProductVO product, RedirectAttributes ratt, HttpServletResponse response) throws Exception {
		log.info("register ===== " + product.getPdNum());
		
		service.register(product);
		ratt.addFlashAttribute("result", product.getPdNum());
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<script>alert('상품 등록 성공');location.href = '/product/page'</script>");
		out.flush();
		
	}

	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("pdNum") Long pdNum, @ModelAttribute("cri") Criteria cri, Model m) {
		// @ModelAttribute : 자동으로 모델에 데이터를 지정한 이름으로 담아줌
		
		log.info("get or modify ===== " + pdNum);
		m.addAttribute("product", service.get(pdNum));
		m.addAttribute("productAttach", service.getAttachList(pdNum));
	}
	
	// Modal로 vo를 전달하기 위하여 JSON으로 data를 전송. List.jsp에서 
	// JS의 $.GetJSON을 활용하여 data를 Modal에 HTML 형태로 Parse
	// 하여 글 내용을 표시함.
	@GetMapping(value="/getModal", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<ProductVO> getModal(Long pdNum){
		log.info("getModal ===== " + pdNum);
		
		return new ResponseEntity<ProductVO>(service.get(pdNum), HttpStatus.OK);
	}

	@PostMapping("/modify")
	public String modify(ProductVO product, @ModelAttribute("cri") Criteria cri, RedirectAttributes ratt, HttpServletResponse response) throws Exception {
		log.info("modify ===== " + product);
		
		try {
			service.modify(product);
			log.info("modify successfully done");
			ratt.addFlashAttribute("result", "success");
		} catch (Exception e) {
			System.out.println("수정 실패했데" + e.getMessage());
			
		}
	
		ratt.addAttribute("pageNum", cri.getPageNum());
		ratt.addAttribute("amount", cri.getAmount());
		//redirect시 attribute 유지
		ratt.addAttribute("type", cri.getType());
		ratt.addAttribute("keyword", cri.getKeyword());
		
		
		
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<script>alert('상품 수정 성공');location.href = '/product/page'</script>");
		out.flush();
		
		return "/product/page";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("pdName") String pdName, @RequestParam("pdNum") Long pdNum, @ModelAttribute("cri") Criteria cri, RedirectAttributes ratt, HttpServletResponse response) {
	
		log.info("remove ===== " + pdNum);
		
		List<ProductAttachVO> attachList = service.getAttachList(pdNum);

		
		try {
			service.remove(pdNum);
			deleteFiles(attachList);
			
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			PrintWriter out = response.getWriter();
			out.println("<script>alert('상품 삭제 성공');location.href = '/product/page'</script>");
			out.flush();
			ratt.addFlashAttribute("result", "success");
		} catch (Exception e) {
			System.out.println("삭제 안됐데 ㅋㅋ" + e.getMessage());
		}

		return "redirect:/product/page" + cri.getListLink();
		
	}
	
	private void deleteFiles(List<ProductAttachVO> attachList) {
   
		if(attachList == null || attachList.size() == 0) {
			return;
		}
   
		log.info("delete attach files...................");
		log.info(attachList);
   
		attachList.forEach(attach -> {
			try {        
				Path file  = Paths.get("C:\\Uploaded\\" + attach.getPdFolder() + "\\" + attach.getPdUuid() + "_" + attach.getPdName());
   
				Files.deleteIfExists(file);
   
				if(Files.probeContentType(file).startsWith("image")) {
   
					Path thumbNail = Paths.get("C:\\Uploaded\\" + attach.getPdFolder() + "\\sthumb_" + attach.getPdUuid() + "_" + attach.getPdName());
             
					Files.delete(thumbNail);
				}
   
			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			} // catch
		}); // forEach
	}
	
	@GetMapping("/page")
	public void page(Criteria cri, Model m) {
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
