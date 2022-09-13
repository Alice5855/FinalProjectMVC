package com.spring.market.purchase.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	String imp_uid;
	String merchant_uid;
	int paid_amount;
	String apply_num;
	Date paid_at;	
	String paid_email;
	Long pdNum;
	String pcAddress;
	String pcTel;
}
