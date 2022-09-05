package com.spring.market.product.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	// Page 516 첨부 file 정보를 저장하는 DataTransferObject
	private String pdName;
	private String pdPath;
	private String pdUuid;
}
