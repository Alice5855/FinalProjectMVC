package com.spring.market.reply.domain;

import lombok.Data;

@Data
public class RAttachFileDTO {
	// Page 516 첨부 file 정보를 저장하는 DataTransferObject
	private String rvuuid;
	private String rvfolder;
	private String rvname;
	private String rvpath;
}
