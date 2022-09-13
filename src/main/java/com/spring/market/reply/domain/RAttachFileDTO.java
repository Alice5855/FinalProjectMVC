package com.spring.market.reply.domain;

import lombok.Data;

@Data
public class RAttachFileDTO {
	// Page 516 첨부 file 정보를 저장하는 DataTransferObject
	private String rvUuid;
	private String rvFolder;
	private String rvName;
	private String rvPath;
	private Long rvNum;
}
