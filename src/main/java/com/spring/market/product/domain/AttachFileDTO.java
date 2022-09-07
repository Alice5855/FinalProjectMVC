package com.spring.market.product.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	// Page 516 첨부 file 정보를 저장하는 DataTransferObject
	private String pdUuid;
	private String pdPath;
	private String pdName;
	private String pdFolder;
	
	private Long pdNum; // FK from product_board
}
