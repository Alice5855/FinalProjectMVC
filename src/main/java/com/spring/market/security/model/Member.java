package com.spring.market.security.model;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member implements UserDetails {

	private static final Long serialVesrionsUID = 1L;

	private Long memNum;
	private String memName;
	private String memEmail;
	private String memNickname;
	private String memPw;
	private String memPh;
	private String memAd;
	private String memAddetail;
	private String memGender;
	private String ChangeName;
	private MultipartFile MF;

	private Auth memAuth;

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(memAuth.getMemAuth()));
		return auth;
	}

	@Override
	public String getPassword() {
		return memPw;
	}

	public String getNickname() {
		return memNickname;
	}
	
	public Long getmemNum() {
		return memNum; 
	}
	
	
	@Override
	public String getUsername() {
		return memEmail;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
