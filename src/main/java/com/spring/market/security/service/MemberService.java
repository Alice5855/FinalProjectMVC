package com.spring.market.security.service;

import com.spring.market.security.model.Member;

public interface MemberService {
	
	public void signup(Member mem);
	
	public boolean update(Member mem);
	
	public boolean deleteMember(Long memNum);
	
	public Member MemInfo(String memNickname);
	
}
