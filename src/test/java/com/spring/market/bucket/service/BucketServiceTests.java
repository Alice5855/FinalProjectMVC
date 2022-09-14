package com.spring.market.bucket.service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.market.product.domain.ProductVO;
import com.spring.market.security.model.Member;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BucketServiceTests {

	@Setter(onMethod_ = @Autowired)
	private BucketService service;
	
	@Test
	public void testReg() {
		ProductVO testPdVO = new ProductVO();
		testPdVO.setPdNum(2L);
		
		Member testMemVO = new Member();
		testMemVO.setMemNum(6L);
		
		service.registerBucket(20L, 6L);
		service.registerBucket(21L, 6L);
	}
	
//	@Test
	public void testSelect() {
		Member testMemVO = new Member();
		testMemVO.setMemNum(32L);
		
		List<ProductVO> testPdVO = new ArrayList<ProductVO>();
		
		testPdVO = service.showBucket(testMemVO.getmemNum());
		
		System.out.println("가져온 상품 정보 : ");
		for (ProductVO productVO : testPdVO) {
			System.out.println("상품명 : " + productVO.getPdName());
			System.out.println("상품 번호 : " + productVO.getPdNum());
			System.out.println("상품 가격 : " + productVO.getPdPrice());
			System.out.println("++++++++++++++");
		}
		System.out.println("--------------------------------------");
	}
	
//	@Test
	public void testDelete() {
		Member testMemVO = new Member();
		testMemVO.setMemNum(1L);
		
		service.removeBucket(testMemVO.getMemNum(), 0L);
	}
	
//	@Test
	public void testSelectCount() {
		Member testMemVO = new Member();
		testMemVO.setMemNum(1L);
		
		System.out.println("1번친구의 장바구니 갯수"+service.getBucketCount(testMemVO.getMemNum()));
	}
}
