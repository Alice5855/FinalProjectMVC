package com.spring.market.product.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.market.product.domain.Criteria;
import com.spring.market.product.domain.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
//
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
//	
	@Test
	public void test() {
		Criteria cri = new Criteria();
		
		cri.setPageNum(1);
		cri.setAmount(9);
		service.getList(cri);
	
	}
//	
//	@Test
//	public void testRegister() {
//		BoardVO board = new BoardVO();
//		board.setB_title("Newly entired Title");
//		board.setB_text("Newly entried Context");
//		board.setU_email("test@test.com");
//		
//		service.register(board);
//		log.info("Newly entried number : " + board.getB_number());
//	}
//	
//	@Test
//	public void testGetList() {
//		service.getList(new Criteria(1, 10)).forEach(board -> log.info(board));
//	}
//	
//	@Test
//	public void testGet() {
//		long testB_number = 14L;
//		log.info(service.get(testB_number));
//	}
//	
//	@Test
//	public void testRemove() {
//		log.info("REMOVE RESULT : " + service.remove(6L));
//	}
//	
//	@Test
//	public void testModify() {
//		BoardVO board = service.get(7L);
//		if (board == null) {
//			return;
//		} else {
//			board.setB_title("Newly modified title");
//		}
//		log.info("MODIFY RESULT : " + service.modify(board));
//	}
}
