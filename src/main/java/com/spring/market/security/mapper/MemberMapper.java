package com.spring.market.security.mapper;

import com.spring.market.security.model.Member;

public interface MemberMapper {
	
	public Long getSeq();
	
	public Long signup(Member mem);
	
	public Member read(Long memNum);
	
	public Member getMember(long pf);
	
	public int deleteMember(Long memNum);
	
	public int update(Member mem);
	
	public Member findByMemberEmail(String memEmail);
	
	public void insertProfile(Member mem);
	
	public int changeProfile(Member mem);
	
	
	
}
