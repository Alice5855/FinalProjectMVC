package com.spring.market.purchase.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.market.purchase.domain.PurchaseVO;

public interface PurchaseMapper {
	
	public void registerPurchase(PurchaseVO purchaseVO);

	public void pdStockDown(@Param("pdStock") Long pdStock, @Param("pdNum") Long pdNum);
}
