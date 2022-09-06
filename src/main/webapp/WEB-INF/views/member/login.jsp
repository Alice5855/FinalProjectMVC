<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div id="div-main">
		<h1>로그인 페이지</h1>
	
		<form action = "login" method = "post">
	        아이디 : <input type = "text" name = "memEmail"/><br>
	        비밀번호 : <input type = "password" name = "memPw"/><br>
	        <input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
	        <input type = "submit" value ="로그인"/>
	    </form>
		
		<a href="join">회원가입</a>
	</div>
</body>