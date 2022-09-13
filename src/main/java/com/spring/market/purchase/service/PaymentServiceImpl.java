package com.spring.market.purchase.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.market.purchase.domain.PaymentVO;
import com.spring.market.purchase.mapper.PaymentMapper;


@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentMapper paymentMapper;
	
	
	@Override
	public void insertPaymentSuccess(PaymentVO vo) {
		paymentMapper.insertPaymentSuccess(vo);
	}
	
}  
