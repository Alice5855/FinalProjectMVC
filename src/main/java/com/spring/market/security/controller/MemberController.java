package com.spring.market.security.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.market.security.model.Member;
import com.spring.market.security.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

		@Autowired
		private MemberService service;
		
		
		
		@GetMapping("login")
		public String login() {
			return "member/login";
		}
		
		@PostMapping("login")
		public String login(Member member, HttpSession session) throws Exception{
			Member loginMember = service.login(member);
			System.out.println(loginMember + "여기에 뭐 들어가나요?");
			if(loginMember != null) {
				//success -> session에 담기 -> home
				session.setAttribute("loginMember", loginMember);
				return "redirect:/";
			}else {
				//fail -> login
				return "member/login";
			}
		}
		
		@GetMapping("join")
		public String join() {
			return "member/join";
		}
		
		
		
		@PostMapping("join")
		public String join(Member mem, HttpServletRequest req) throws Exception{
			System.out.println("실행하나요?");
			System.out.println(mem);
			
			Long result = service.signup(mem, req);
			if(result > 0) {
				return "redirect:/member/login";
			}else {
				return "redirect:/member/join";
			}
			
		}
		
		@GetMapping("mypage")
		public String mypage(HttpSession session, HttpServletRequest req) {
			

			return "member/mypage";
		}
		
		@PostMapping("mypage")
		public String mypage(Member member, HttpSession session) throws Exception{
			//update 처리하기
			Member mem = service.updateMember(member);
			if(mem != null) {
				session.setAttribute("loginMember", mem);
				return "redirect:/member/mypage";
			}else {
				return "redirect:/member/mypagez";
			}
		}
		
	
		
	
	
}
