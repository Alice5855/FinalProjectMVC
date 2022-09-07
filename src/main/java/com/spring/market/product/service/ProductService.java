package com.spring.market.product.service;

import java.util.List;

import com.spring.market.product.domain.Criteria;
import com.spring.market.product.domain.ProductAttachVO;
import com.spring.market.product.domain.ProductVO;



public interface ProductService {
	
	public void register(ProductVO product);
	
	// bno값으로 특정 게시물 정보를 가져옴
	public ProductVO get(Long pdNum);
	
	public boolean modify(ProductVO product);
	
	public boolean remove(Long pdNum);
	
	// 전체 게시물 리스트를 가져옴
	// public List<BoardVO> getList();
	
	public List<ProductVO> getList(Criteria cri);
	
	// Page 323 getTotal() method 정의
	public int getTotal(Criteria cri);
	
	// 첨부 파일을 불러오기 위한 List
	public List<ProductAttachVO> getAttachList(Long pdNum);
	
//	public String getU_nameFromU_Email(String u_email);
	public void setBoardImage(Long pdNum);

	ProductVO getRaw(Long pdNum);
}
