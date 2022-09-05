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
		ProductVO product = new ProductVO();
		product.setPdName("오늘의잇템");
		product.setPdPrice(181818L);
		product.setPdStock(400);
		product.setPdHit(20000);
		product.setPdKeyword("타워오브판타지");
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
