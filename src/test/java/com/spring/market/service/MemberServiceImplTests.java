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
	
	
	
	@Test
	public void testsignup() {
		System.out.println("회원가입시작");
		Member mem = new Member();
		System.out.println("Memeber 맴버 담겨짐?" + mem);
		mem.setMemName("김q춘식");
		mem.setMemEmail("ki2mchunsic@naver.com");
		mem.setMemNickname("ki2mchunsic");
		mem.setMemPw("ki2mchunsic");
		mem.setMemAd("어쩌라구");
		mem.setMemPh("010-2661-9397");
		mem.setMemPimg("프로필사진담는다");
		mem.setMemGender("전투헬리콥터!!!");
		
		System.out.println("이름가져와짐? ?" + mem.getMemName());
	 	ms.signup(mem);
		System.out.println("mem 회원가입이됨?" + mem);
	}
//
//	public void testUpdate() {
//		Member mem = ms.MemInfo("kimchunsic");
//		System.out.println("mem에 뭐담김?" + mem);
//		if(mem == null) {
//			System.out.println("널임?");
//			return;
//		}else {
//			mem.setMemAd("주소바꿉니다");
//		}
//		System.out.println("수덩결과좀 보여주세요" + ms.update(mem));
//	}
//
//	public void testDeleteMember() {
//		try {
//			ms.deleteMember(4L);
//		} catch (Exception e) {
//			fail(e.getMessage());
//		} 
//	}
//
//	public void testMemInfo() {
//		fail("Not yet implemented");
//	}

}
