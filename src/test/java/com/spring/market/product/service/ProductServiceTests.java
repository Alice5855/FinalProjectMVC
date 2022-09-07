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
	

//	@Test
//	public void testInsert() {
//		ProductVO product = new ProductVO();
//		product.setPdName("되기를 바라");
//		product.setPdPrice(200000L);
//		product.setPdStock(300);
//		product.setPdHit(20000);
//		product.setPdKeyword("타워오브판타지");
//		service.register(product);
//	}
	
//	@Test
//	public void testRead() {
//		long i = 1L;
//		service.get(i);
//	}
	
//	@Test
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
//	@Test
//	public void testDelete() {
//		ProductVO product = service.get(3L);
//		service.remove(3L);
//	}

}
