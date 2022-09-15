<style>
body {
  margin:0;
  padding:0;
  font-family: sans-serif;
}

footer{
	position: fixed;
	left: 0;
	bottom: 0;
	width: 97%;
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



@media screen and (max-width: 425px) {
   
   footer{
      position: absolute;
      bottom: 0;
   }

   .login-box {
      top: 45%;
        width: 100%;
        padding: 20px;
        box-sizing: border-box;
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
	  width: 90%;
	  padding: 10px 5px;
	  margin-left : 20px;
	  font-size: 16px;
	  margin-bottom: 25px;
	  border : 2px solid black;
	  border-radius: 10px;
	  background: transparent;
	}
	.login-box .user-box label {
	  padding: 12px 0;
	  font-size: 16px;
	  pointer-events: none;
	  left: 25px;
	  transition: .5s;
	}
	
	.login-box .user-box input:focus ~ label,
	.login-box .user-box input:valid ~ label {
	  font-size: 12px;
	  left: 20px;
	  top: -35px;
	}
	
	
	.checkbox{
	   padding : 0;
	   margin-left : 40px;
	   
	}
	
	.login-box .login input {
	  
	  border : 2px solid black;
	  border-radius: 10px;
	  background : none;
	  margin-top : 30px;
	  margin-left : 70px;
	  width: 65%;
	  height: 50px;
	}
}

@media screen and (max-width: 375px) {
   .login-box{
      top: 42%;
       width: 100%;
       padding: 0px;
       box-sizing: border-box;
       border: 2px solid black;
       border-radius: 10px;
   }
}
</style>

   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@include file="../includes/header.jsp" %> 
   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <div class="login-box">
      <div class="contain-box">
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
             <div class="checkbox joinus">
               <label> <input name="remember-me" type="checkbox" /> Remember Me         </label>
               <span></span>
               <span></span>
               <a href="/member/join">아직 회원이 아니신가요?</a>
            </div>
            <div class="login">
                <input type="submit" value="로그인" />
            </div>
          </form>
      </div>
   </div>
<%@ include file="../includes/footer.jsp" %>