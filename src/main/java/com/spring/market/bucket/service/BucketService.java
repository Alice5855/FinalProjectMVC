package com.spring.market.bucket.service;

import java.util.List;

import com.spring.market.product.domain.ProductVO;

public interface BucketService {
	
	public void registerBucket(Long pdNum, Long memNum); // memNum 계정에 장바구니에 상품을 pdNum으로 등록
	
	public List<ProductVO> showBucket(Long memNum); // memNum으로 product 조회
	
	public void removeBucket(Long memNum, Long pdNum); // memNum에 있는 pdNum 상품 장바구니에서 제거
	
	public int getBucketCount(Long memNum);
	
}
