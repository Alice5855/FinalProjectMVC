package com.spring.market.product.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.market.product.domain.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	

	@Test
	public void testInsert() {
		System.out.println("실행은함?");
		ProductVO product = new ProductVO();
		product.setPdName("아쿠아실asdasd물피규어");
		product.setPdPrice(180000L);
		product.setPdStock(2);
		product.setPdHit(587785);
		product.setPdKeyword("코노스바");
		service.register(product);
	}
//	
//	public void testRead() {
//		long i = 1L;
//		service.get(i);
//	}
	
//	public void testupdate() {
//		
//		
//		ProductVO product = service.get(3L);
//		
//		product.setPdName("상품명 수정");
//		product.setPdPrice(3000000L);
//		
//		service.modify(product);
//	}
//	
//	public void testDelete() {
////		ProductVO product = service.get(3L);
//		service.remove(3L);
//	}

}
