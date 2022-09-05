package com.spring.market.security.mapper;

import com.spring.market.security.model.Member;

public interface MemberMapper {
	
	public void signup(Member mem);
	
	public Member read(Long memNum);
	
	public int deleteMember(Long memNum);
	
	public int update(Member mem);
	
	public Member findByMemberEmail(String memEmail);
	
	
	
	
	
}
