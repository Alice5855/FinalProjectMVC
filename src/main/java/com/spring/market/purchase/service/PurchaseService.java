package com.spring.market.purchase.service;

import com.spring.market.purchase.domain.PurchaseVO;

public interface PurchaseService {

	public void registerPurchase(PurchaseVO purchaseVO);
	
	public void pdStockDown(Long pdStock, Long pdNum);
}
