package com.spring.market.purchase.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.market.product.domain.ProductVO;
import com.spring.market.purchase.service.PurchaseService;
import com.spring.market.security.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class PurchaseController {
	
	@Autowired
	private PurchaseService service;

	@Autowired
	private MemberMapper memMapper;
	
	@RequestMapping(value="/buySingle", method= RequestMethod.POST)
	public String buySingle(HttpServletRequest req, Principal principal, Model model) {
		
		System.out.println("실행은했음?");
		System.out.println("받아온 값 : " + req.getParameter("pdNum"));
		
		
		return "/purchase/purchase";
	}
	
}
