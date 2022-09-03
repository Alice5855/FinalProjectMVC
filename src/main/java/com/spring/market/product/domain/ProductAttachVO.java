package com.spring.market.product.domain;

import lombok.Data;

@Data
public class ProductAttachVO {
	private String pdUuid;
	private String pdPath;
	private String pdName;
	private String pdFolder;
	
	private Long pdNum; // FK from product_board
}


/*
 *create table Attach_Product(
	pdUuid varchar2(100) primary key,
	pdFolder varchar2(100) not null,
	pdName varchar2(100) not null,
	pdPath varchar2(300) not null,
    pdNum number not null,
	Constraint fk_Attach foreign key(pdNum) references Product_Table(pdNum)

	
);
 * 
 * 
 * 
 *  */
 