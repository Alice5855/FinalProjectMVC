package com.spring.market.reply.mapper;

import java.util.List;

import com.spring.market.reply.domain.ReplyAttachVO;

public interface ReplyAttachMapper {
	public void insert(ReplyAttachVO vo);
	public void delete(String rvUuid);
	public List<ReplyAttachVO> findByRvNum(Long rvNum);
	// 첨부파일은 수정의 개념이 없기 때문에 CRD만 정의됨
	
	public void deleteAll(Long rvNum);
	// 첨부 파일 일괄 삭제
	
	// file의 유효성을 검증하는 method(Page600)
	public List<ReplyAttachVO> getOldFiles();
}
