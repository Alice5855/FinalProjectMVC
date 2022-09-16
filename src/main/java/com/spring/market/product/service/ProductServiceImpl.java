package com.spring.market.product.service;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.market.product.domain.Criteria;
import com.spring.market.product.domain.ProductAttachVO;
import com.spring.market.product.domain.ProductVO;
import com.spring.market.product.mapper.ProductAttachMapper;
import com.spring.market.product.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service 
@AllArgsConstructor 
public class ProductServiceImpl implements ProductService {


	@Setter(onMethod_ = {@Autowired})
	private ProductMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private ProductAttachMapper attachMapper;
	

	@Transactional
	@Override
	public void register(ProductVO product) {
		
		mapper.insertSelectKey(product);
		
		product.getAttachList().forEach(attach -> {
			attach.setPdNum(product.getPdNum());
			attach.setPdPath(attach.getPdFolder().replace('\\', '/')+ "/" + attach.getPdUuid() + "_" + attach.getPdName());
			System.out.println("확인 실행 됐냐 어태치 PdPath : " + attach.getPdPath());
			attachMapper.insert(attach);
			
			product.setPdPath(attach.getPdPath());
			mapper.inserpdPath(product);
				
			
			
			
		});
		
		
		

	}

	@Override
	public ProductVO get(Long pdNum) {
		log.info("get ===== " + pdNum + " from board");
		
		ProductVO pvo = mapper.read(pdNum);
		pvo.getPdName();
		
		
		return pvo;
	}
	
	

	
	@Transactional
	@Override
	public void modify(ProductVO product) {
		log.info("Modify ===== Modify entry " + product);
		
//		attachMapper.deleteAll(product.getPdNum());
		
		log.info("product pdNum=====" + product.getPdNum());
		
		Long EpdNum = product.getPdNum();
		
		product.setPdNum(EpdNum);
		
		attachMapper.deleteAll(product.getPdNum());
		
		
		mapper.delete(product.getPdNum());
//		mapper.update(product);
		mapper.insert(product);
		

		product.getAttachList().forEach(attach -> {
			
			attach.setPdNum(product.getPdNum());

			

			attach.setPdPath(attach.getPdFolder().replace('\\', '/')+ "/" + attach.getPdUuid() + "_" + attach.getPdName());
			System.out.println("확인 실행 됐냐 어태치 PdPath : " + attach.getPdPath());
			attachMapper.insert(attach);
			
			product.setPdPath(attach.getPdPath());
			mapper.inserpdPath(product);
				
			
			
			
		});
		
		

	}


	@Transactional
	@Override
	public void remove(Long pdNum) {
		log.info("remove ===== Remove entry " + pdNum);

		attachMapper.deleteAll(pdNum);
		mapper.delete(pdNum);
		
	}

	@Override
	public List<ProductVO> getList(Criteria cri) {
		log.info("getList ===== Entry List from product with paging " + cri);
		
		return mapper.getListPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotalCount ===== " + cri);
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ProductAttachVO> getAttachList(Long pdNum) {
		log.info("get Attach list in ===== [pdNum]" + pdNum);
		return attachMapper.findByPdNum(pdNum);
	}

	


	@Override
	public void setBoardImage(Long pdNum) {
		mapper.setBoardImage(pdNum);
	}

	@Override
	public List<ProductAttachVO> selectAll(Long pdNum) {
		log.info("프로덕트랑 어태치테이블 다 고를게~" + pdNum);
		return attachMapper.selectAll(pdNum);
	}



	
	
	
	
}
