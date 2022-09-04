package com.spring.market.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.market.product.domain.Criteria;
import com.spring.market.product.mapper.ProductMapper;
import com.spring.market.reply.domain.ReplyPageDTO;
import com.spring.market.reply.domain.ReplyVO;
import com.spring.market.reply.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ProductMapper pMapper;
	// replycnt column 추가 된 후 추가된 code

	// replycnt column 추가 후 댓글 등록 시 replycnt를 update할 수 있도록 트랜잭션 처리
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("Reply register ===== " + vo);
		
		pMapper.updateReplyCnt(vo.getPdnum(), 1);
		// replycnt 칼럼 추가된 후 추가된 code
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rvnum) {
		log.info("Reply get ===== " + rvnum);
		return mapper.read(rvnum);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("Reply modify ===== " + vo);
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rvnum) {
		log.info("Reply remove ===== " + rvnum);
		
		ReplyVO vo = mapper.read(rvnum);
		// replycnt 칼럼 추가된 후 추가된 code
		pMapper.updateReplyCnt(vo.getPdnum(), -1);
		// replycnt 칼럼 추가된 후 추가된 code
		
		return mapper.delete(rvnum);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long pdnum) {
		log.info("Reply getList ===== (from) " + pdnum);
		return mapper.getListWithPaging(cri, pdnum);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long pdnum) {
		return new ReplyPageDTO(mapper.getCountByBno(pdnum), mapper.getListWithPaging(cri, pdnum));
	}
	
}
