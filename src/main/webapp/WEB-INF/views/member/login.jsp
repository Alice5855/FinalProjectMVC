<style>
html {
	height: 100%;
}

body {
	margin: 0;
	padding: 0;
	font-family: sans-serif;
}

footer {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 97%;
}

.login-box {
	width: 50%;
	padding: 2%;
	margin: auto;
	box-sizing: border-box;
	box-shadow: 15px 10px 0 0 rgba(0, 0, 0, .4);
	border: 2px solid black;
	border-radius: 10px;
}

.login-box h2 {
	margin: 0 0 30px;
	padding: 0;
	font-weight: bold;
	color: #000;
	text-align: center;
}

.login-box .user-box {
	position: relative;
}

.login-box .user-box input {
	width: 60%;
	margin-left: 21%;
	padding: 1% 0;
	font-size: 16px;
	margin-bottom: 3%;
	border: 2px solid black;
	border-radius: 10px;
	background: transparent;
}

.login-box .user-box label {
	position: absolute;
	top: 0;
	margin-left: -59%;
	padding: 1% 0;
	font-size: 16px;
	pointer-events: none;
	transition: .5s;
}

.login-box .user-box input:focus ~ label, .login-box .user-box input:valid 
	~ label {
	margin-top: -3%;
	margin-left: -60%;
	font-size: 12px;
}

.checkbox {
	display: flex;
	margin-left: 15%;
	padding: 0;
	justify-content: space-around;
}

.joinus a {
	margin-right: 15%;
}

.login-box .login input {
	border: 2px solid black;
	border-radius: 10px;
	background: none;
	margin-top: 3%;
	margin-left: 26%;
	width: 50%;
	height: 5%;
}

@media screen and (max-width: 1920px) {
	.login-box {
		padding: 2%;
		margin-top: 4%;
	}
}

@media screen and (max-width: 1440px) {
	.login-box {
		padding: 2%;
		margin-top: 8%;
	}
}

@media screen and (max-width: 768px) {
	.login-box {
		width: 80%;
		padding: 2%;
		margin-top: 13%;
	}
}

@media
screen
and
(max-width:
425px)
{
.login-box .user-box input:focus ~ label, .login-box .user-box input:valid 
	~ label {
	display: none;
}

.login-box {
	width: 100%;
	padding: 2%;
	margin-top: 30%;
}

.checkbox {
	margin-left: 20%;
	font-size: 13px;
}

.joinus a {
	margin-right: 23%;
}

}
@media
screen
and
(max-width:
375px)
{
.checkbox {
	font-size: 11px;
}

.login-box .user-box input:focus ~ label, .login-box .user-box input:valid 
	~ label {
	display: none;
}

.login-box {
	width: 100%;
	padding: 2%;
	margin-top: 16%;
}
}
</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="login-box">
	<div class="contain-box">
		<h2>Login</h2>
		<form action="/member/login" method="post">
			<div class="user-box">
				<input type="text" name="memEmail" required=""> <label>UserEmail</label>
			</div>
			<div class="user-box">
				<input type="password" name="memPw" required=""> <label>Password</label>
			</div>
			<div class="checkbox joinus">
				<label> <input name="remember-me" type="checkbox" />
					로그인 유지
				</label> <span></span> <span></span> <a href="/member/join">아직 회원이
					아니신가요?</a>
			</div>
			<div class="login">
				<input type="submit" value="로그인" />
			</div>
		</form>
	</div>
</div>
<%@ include file="../includes//footer.jsp"%>