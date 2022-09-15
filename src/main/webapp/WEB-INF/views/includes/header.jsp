<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Welcome to AniBucket</title>
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<!-- Bootstrap JS -->
	<!--
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
	-->
	<!-- Bootstrap Bundle -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	
	<style>
		/* https://fonts.google.com/specimen/Do+Hyeon?subset=korean (OFL) */
		/* 'Do Hyeon', sans-serif; */
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
		/* https://fonts.google.com/specimen/IBM+Plex+Sans+KR?subset=korean (OFL) */
		/* 'IBM Plex Sans KR', sans-serif; */
		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400;700&display=swap');
		body {
			padding-bottom: 20px;
			font-family: 'IBM Plex Sans KR', sans-serif;
		}
		.font2 {
			font-family: 'Do Hyeon', sans-serif;
		}
		.navbar {
			margin-bottom: 20px;
		}
		.nav-scroller {
		  position: relative;
		  z-index: 2;
		  height: 2.75rem;
		  overflow-y: hidden;
		}
		.nav-scroller .nav {
			display: flex;
			flex-wrap: nowrap;
			padding-bottom: 1rem;
			margin-top: -1px;
			overflow-x: auto;
			text-align: center;
			white-space: nowrap;
			-webkit-overflow-scrolling: touch;
		}
		.btn-outline-primary {
		    --bs-btn-color: #FF7373;
		    --bs-btn-border-color: #FF7373;
		    --bs-btn-hover-color: #6FEDD6;
		    --bs-btn-hover-bg: #FF7373;
		    --bs-btn-hover-border-color: #FF7373;
		    --bs-btn-focus-shadow-rgb: 33,37,41;
		    --bs-btn-active-color: #6FEDD6;
		    --bs-btn-active-bg: #FF7373;
		    --bs-btn-active-border-color: #FF7373;
		    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
		    --bs-btn-disabled-color: #FF7373;
		    --bs-btn-disabled-bg: transparent;
		    --bs-btn-disabled-border-color: #FF7373;
		    --bs-gradient: none;
		}
		.topbar{
			z-index: 1031;
		}
		.btn-outline-primary2 {
		    --bs-btn-color: #FF7373;
		    --bs-btn-border-color: #FF7373;
		    --bs-btn-hover-color: #6FEDD6;
		    --bs-btn-hover-bg: #FF7373;
		    --bs-btn-hover-border-color: #FF7373;
		    --bs-btn-focus-shadow-rgb: 33,37,41;
		    --bs-btn-active-color: #6FEDD6;
		    --bs-btn-active-bg: #FF7373;
		    --bs-btn-active-border-color: #FF7373;
		    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
		    --bs-btn-disabled-color: #FF7373;
		    --bs-btn-disabled-bg: transparent;
		    --bs-btn-disabled-border-color: #FF7373;
		    --bs-gradient: none;
		}
		.filler {
			display: block;
			width: 80%;
			/* gotta change if you wanna use nav-link */
		}
		.nav-text {
			color: #FF4A4A;
		}
		.nav-text:focus, .nav-text:hover {
			color: #FF7373;
		}
		.ddmenu:focus, .ddmenu:hover {
			background-color: rgba(255,255,255,0.7) !important;
		}
    </style>
    
</head>
<body>

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg topbar bg-light">
	    <div class="container-fluid px-4">
	        <a class="navbar-brand" href="/">
	        	<img class="img-fluid" alt="Logo" src="/resources/imgs/AniBucket-1.png" width="90px">
	        </a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	        	<div class="filler"></div>
	            <ul class="navbar-nav mb-2 mb-lg-0 ms-lg-4 me-auto">
	            	<!--
	                <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">상품</a></li>
	                <li class="nav-item"><a class="nav-link" href="#!">장동이</a></li>
	                -->
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle nav-text" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">사용자</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                    <sec:authorize access="isAnonymous()">
		                        <li><a class="dropdown-item" href="${root}/member/login">로그인</a></li>
	                        </sec:authorize>
	                        <li><a class="dropdown-item" href="#!">로그아웃</a></li>
	                        <li><a class="dropdown-item" href="${root}/member/mypage">mypage</a></li>
	                        <li><hr class="dropdown-divider" /></li>
	                        <li><a class="dropdown-item" href="${root}/member/join">회원가입</a></li>
 	                        <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                        		<li><a class="dropdown-item" href="/product/register">상품등록</a></li>
                         	</sec:authorize> 
	                    </ul>
	                </li>
	            </ul>
	                <button class="btn btn-outline-primary" type="submit" onclick="location.href='/bucket'">
	                    <i class="bi-cart-fill me-1"></i>
						<span class="bucket">장동이</span>
	                    <span class="badge ms-1 rounded-pill" style="background-color: #6FEDD6; color: #FF4A4A;">0</span>
	                </button>
	        </div>
	    </div>
	</nav>
	
	<!-- fixed transparent navigation -->
	<nav class="navbar navbar-expand-lg fixed-top" style="background-color: rgba(255,255,255,0.8);">
	    <div class="container-fluid px-4">
	        <a class="navbar-brand" href="/">
	        	<img class="img-fluid" alt="Logo" src="/resources/imgs/AniBucket-1.png" width="80px">
	        </a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	        	<div class="filler"></div>
	            <ul class="navbar-nav mb-2 mb-lg-0 ms-lg-4 me-auto">
	            	<!--
	                <li class="nav-item"><a class="nav-link nav-text" aria-current="page" href="#!">상품</a></li>
	                <li class="nav-item"><a class="nav-link nav-text" href="#!">장동이</a></li>
	                -->
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle nav-text" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">사용자</a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: rgba(255,255,255,0.8);">
	                    
	                    <sec:authorize access="isAnonymous()">
	                        <li><a class="dropdown-item nav-text ddmenu" href="#!">로그인</a></li>
                        </sec:authorize>
	                        <li><a class="dropdown-item nav-text ddmenu" href="#!">로그아웃</a></li>
	                        <li><hr class="dropdown-divider" /></li>
	                        <li><a class="dropdown-item nav-text ddmenu" href="#!">회원가입</a></li>
	                        <sec:authorize access="hasRole('ROLE_ADMIN')"> 
	                        	<li><a class="dropdown-item" href="/product/register">상품등록</a></li>
	                        </sec:authorize>
	                    </ul>
	                </li>
	            </ul>
	                <button class="btn btn-outline-primary2" type="submit">
	                    <i class="bi-cart-fill me-1"></i>
						<span class="bucket2" onclick="location.href='/bucket'">장동이</span>
	                    <span class="badge ms-1 rounded-pill" style="background-color: #6FEDD6; color: #FF4A4A;">0</span>
	                </button>
	        </div>
	    </div>
	</nav>
	
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>