package com.spring.market.product.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	
	private String pdUuid;
	private String pdPath;
	private String pdName;
	private String pdFolder;
	
	private Long pdNum; // FK from product_board
}
