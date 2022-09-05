package com.spring.market.product.mapper;

import java.util.List;



import com.spring.market.product.domain.ProductAttachVO;

public interface ProductAttachMapper {
	public void insert(ProductAttachVO vo);
	public void delete(String pdUuid);
	public List<ProductAttachVO> findByB_number(Long pdNum);
	// 첨부파일은 수정의 개념이 없기 때문에 CRD만 정의죔
	
	public void deleteAll(Long pdNum);
	// 첨부 파일 일괄 삭제
	
	// file의 유효성을 검증하는 method(Page600)
	public List<ProductAttachVO> getOldFiles();
}
