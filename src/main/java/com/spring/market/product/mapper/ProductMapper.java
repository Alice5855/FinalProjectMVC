package com.spring.market.product.mapper;

import java.util.List;

import com.spring.market.product.domain.Criteria;
import com.spring.market.product.domain.ProductAttachVO;
import com.spring.market.product.domain.ProductVO;



public interface ProductMapper {
	
	public List<ProductVO> getListPaging(Criteria cri);
	
	public void insert(ProductVO product);
	public void insertSelectKey(ProductVO product);
	public ProductVO read(Long pdNum);
	public void delete(Long pdNum);
	public void update(ProductVO product);
	public int getTotalCount(Criteria cri);
	
	public String getU_nameFromU_Email(String pdPathName);
	public void setBoardImage(Long pdNum);
	
	public void inserpdPath(ProductVO product);
	
	
	
}
