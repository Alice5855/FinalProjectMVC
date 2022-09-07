package com.spring.market.reply.mapper;

import java.util.List;

import com.spring.market.reply.domain.ReviewAttachVO;

public interface ReviewAttachMapper {
	public void insert(ReviewAttachVO vo);
	public void delete(String uuid);
	public List<ReviewAttachVO> findByRvnum(Long rvnum);
	// 첨부파일은 수정의 개념이 없기 때문에 CRD만 정의죔
	
	public void deleteAll(Long rvnum);
	// 첨부 파일 일괄 삭제
	
	// file의 유효성을 검증하는 method(Page600)
	public List<ReviewAttachVO> getOldFiles();
}
