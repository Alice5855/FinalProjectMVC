<style>
html {
  height: 100%;
}
body {
  margin:0;
  padding:0;
  font-family: sans-serif;
}

.login-box {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 650px;
  padding: 40px;
  transform: translate(-50%, -50%);
  box-sizing: border-box;
  box-shadow: 15px 10px 0 0 rgba(0,0,0,.4);
  border : 2px solid black;
  border-radius: 10px;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  font-weight : bold;
  color: #000;
  text-align: center;
}

.login-box .user-box {
  position: relative;
}

.login-box .user-box input {
  width: 60%;
  margin-left : 120px;
  padding: 10px 0;
  font-size: 16px;
  margin-bottom: 30px;
  border : 2px solid black;
  border-radius: 10px;
  background: transparent;
}
.login-box .user-box label {
  position: absolute;
  top:0;
  left: 125px;
  padding: 10px 0;
  font-size: 16px;
  pointer-events: none;
  transition: .5s;
}

.login-box .user-box input:focus ~ label,
.login-box .user-box input:valid ~ label {
  top: -35px;
  left: 120px;
  font-size: 12px;
}


.checkbox{
	margin-left : 120px;
	padding : 0;
	
}

.login-box .login input {
  
  border : 2px solid black;
  border-radius: 10px;
  background : none;
  margin-top : 30px;
  margin-left : 150px;
  width: 50%;
  height: 50px;
}

</style>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="../includes/header.jsp" %> 
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<div class="login-box">
 		 <h2>Login</h2>
 	 <form action="/member/login" method = "post">
    	<div class="user-box" >
     	 	<input type="text" name="memEmail" required="">
     	 	<label>UserEmail</label>
   		</div>
    	<div class="user-box">
      		<input type="password" name="memPw" required="">
      		<label>Password</label>
    		</div>
    	<div class="checkbox">
			<label> <input name="remember-me" type="checkbox" /> Remember Me</label>
		</div>
		<div class="login">
    		<input type="submit" value="로그인" />
		</div>
 	</form>
	</div>
    
    
    
    
    
<!-- 	<div id="div-main"> -->
<!-- 		<h1>로그인 페이지</h1> -->
	
<!-- 		<form action = "/member/login" method = "post"> -->
<!-- 	        아이디 : <input type = "text" name = "memEmail"/><br> -->
<!-- 	        비밀번호 : <input type = "password" name = "memPw"/><br> -->
<!-- 		<div class="checkbox"> -->
<!-- 				<label> <input name="remember-me" type="checkbox">Remember Me</label> -->
<!-- 		</div> -->
<!-- 	        <input type = "submit" value ="로그인"/> -->
<!-- 	    </form> -->
		
<!-- 		<a href="join">회원가입</a> -->
<!-- 	</div> -->
</body>
