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
@Service // 계층 구조상 business 영역을 담당하는 객체임을 명시
@AllArgsConstructor // 모든 parameter를 이용하는 생성자를 자동 생성
public class ProductServiceImpl implements ProductService {

	// Spring 4.3 이상에서는 단일 parameter를 갖는 생성자의 경우 자동 처리됨
	// (Parameter를 자동 주입)
	@Setter(onMethod_ = {@Autowired})
	private ProductMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private ProductAttachMapper attachMapper;
	
	// tbl_board에 게시글과 tbl_attach에 file upload가 함께 이루어져야 하기 때문에
	// Transactional화
	@Transactional
	@Override
	public void register(ProductVO product) {
		
		mapper.insertSelectKey(product);
		log.info("registered ===== to " + product);
//		System.out.println("왜 안돼" + attachMapper.findByB_number(120L));
//		attachMapper.findByB_number(120L);
		
		System.out.println(product.getPdNum());
		
//		if(product.getAttachList() == null || product.getAttachList().size() <= 0) {
//			return;
//		}
		
		product.getAttachList().forEach(attach -> {
			attach.setPdNum(product.getPdNum());
			System.out.println("확인 실행 됐냐 어태치 PdNum : " + attach.getPdNum());
			System.out.println("확인 실행 됐냐 어태치 PdName : " + attach.getPdName());
			System.out.println("확인 실행 됐냐 어태치 PdFolder : " + attach.getPdFolder());
			System.out.println("확인 실행 됐냐 어태치 PdUuid : " + attach.getPdUuid());
			
//			attach.setPdPath(attach.getPdFolder().replaceAll("\\+", "/") + "/" + attach.getPdUuid() + "_" + attach.getPdName());
			attach.setPdPath(attach.getPdFolder().replace('\\', '/')+ "/" + attach.getPdUuid() + "_" + attach.getPdName());
			System.out.println("확인 실행 됐냐 어태치 PdPath : " + attach.getPdPath());
			attachMapper.insert(attach);
			
			product.setPdPath(attach.getPdPath());
			mapper.inserpdPath(product);
				
			
			
			
		});
		
		
		
//		mapper.setBoardImage(product.getPdNum());
	}

	@Override
	public ProductVO get(Long pdNum) {
		log.info("get ===== " + pdNum + " from board");
		
		ProductVO pvo = mapper.read(pdNum);
		pvo.getPdName();
		// get service에서 u_email을 u_name으로 변환하여 vo를 생성하도록 함. 게시글에 작성자를 u_name으로 표시하기 위함
		
		return pvo;
	}
	
	

	// 첨부 file과 게시글의 수정이 함께 이루어지도록 Transactional 적용
	@Transactional
	@Override
	public void modify(ProductVO product) {
		log.info("Modify ===== Modify entry " + product);
		
//		attachMapper.deleteAll(product.getPdNum());
		
		log.info("product pdNum=====" + product.getPdNum());
		
		Long EpdNum = product.getPdNum();
		
		product.setPdNum(EpdNum);
		
		attachMapper.deleteAll(product.getPdNum());
		
		
//		mapper.delete(product.getPdNum());
		mapper.update(product);
		
		
		
		
		
		
		product.getAttachList().forEach(attach -> {
			
			attach.setPdNum(product.getPdNum());

			
//			attach.setPdPath(attach.getPdFolder().replaceAll("\\+", "/") + "/" + attach.getPdUuid() + "_" + attach.getPdName());
			attach.setPdPath(attach.getPdFolder().replace('\\', '/')+ "/" + attach.getPdUuid() + "_" + attach.getPdName());
			System.out.println("확인 실행 됐냐 어태치 PdPath : " + attach.getPdPath());
			attachMapper.insert(attach);
			
			product.setPdPath(attach.getPdPath());
			mapper.inserpdPath(product);
				
			
			
			
		});
		
		
//		if (modifyResult && product.getAttachList() != null && product.getAttachList().size() > 0) {
//			product.getAttachList().forEach(attach -> {
//				attach.setPdNum(product.getPdNum());
//				attachMapper.insert(attach);
//			});
//		}
//		mapper.setBoardImage(product.getPdNum());
		
		
		// 첨부file은 수정이 아닌, 기존의 file data를 삭제하고 새로운 file을 upload
		// 하는 식으로 수행된다
		
		// return mapper.update(board) == 1;
		// 수정이 정상적으로 이루어 지면 true 값이 return됨
		// (mapper.update()에서 1을 반환함)
	}

	// 게시글과 file이 같이 삭제되도록 Transaction 적용
	@Transactional
	@Override
	public void remove(Long pdNum) {
		log.info("remove ===== Remove entry " + pdNum);
//		attachMapper.deleteAll(pdNum);
		// 첨부된 file 일괄 삭제
//		return mapper.delete(pdNum) == 1;
		attachMapper.deleteAll(pdNum);
		mapper.delete(pdNum);
		// 수정이 정상적으로 이루어 지면 true 값이 return됨
		// (mapper.delete()에서 1을 반환함)
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

	
//	@Override
//	public String getpdNameFromU_Email(String u_email) {
//		log.info("get U_name from U_email");
//		return mapper.getU_nameFromU_Email(u_email);
//	}

	@Override
	public void setBoardImage(Long pdNum) {
		mapper.setBoardImage(pdNum);
	}

	@Override
	public List<ProductAttachVO> selectAll(Long pdNum) {
		log.info("프로덕트랑 어태치테이블 다 고를게~" + pdNum);
		return attachMapper.selectAll(pdNum);
	}

//	@Override
//	public void attachGet(Long pdNum) {
//		attachMapper.findByB_number(pdNum);
//		
//	}

	
	
	
	
}
