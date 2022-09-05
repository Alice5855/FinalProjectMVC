package com.spring.market.security.mapper;

import java.util.List;

import com.spring.market.security.model.Member;

public interface MemberMapper {
	
	public void signup(Member mem);
	
	public Member read(String memNickname);
	
	public int deleteMember(Long memNum);
	
	public int update(Member mem);
	
	
	
}
