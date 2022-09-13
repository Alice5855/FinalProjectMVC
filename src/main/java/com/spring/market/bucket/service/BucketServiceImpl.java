package com.spring.market.bucket.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.market.bucket.mapper.BucketMapper;
import com.spring.market.product.domain.ProductVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;

@Service
@AllArgsConstructor
public class BucketServiceImpl implements BucketService{
	
	@Setter(onMethod_ = @Autowired)
	private BucketMapper mapper;
	
	@Override
	public void registerBucket(Long pdNum, Long memNum) {
		System.out.println("써비스 임플의 registerBucket 실행 " + pdNum + ", " + memNum);
		mapper.registerBucket(pdNum, memNum);
	}

	@Override
	public List<ProductVO> showBucket(Long memNum) {
		// 회원 번호를 통해 조회할 품목 리스트 전체 조회를 위한 기능
		List<Long> pdNumList = new ArrayList<Long>(); // 품목의 번호를 리스트화로 받기 위한 인스턴스 생성
		List<ProductVO> resultVO = new ArrayList<ProductVO>(); // 리턴할 품목 정보를 담기 위한 리스트 인스턴스 생성
		
		pdNumList = mapper.getBucketPdNum(memNum); // getBucketPdNum을 통해 memNum으로 bucketTable의 pdNum을 전부 리스트로 저장
		
		for(int i = 0; i<pdNumList.size(); i++) { // 장바구니에 넣은 품목 개수만큼 반복
			resultVO.add(mapper.getBucketInfo(pdNumList.get(i))); // 리턴할 리스트에 품목 정보 저장
			System.out.println("버킷 서비스임플에서 실행 : " + resultVO.get(i).getPdNum());
			System.out.println("버킷 서비스임플에서 실행 : " + pdNumList.size());
		}
		
		return resultVO; // 저장한 리스트 리턴
	}

	@Override
	public void removeBucket(Long memNum, Long pdNum) {
		mapper.removeBucket(pdNum, memNum);
	}
	
	public ProductVO getBucketInfo(Long pdNum) {
		ProductVO result = mapper.getBucketInfo(pdNum);
		return result;
	}

	@Override
	public int getBucketCount(Long memNum) {
		List<Long> pdNumList = new ArrayList<Long>();
		pdNumList = mapper.getBucketPdNum(memNum);
		return pdNumList.size();
	}

	@Override
	public void removeBucketAll(Long memNum) {
		mapper.removeBucketAll(memNum);
	}
}
