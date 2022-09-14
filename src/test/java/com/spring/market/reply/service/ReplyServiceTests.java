package com.spring.market.reply.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.market.product.domain.Criteria;
import com.spring.market.reply.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService rservice;

	@Test
	public void testRegister() {
		ReplyVO vo = new ReplyVO();
		vo.setPdNum(2L);
		vo.setMemNickname("Gregory123");
		vo.setRvText("Review");
		
		rservice.register(vo);
	}
	
	
	@Test
	public void testGet() {
		rservice.get(5L);
	}
	
	@Test
	public void testModify() {
		ReplyVO vo = new ReplyVO();
		vo.setRvNum(5L);
		vo.setPdNum(5L);
		vo.setMemNickname("Gregory123");
		vo.setRvText("Review modify");
		
		rservice.modify(vo);
	}
	
	@Test
	public void testRemove() {
		rservice.remove(5L);
	}
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		rservice.getList(cri, 2L);
	}
	
	@Test
	public void testGetListPage() {
		Criteria cri = new Criteria();
		rservice.getList(cri, 2L);
	}
	

}
