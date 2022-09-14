package com.spring.market.reply.domain;

import lombok.Data;

@Data
public class ReplyAttachVO {
	private String rvUuid;
	private String rvPath;
	private String rvName;
	private String rvFolder;
	
	private Long rvNum; // FK from product_board
}