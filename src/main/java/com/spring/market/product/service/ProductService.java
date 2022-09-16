package com.spring.market.product.service;

import java.util.List;

import com.spring.market.product.domain.Criteria;
import com.spring.market.product.domain.ProductAttachVO;
import com.spring.market.product.domain.ProductVO;


public interface ProductService {
	
	public void register(ProductVO product);
	
	
	public ProductVO get(Long pdNum);
	
	public void modify(ProductVO product);
	
	public void remove(Long pdNum);
	
	
	
	public List<ProductVO> getList(Criteria cri);
	

	public int getTotal(Criteria cri);
	

	public List<ProductAttachVO> getAttachList(Long pdNum);
	

	public void setBoardImage(Long pdNum);
	
	public List<ProductAttachVO> selectAll(Long pdNum);


}
