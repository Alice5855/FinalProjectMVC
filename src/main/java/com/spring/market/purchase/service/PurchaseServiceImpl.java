package com.spring.market.purchase.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.market.purchase.domain.PurchaseVO;
import com.spring.market.purchase.mapper.PurchaseMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class PurchaseServiceImpl implements PurchaseService {

	@Setter(onMethod_ = @Autowired)
	private PurchaseMapper mapper;
	
	@Override
	public void registerPurchase(PurchaseVO purchaseVO) {
		mapper.registerPurchase(purchaseVO);
	}
}
