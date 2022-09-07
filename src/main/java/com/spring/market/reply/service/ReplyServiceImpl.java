package com.spring.market.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.market.product.domain.Criteria;
import com.spring.market.product.mapper.ProductMapper;
import com.spring.market.reply.domain.ReplyAttachVO;
import com.spring.market.reply.domain.ReplyPageDTO;
import com.spring.market.reply.domain.ReplyVO;
import com.spring.market.reply.mapper.ReplyAttachMapper;
import com.spring.market.reply.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper rmapper;
	
	@Setter(onMethod_ = @Autowired)
	private ProductMapper pMapper;
	// replycnt column 추가 된 후 추가된 code
	
	private ReplyAttachMapper rAttachMapper;

	// replycnt column 추가 후 댓글 등록 시 replycnt를 update할 수 있도록 트랜잭션 처리
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("Reply register ===== " + vo);
		
		pMapper.updateReviewCnt(vo.getPdNum(), 1);
		// replycnt 칼럼 추가된 후 추가된 code
		
		rmapper.insert(vo);

		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return 1;
		} else {
			vo.getAttachList().forEach(attach -> {
				log.info(attach);
				attach.setRvNum(vo.getRvNum());
				attach.setRvPath(attach.getRvFolder() + "/" + attach.getRvUuid() + "_" + attach.getRvName());
				rAttachMapper.insert(attach);
			});
			return 1;
		}
	}

	@Override
	public ReplyVO get(Long rvNum) {
		log.info("Reply get ===== " + rvNum);
		return rmapper.read(rvNum);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("Reply modify ===== " + vo);
		return rmapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rvNum) {
		log.info("Reply remove ===== " + rvNum);
		
		ReplyVO vo = rmapper.read(rvNum);
		// replycnt 칼럼 추가된 후 추가된 code
		pMapper.updateReviewCnt(vo.getPdNum(), -1);
		// replycnt 칼럼 추가된 후 추가된 code
		
		return rmapper.delete(rvNum);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long pdNum) {
		log.info("Reply getList ===== (from) " + pdNum);
		return rmapper.getListWithPaging(cri, pdNum);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long pdNum) {
		return new ReplyPageDTO(rmapper.getCountByPdNum(pdNum), rmapper.getListWithPaging(cri, pdNum));
	}
	
	@Override
	public List<ReplyAttachVO> getAttachList(Long rvNum) {
		log.info("get Attach list in ===== [rvNum]" + rvNum);
		return rAttachMapper.findByRvNum(rvNum);
	}

}
