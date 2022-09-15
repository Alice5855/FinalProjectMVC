package com.spring.market.reply.service;

import java.util.List;

import com.spring.market.product.domain.Criteria;
import com.spring.market.reply.domain.ReplyAttachVO;
import com.spring.market.reply.domain.ReplyPageDTO;
import com.spring.market.reply.domain.ReplyVO;


public interface ReplyService {
	public int register(ReplyVO vo);
	public ReplyVO get(Long rvNum);
	public int modify(ReplyVO vo);
	public int remove(Long rvNum);
	public List<ReplyVO> getList(Criteria cri, Long pdNum);
	// Page 434
	public ReplyPageDTO getListPage(Criteria cri, Long pdNum);
	
	// 첨부 파일을 불러오기 위한 List
	public List<ReplyAttachVO> getAttachList(Long rvNum);
	
}
