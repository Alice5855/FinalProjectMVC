package com.spring.market.security.service;

import javax.servlet.http.HttpServletRequest;

import com.spring.market.security.model.Member;

public interface MemberService {
	
	
	public Long signup(Member mem, HttpServletRequest req) throws Exception;
	
	public boolean update(Member mem);
	
	public boolean deleteMember(Long memNum);
	
	public Member MemInfo(Long memNum);
	
	public Member login(Member mem);
	
	public Member updateMember(Member mem);
	
}
