package com.spring.market.security.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.spring.market.security.mapper.AuthMapper;
import com.spring.market.security.mapper.MemberMapper;
import com.spring.market.security.model.Member;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import sun.print.PeekGraphics;

@Service
@Log4j
@AllArgsConstructor
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = {@Autowired})
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private MemberMapper memMapper;
	private AuthMapper authMapper;
	
	@Override
	public Member login(Member mem) {
		//DB에서 회원 정보 조회
		System.out.println("써비쓰임플에서 실행"+mem);
		Member dbMember = memMapper.getMember(mem);
		
		//비번 일치 체크
		if(bCryptPasswordEncoder.matches(mem.getMemPw(), dbMember.getMemPw())) {
			return dbMember;
		}else {
			//불일치 -> null리턴
			return null;
		}
		
	}
	
	@Override
	public Long signup(Member mem, HttpServletRequest req ) throws Exception {
		
		//회원번호 저장
		Long num = memMapper.getSeq();	
		mem.setMemNum(num);
		System.out.println("num에 뭐담김?" + num );
		mem.setMemPw(bCryptPasswordEncoder.encode(mem.getMemPw()));
		System.out.println(mem.getMemPw());
		
		log.info(mem.toString());
		
		Long result = memMapper.signup(mem);
		
		
		MultipartFile MF = mem.getMF();
		System.out.println(MF + "%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		if(!MF.isEmpty()) {
			//원래 이름 -> db에 저장
			//변경된 이름 -> db에 저장
			//서비스 레이어에서 작업하도록
 			String changName = System.currentTimeMillis() + "_" + MF.getOriginalFilename();
 			mem.setChangeName(changName);
 			System.out.println(changName + "$$$$$$$$$$$$$$$$$$$$$$$$$$$");
 			//사이즈, 타입 
 			System.out.println("=============");
 			System.out.println(MF.getOriginalFilename());
 			System.out.println(MF.getSize());
 			System.out.println(MF.getContentType());
 			System.out.println("=============");
 			
 			String path = req.getServletContext().getRealPath("/resources/upload/profile/");
 			System.out.println(path);
 			//파일을 서버에 저장
 			//getRealPath == /srpingshopping/src/main/webapp
 			File file = new File(path + changName);
 			System.out.println(file);
 			MF.transferTo(file);
 			
 			memMapper.insertProfile(mem);
 			
		}
		authMapper.authInsert(num);
		return result;
	}
	
		

	@Override
	public boolean update(Member mem) {
		System.out.println("멤버가 가져와지나요?" + mem);
		String rawPw = mem.getMemPw();
		mem.setMemPw(bCryptPasswordEncoder.encode(rawPw));
		boolean modifyMember = memMapper.update(mem) == 1;
		System.out.println("시발련아 boolean실행하냐?");
		return modifyMember;
	}

	@Override
	public boolean deleteMember(Long memNum) {
		System.out.println("회원 절.단.!!");
		return memMapper.deleteMember(memNum) == 1;
	}

	@Override
	public Member MemInfo(Long memNum) {
		System.out.println("회원의 정보가져와지나??" + memMapper.read(memNum));
		return memMapper.read(memNum);
	}

	@Override
	public Member updateMember(Member mem) {
		if(mem.getMemPw().length()>0) {
			mem.setMemPw(bCryptPasswordEncoder.encode(mem.getMemPw()));
		}
		int result = memMapper.update(mem);
		Member m = null;
		if(result > 0) {
			m = memMapper.getMember(mem);
		}
		return m;
	}



	
	
	
}
