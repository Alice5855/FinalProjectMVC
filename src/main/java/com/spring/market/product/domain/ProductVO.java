package com.spring.market.product.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
	private long pdNum;
	private String pdName;
	private long pdPrice;
	private int pdStock;
	private String pdKeyword;
	private int pdHit;
	private Date pdRegDate;
	private int reviewCnt;
	
	private List<ProductAttachVO> attachList;
	
	// data를 한번에 처리하기 위한 List 객체
}