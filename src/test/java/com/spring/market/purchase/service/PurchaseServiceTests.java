package com.spring.market.purchase.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.market.purchase.domain.PurchaseVO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PurchaseServiceTests {

	@Setter(onMethod_ = @Autowired)
	private PurchaseService service;
	
	@Test
	public void testRegist() {
		System.out.println("이거실행됨?");
		
		PurchaseVO testVO = new PurchaseVO();
		
		testVO.setMemNum(2L);
		testVO.setPcAddress("서울시");
		testVO.setPcTel("010-4567-1234");
		testVO.setPdNum1(0L);
		testVO.setPdNum2(1L);
		testVO.setPdNum3(2L);
		testVO.setPdNum4(3L);
		testVO.setPdNum5(4L);
		testVO.setPdNum6(5L);
		testVO.setPdNum7(6L);
		testVO.setPdNum8(7L);
		testVO.setPdNum9(8L);
		
		
		service.registerPurchase(testVO);
	}

}
