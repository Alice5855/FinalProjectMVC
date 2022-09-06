package com.spring.market.reply.service;

import java.util.List;

import com.spring.market.product.domain.Criteria;
import com.spring.market.reply.domain.ReplyPageDTO;
import com.spring.market.reply.domain.ReplyVO;


public interface ReplyService {
	public int register(ReplyVO vo);
	public ReplyVO get(Long rvnum);
	public int modify(ReplyVO vo);
	public int remove(Long rvnum);
	public List<ReplyVO> getList(Criteria cri, Long pdnum);
	// Page 434
	public ReplyPageDTO getListPage(Criteria cri, Long pdnum);
}
