package com.spring.market.product.domain;

import java.util.Date;
import java.util.List;

import com.spring.market.product.domain.ProductAttachVO;

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
	
	
	
	private String pdPath; //FK from attach_product
	
	
	private List<ProductAttachVO> attachList;
	
	
	

}



 