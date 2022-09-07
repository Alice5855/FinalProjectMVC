package com.spring.market.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.market.security.mapper.MemberMapper;
import com.spring.market.security.model.Member;

import lombok.Setter;

public class CustomDetailService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper MemberMapper;


	@Override
	public UserDetails loadUserByUsername(String memEmail) throws UsernameNotFoundException {
		System.out.println("loadUserByusername 실행함?? " + memEmail);
		Member mem = MemberMapper.findByMemberEmail(memEmail);
		
		if(mem == null) {
			throw new UsernameNotFoundException(mem.getMemEmail().toString());
		}
				
		System.out.println("mem에 뭐가 담기나요??" + mem);
		return mem;
	}
	
	
	

}
