package com.spring.market.product.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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

@Controller // Spring의 bean에서 Controller로 인식할 수 있도록 함
@Log4j
@RequestMapping("/board/*") // '/board/'로 url pattern 정의
@AllArgsConstructor // 생성자 자동 생성
public class ProductController {
	// BoardController가 BoardService에 의존적이기 때문에 
	// @AllArgsConstructor 로 생성자를 만들고 자동으로 주입시켜줌. 생성자를 
	// 생성하지 않았을 경우 @Setter(onMethod_ = {@Autowired})로 처리함
	private ProductService service;
	
	
//	private UserMapper usermapper;
	
	// register 입력 page와 등록 처리
	// 등록 작업은 post method를 사용하나 get method로 입력 page를 '읽어올 수
	// 있도록' BoardController에 method를 추가해야 함
	// 아래의 register method는 입력 page를 보여주는 역할을 수행
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
	
	// 첨부 파일 list를 읽어오기 위한 method
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductAttachVO>> getAttachList(Long pdNum) {
		log.info("getAttachList ===== " + pdNum);
		return new ResponseEntity<List<ProductAttachVO>>(service.getAttachList(pdNum), HttpStatus.OK);
	}
	
	// Page712 added need of authentication
	// Only Logged in user can access
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(ProductVO product, RedirectAttributes ratt) {
		log.info("register ===== " + product);
		
		// adding file upload feature
		if (product.getAttachList() != null) {
			product.getAttachList().forEach(attach -> log.info(attach));
		}
		service.register(product);
		ratt.addFlashAttribute("result", product.getPdNum());
		return "redirect:/board/list";
	}
	
	/* 조회시 등록과 유사하게 BoardController를 이용해 처리할 수 있음. 특별한 경우를
	 * 제하면 조회는 Get 방식을 사용함
	 * C(reate)R(ead)U(pdate)D(elete)중 R만이 Get방식으로 수행
	 * modify 할 게시글을 불러오기 위해 get method에 modify mapping을 추가
	 * @GetMapping("/get")
	 * public void get(@RequestParam("b_number") Long b_number, Model m) ...
	 */
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("pdNum") Long pdNum, @ModelAttribute("cri") Criteria cri, Model m) {
		// @ModelAttribute : 자동으로 모델에 데이터를 지정한 이름으로 담아줌
		// 어노테이션 없이도 parameter는 객체를 통해 전달이 되지만 명시적 지정을 위해
		// 어노테이션을 사용
		// log.info("get ===== " + b_number);
		log.info("get or modify ===== " + pdNum);
		m.addAttribute("board", service.getRaw(pdNum));
	}
	
	// Modal로 vo를 전달하기 위하여 JSON으로 data를 전송. List.jsp에서 
	// JS의 $.GetJSON을 활용하여 data를 Modal에 HTML 형태로 Parse
	// 하여 글 내용을 표시함.
	@GetMapping(value="/getModal", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<ProductVO> getModal(Long pdNum) {
		log.info("getModal ===== " + pdNum);
		
		return new ResponseEntity<ProductVO>(service.get(pdNum), HttpStatus.OK);
	}

	// Page712 added need of authentication
	// Only if author of entry is username can access to modify
	// #board.writer : BoardVO(board)의 writer를 명시하여 검증절차
	@PreAuthorize("principal.username == #board.u_email")
	// update의 경우 BoardVO parameter로 내용을 설정하고 BoardService를 호출
	@PostMapping("/modify")
	public String modify(ProductVO product, @ModelAttribute("cri") Criteria cri, RedirectAttributes ratt) {
		log.info("modify ===== " + product);
		
		if (service.modify(product)) {
			log.info("modify successfully done");
			ratt.addFlashAttribute("result", "success");
		}
		// service.modify() method는 수정 여부를 boolean type으로 처리하므로
		// 수정에 성공한 경우 true를 반환하여 if문을 실행한다
		ratt.addAttribute("pageNum", cri.getPageNum());
		ratt.addAttribute("amount", cri.getAmount());
		// page 346 redirect시 attribute 유지
		ratt.addAttribute("type", cri.getType());
		ratt.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	// Page712 added need of authentication
	// Only if author of entry is username can access to remove
	// Parameter로 writer를 받아 검증절차
	@PreAuthorize("principal.username == #u_email")
	// remove()로 삭제 처리 한 후 RedirectAttributes로 list페이지로 이동시킴
	@PostMapping("/remove")
	public String remove(@RequestParam("pdName") String pdName, @RequestParam("pdNum") Long pdNum, @ModelAttribute("cri") Criteria cri, RedirectAttributes ratt) {
		// RequestParam은 view의 form data가 submit될 때에 전송된 data의 key값을
		// 기준으로 value값을 받아오는 것. @RequestParam("writer")의 writer는
		// form-data의 writer와 맞아야 하고, @PreAuthorize에서 검증을 위한 #writer
		// 는 form-data의 remove의 parameter로 받아온 writer의 *변수명*과 맞아야한다 
		log.info("remove ===== " + pdNum);
		
		List<ProductAttachVO> attachList = service.getAttachList(pdNum);
		// Added(page581)
		
		if (service.remove(pdNum)) {
			deleteFiles(attachList);
			// Added(page581)
			
			ratt.addFlashAttribute("result", "success");
		}
		// service.remove() method는 수정 여부를 boolean type으로 처리하므로
		// 삭제에 성공한 경우 true를 반환하여 if문을 실행한다
		/*
		ratt.addAttribute("pageNum", cri.getPageNum());
		ratt.addAttribute("amount", cri.getAmount());
		// page 346 redirect시 attribute 유지
		ratt.addAttribute("type", cri.getType());
		ratt.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
		*/
		return "redirect:/board/list" + cri.getListLink();
		// Criteria에 새로 생성한 method 사용(page 581)
	}
	
	// Page581 actual file delete
	// DB의 file data를 먼저 삭제하고 실제 파일을 삭제해야 함. 파일을 삭제하기 위해서는 해당
	// 게시물의 첨부파일 목록이 필요한데, 첨부파일 정보를 미리 준비해두고 DB data를 삭제하고
	// 난 후 실제 파일을 삭제
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
	// java.nio.file package의 Path를 이용하여 처리
	
//	@RequestMapping("/userUpdate.do") 
//	public String userUpdateForm(Principal principal, Model model) {
//		log.info("userid ===== " + principal.getName());
//		String userid = principal.getName();
//		UserVO user = usermapper.read(userid);
//		model.addAttribute("user", user);
//		
//		return "userUpdate";
//	}
}
