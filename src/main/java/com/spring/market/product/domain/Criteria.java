package com.spring.market.product.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter 
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1, 9);
		
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");

	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("pageNum", this.getAmount())
				.queryParam("pageNum", this.getType())
				.queryParam("pageNum", this.getKeyword());
		return builder.toUriString();
				
	}
}
