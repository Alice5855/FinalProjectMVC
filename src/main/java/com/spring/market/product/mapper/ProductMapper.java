package com.spring.market.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.market.product.domain.Criteria;
import com.spring.market.product.domain.ProductVO;



public interface ProductMapper {
	
	public List<ProductVO> getListPaging(Criteria cri);
	public void insert(ProductVO product);
	public void insertSelectKey(ProductVO product);
	public ProductVO read(Long pdNum);
	public int delete(Long pdNum);
	public int update(ProductVO product);
	public int getTotalCount(Criteria cri);
	
	public String getU_nameFromU_Email(String pdName);
	public void setBoardImage(Long pdNum);
	
	public void updateReplyCnt(@Param("pdnum") Long pdnum, @Param("amount") int amount);
	// bno와 증감을 검증할 수 있는 amount 변수를 parameter로 받는다.
	// MyBatis의 SQL query에서는 기본적으로는 하나의 param만을 사용하기 때문에 2개 이상일
	// 경우에는 @Param을 사용해야 한다
}
