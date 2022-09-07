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
	public int delete(Long pdNum);
	public int update(ProductVO product);
	public int getTotalCount(Criteria cri);
	
	public String getU_nameFromU_Email(String pdPathName);
	public void setBoardImage(Long pdNum);
	
	//여기서부터 attach에서 사용하는 메서드
	public void insertAttach(ProductAttachVO attach);
	public void findpdNum(Long pdNum);
	public void deleteAttachAll(Long pdNum);
	public List<ProductAttachVO> getOldFiles();
}
