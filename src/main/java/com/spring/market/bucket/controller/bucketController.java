package com.spring.market.bucket.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.market.bucket.domain.BucketVO;
import com.spring.market.bucket.service.BucketService;
import com.spring.market.product.domain.ProductVO;
import com.spring.market.security.mapper.MemberMapper;
import com.spring.market.security.model.Member;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class bucketController {
	@Autowired
	private BucketService service;
	
	@Autowired
	private MemberMapper memMapper;
	
	@GetMapping("/bucket")
	public String bucketList(Principal principal, Model model) {
		String email = principal.getName();
		
		Member member = memMapper.findByMemberEmail(email); // 접속중인 유저의 정보 가져옴
		System.out.println(member);
		List<ProductVO> productList = new ArrayList<>(); // Model에 담을 상품 정보 리스트 인스턴스 선언
		productList = service.showBucket(member.getmemNum()); // showBucket()으로 로그인한 계정이 담아둔 상품정보 가져옴

		for (ProductVO productVO : productList) {
			System.out.println(member.getMemName()+"의 장바구니에 든 상품 : " + productVO.getPdName());
		}
		
		model.addAttribute("member", member);
		model.addAttribute("productList", productList);
		
		return "bucket/bucket";
	}
	
	@PostMapping(value="/bucket/delete", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public ResponseEntity<String> deleteBucket(String pdNum, String memNum){
		System.out.println("delete 컨트롤러에서 수신하긴했음");
		System.out.println("pdNum : " + pdNum);
		System.out.println("memNum : " + memNum);
		
		Long lMemNum = Long.parseLong(memNum);
		Long lPdNum = Long.parseLong(pdNum);
		System.out.println("상품이름 : " + service.getBucketInfo(lPdNum).getPdName());
		service.removeBucket(lMemNum, lPdNum);
		
		return new ResponseEntity<String>(service.getBucketInfo(lPdNum).getPdName(), HttpStatus.OK);
	}
	
	@PostMapping(value="/bucket/register", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public ResponseEntity<String> registBucket(String pdNum, Principal principal){
		System.out.println("register 컨트롤러에서 수신하긴했음");
		System.out.println("pdNum : " + pdNum);
		
		Member memVO = new Member();
		memVO = memMapper.findByMemberEmail(principal.getName());
		
		Long lPdNum = Long.parseLong(pdNum);
		System.out.println("상품이름 : " + service.getBucketInfo(lPdNum).getPdName());
		
		service.registerBucket(lPdNum, memVO.getmemNum());
		return new ResponseEntity<String>(service.getBucketInfo(lPdNum).getPdName(), HttpStatus.OK);
	}
	
	
}
