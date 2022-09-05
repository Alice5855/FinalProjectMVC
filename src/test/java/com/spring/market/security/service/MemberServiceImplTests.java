package com.spring.market.security.service;


import static org.junit.Assert.*;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.market.security.model.Member;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberServiceImplTests {
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService ms;
	
	
	
//	@Test
//	public void testsignup() {
//		System.out.println("회원가입 테스트");
//		Member mem = new Member();
//		System.out.println("Memeber 객체 생성됨?" + mem);
//		mem.setMemName("666");
//		mem.setMemEmail("666@naver.com");
//		mem.setMemNickname("666");
//		mem.setMemPw("666");
//		mem.setMemAd("어쩌라구");
//		mem.setMemPh("010-2661-9397");
//		mem.setMemPimg("회원사진 이쿠죠");
//		mem.setMemGender("전투 헬리콥터!");
//		
//		System.out.println("멤버의 네임을 가져와짐??" + mem.getMemName());
//	 	ms.signup(mem);
//		System.out.println("mem 에 뭐담김??" + mem);
//	}

//	@Test
//	public void testUpdate() {
//		Member mem = ms.MemInfo(4L);
//		System.out.println("mem가 담기나요?" + mem);
//		if(mem == null) {
//			System.out.println("멤버가없어요?");
//			return;
//		}else {
//			mem.setMemAd("주소 수정합니다");
//		}
//		System.out.println("수정값보여주세요" + ms.update(mem));
//	}
//
//	@Test
//	public void testDeleteMember() {
//		try {
//			ms.deleteMember(5L);
//		} catch (Exception e) {
//			fail(e.getMessage());
//		} 
//	}

//	@Test
//	public void testMemInfo() {
//		fail("Not yet implemented");
//	}

}
