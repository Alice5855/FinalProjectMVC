package com.spring.market.purchase.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.market.bucket.domain.BucketVO;
import com.spring.market.bucket.service.BucketService;
import com.spring.market.product.domain.ProductVO;
import com.spring.market.purchase.domain.PaymentVO;
import com.spring.market.purchase.domain.PurchaseVO;
import com.spring.market.purchase.service.PaymentService;
import com.spring.market.purchase.service.PurchaseService;
import com.spring.market.security.mapper.MemberMapper;
import com.spring.market.security.model.Member;

@RestController
public class PaymentController {

	@Autowired
	PaymentService paymentService;
	
	@Autowired
	PurchaseService purchaseService;
	
	@Autowired
	BucketService bucketService;
	
	@Autowired
	MemberMapper memMapper;
	
	@RequestMapping(value = "/paymentProcess.do")
	public void paymentDone(@RequestBody PaymentVO payVO, Principal principal) {
		paymentService.insertPaymentSuccess(payVO);
		
		Member mem = new Member();
		mem = memMapper.findByMemberEmail(principal.getName());
		
		PurchaseVO pcVO = new PurchaseVO();
		if(payVO.getPdNum() != 0) {
			pcVO.setMemNum(mem.getmemNum());
			pcVO.setPcAddress(payVO.getPcAddress());
			pcVO.setPcTel(payVO.getPcTel());
			pcVO.setPdNum1(payVO.getPdNum());
			pcVO.setPdNum2(0L);
			pcVO.setPdNum3(0L);
			pcVO.setPdNum4(0L);
			pcVO.setPdNum5(0L);
			pcVO.setPdNum6(0L);
			pcVO.setPdNum7(0L);
			pcVO.setPdNum8(0L);
			pcVO.setPdNum9(0L);
			pcVO.setPdNum10(0L);
			
			purchaseService.registerPurchase(pcVO);
			
			ProductVO pdVO = new ProductVO();
			pdVO = bucketService.getBucketInfo(pcVO.getPdNum1());
			purchaseService.pdStockDown(pdVO.getPdStock()-1L, pdVO.getPdNum());
			bucketService.removeBucket(mem.getmemNum(), payVO.getPdNum());
		}else {
			List<ProductVO> bucketList = new ArrayList<>();
			bucketList = bucketService.showBucket(mem.getmemNum());
			
			pcVO.setMemNum(mem.getmemNum());
			pcVO.setPcAddress(payVO.getPcAddress());
			pcVO.setPcTel(payVO.getPcTel());

			try {
				pcVO.setPdNum1(bucketList.get(0).getPdNum());
			} catch (Exception e) {
				// TODO: handle exception
				pcVO.setPdNum1(0L);
			}
			
			try {
				pcVO.setPdNum2(bucketList.get(1).getPdNum());
			} catch (Exception e) {
				// TODO: handle exception
				pcVO.setPdNum2(0L);
			}
			
			try {
				pcVO.setPdNum3(bucketList.get(2).getPdNum());
			} catch (Exception e) {
				// TODO: handle exception
				pcVO.setPdNum3(0L);
			}
			
			try {
				pcVO.setPdNum4(bucketList.get(3).getPdNum());
			} catch (Exception e) {
				// TODO: handle exception
				pcVO.setPdNum4(0L);
			}
			
			try {
				pcVO.setPdNum5(bucketList.get(4).getPdNum());
			} catch (Exception e) {
				// TODO: handle exception
				pcVO.setPdNum5(0L);
			}
			
			try {
				pcVO.setPdNum6(bucketList.get(5).getPdNum());
			} catch (Exception e) {
				// TODO: handle exception
				pcVO.setPdNum6(0L);
			}
			
			try {
				pcVO.setPdNum7(bucketList.get(6).getPdNum());
			} catch (Exception e) {
				// TODO: handle exception
				pcVO.setPdNum7(0L);
			}
			
			try {
				pcVO.setPdNum8(bucketList.get(7).getPdNum());
			} catch (Exception e) {
				// TODO: handle exception
				pcVO.setPdNum8(0L);
			}
			
			try {
				pcVO.setPdNum9(bucketList.get(8).getPdNum());
			} catch (Exception e) {
				// TODO: handle exception
				pcVO.setPdNum9(0L);
			}
			
			try {
				pcVO.setPdNum10(bucketList.get(9).getPdNum());
			} catch (Exception e) {
				// TODO: handle exception
				pcVO.setPdNum10(0L);
			}
			try {
				for(int i = 0; i<bucketList.size(); i++) {
					System.out.println("pdStock 변경값 : " + (bucketList.get(i).getPdStock() -1));
					System.out.println("pdNum : " + (bucketList.get(i).getPdNum()));
					
					purchaseService.pdStockDown(bucketList.get(i).getPdStock()-1L, bucketList.get(i).getPdNum());
				}
			}catch (Exception e) {
				System.out.println("stockDown 사이즈 익셉션, 반복문탈출");
			}
			purchaseService.registerPurchase(pcVO);
			bucketService.removeBucketAll(mem.getmemNum());
		}
	}
}
