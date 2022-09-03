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
//	private Date b_regDate;
//	private Date b_updateDate;
	private String pdKeyword;
//	private String b_video;
	private int pdHit;
	
	private List<ProductAttachVO> attachList;
	// data를 한번에 처리하기 위한 List 객체
}


/* 
 * create table Product_Table(
	pdNum number primary key,
	pdName varchar2(100) not null,
	pdPrice number not null,
	pdStock number not null,
	pdKeyword varchar2(100),
	pdHit number
); 
 * 
 * 
 * */
 