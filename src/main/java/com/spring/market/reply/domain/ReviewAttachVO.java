package com.spring.market.reply.domain;

import lombok.Data;

@Data
public class ReviewAttachVO {
	private String rvuuid;
	private String rvpath;
	private String rvname;
	private String rvfolder;
	
	private Long rvnum; // FK from product_board
}