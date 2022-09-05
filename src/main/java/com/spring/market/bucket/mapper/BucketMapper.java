package com.spring.market.bucket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.market.product.domain.ProductVO;

public interface BucketMapper {
	
	// 장바구니에 추가
	public void registerBucket(@Param("pdNum") Long pdNum, @Param("memNum") Long memNum);
	
	// memNum으로 pdNum 리스트 갖고오기
	public List<Long> getBucketPdNum(long memNum);
	
	// 갖고온 pdNumList로 장바구니의 상품 정보 가져오기 (반복문 돌릴거) 
	public ProductVO getBucketInfo(long pdNum);
	
	// 장바구니에서 품목 삭제
	public void removeBucket(@Param("pdNum") Long pdNum, @Param("memNum") Long memNum);
	
}
	