package com.spring.market.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.market.security.mapper.AuthMapper;
import com.spring.market.security.mapper.MemberMapper;
import com.spring.market.security.model.Member;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = {@Autowired})
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private MemberMapper memMapper;
	private AuthMapper authMapper;
	
	
	public void signup(Member mem) {
		System.out.println("Member ***" + mem);
		String rawPw = mem.getMemPw();
		System.out.println(rawPw + "============");
		mem.setMemPw(bCryptPasswordEncoder.encode(rawPw));
		System.out.println(bCryptPasswordEncoder.encode(rawPw));
		memMapper.signup(mem);
		
		try {
			System.out.println("try캐치문실행하나요?");
			authMapper.authInsert(mem.getMemNum());
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
	
	
}
