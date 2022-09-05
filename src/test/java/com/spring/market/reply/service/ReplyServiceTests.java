package com.spring.market.reply.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.market.reply.domain.ReplyVO;

import lombok.Setter;

public class ReplyServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService rservice;

	@Test
	public void testRegister() {
		ReplyVO vo = new ReplyVO();
		vo.setPdnum(1L);
		
	}
	
	/*
	@Test
	public void testGet() {
		fail("Not yet implemented");
	}

	@Test
	public void testModify() {
		fail("Not yet implemented");
	}

	@Test
	public void testRemove() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetList() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetListPage() {
		fail("Not yet implemented");
	}
	*/

}
