<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Welcome to AniBucket</title>
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<!-- Common colors & fonts -->
	<link href="/resources/css/common.css" rel="stylesheet">
	<!-- Bootstrap JS -->
	<!--
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
	-->
	<!-- Bootstrap Bundle -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<style>
		body {
			margin: 0;
			font-family: 'IBM Plex Sans KR', sans-serif;
		}
		.font2 {
			font-family: 'Do Hyeon', sans-serif;
		}
		.font3 {
			font-family: 'Rubik', sans-serif;
			cursor: default;
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
		.btn-outline-primaryc {
		    --bs-btn-color: #4C51BD;
		    --bs-btn-border-color: #4C51BD;
		    --bs-btn-hover-color: #4C51BD;
		    --bs-btn-hover-bg: #FCE73C;
		    --bs-btn-hover-border-color: #FCE73C;
		    --bs-btn-focus-shadow-rgb: 33,37,41;
		    --bs-btn-active-color: #4C51BD;
		    --bs-btn-active-bg: #FCE73C;
		    --bs-btn-active-border-color: #FCE73C;
		    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
		    --bs-btn-disabled-color: #4C51BD;
		    --bs-btn-disabled-bg: transparent;
		    --bs-btn-disabled-border-color: #4C51BD;
		    --bs-gradient: none;
		}
		.counter {
			background-color: #4C51BD;
			color: #FCE73C;
		}
		.topbar{
			z-index: 1031;
		}
		.filler {
			display: block;
			width: 80%;
			/* gotta change if you wanna use nav-link */
		}
		.nav-text {
			color: #738DD0;
		}
		.nav-text:focus, .nav-text:hover {
			color: #4C51BD;
		}
		.ddmenu:focus, .ddmenu:hover {
			background-color: rgba(255,255,255,0.7) !important;
		}
		@media screen and (max-width: 869px) {
			.footerlogo {
				margin-right: unset !important;
				width: unset;
			}
			.footerul {
				width: unset;
			}
		}
		@media screen and (max-width: 652px) {
			.footercopy {
				width: 100%;			
			}
			.footerlogo {
				width: 100%;
			}
			.footerul {
				width: 100%;
			}
		}
		@media screen and (max-width: 321px) {
			.footerul li a {
				font-size: 0.9rem;
			}
		}
		@media screen and (max-width: 1394px) {
			.btnwrapper {
				width: 18%;
			}
		}
		@media screen and (max-width: 768px) {
			.btnwrapper {
				width: 50%;
			}
		}
    </style>
</head>
<body>

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg topbar bg-light">
	    <div class="container-fluid px-4">
	        <a class="navbar-brand" href="/">
	        	<img class="img-fluid" alt="Logo" src="/resources/imgs/Temp.png" width="60px">
	        </a>
        	<h4 class="mt-1 fw-bolder font3">AniBucket</h4>
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
	                        	<li><a class="dropdown-item" href="/member/login">로그인</a></li>
	                        </sec:authorize>
	                        <sec:authorize access="isAuthenticated()">
	                        	<li><a class="dropdown-item" href="/member/mypage">My page</a></li>
	                        </sec:authorize>
	                        <sec:authorize access="isAuthenticated()">
	                        	<li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>
	                        </sec:authorize>
	                        <sec:authorize access="isAnonymous()">
	                        	<li><a class="dropdown-item" href="/member/join">회원가입</a></li>
	                        </sec:authorize>
	                        <sec:authorize access="hasRole('ROLE_ADMIN')">
	                        	<li><a class="dropdown-item" href="/product/list">상품목록</a></li>
	                        	<li><a class="dropdown-item" href="/product/register">상품등록</a></li>
	                        </sec:authorize>
	                    </ul>
	                </li>
	            </ul>
	            <div class="d-flex ms-3 btnwrapper">
	                <button class="btn btn-outline-primaryc" type="submit" onclick="location.href='/bucket'">
	                    <i class="bi-cart-fill me-1"></i>
						<span class="bucket">장동이</span>
	                    <span class="badge ms-1 rounded-pill counter">0</span>
	                </button>
	            </div>
	        </div>
	    </div>
	</nav>
	
	<!-- fixed transparent navigation -->
	<nav class="navbar navbar-expand-lg fixbar fixed-top" style="background-color: rgba(255,255,255,0.8);">
	    <div class="container-fluid px-4">
	        <a class="navbar-brand" href="/">
	        	<img class="img-fluid" alt="Logo" src="/resources/imgs/Temp2.png" width="60px">
	        </a>
	        <h4 class="mt-1 fw-bolder font3">AniBucket</h4>
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
	                        	<li><a class="dropdown-item" href="/member/login">로그인</a></li>
	                        </sec:authorize>
	                        <sec:authorize access="isAuthenticated()">
	                        	<li><a class="dropdown-item" href="/member/mypage">My page</a></li>
	                        </sec:authorize>
	                        <sec:authorize access="isAuthenticated()">
	                        	<li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>
	                        </sec:authorize>
	                        <sec:authorize access="isAnonymous()">
	                        	<li><a class="dropdown-item" href="/member/join">회원가입</a></li>
	                        </sec:authorize>
	                        <sec:authorize access="hasRole('ROLE_ADMIN')"> 
	                        	<li><a class="dropdown-item" href="/product/list">상품목록</a></li>
	                        	<li><a class="dropdown-item" href="/product/register">상품등록</a></li>
	                        </sec:authorize>
	                    </ul>
	                </li>
	            </ul>
	            <div class="d-flex ms-3 btnwrapper">
	                <button class="btn btn-outline-primaryc" type="submit" onclick="location.href='/bucket'">
	                    <i class="bi-cart-fill me-1"></i>
						<span class="bucket2">장동이</span>
	                    <span class="badge ms-1 rounded-pill counter">0</span>
	                </button>
	            </div>
	        </div>
	    </div>
	</nav>
	
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script type="text/javascript">
	var topbar = $(".topbar");
	var fixbar = $(".fixbar");
	$(window).on("scroll", function(e) {
		if ($(this).scrollTop() < 1) {
			topbar.css('opacity', '1');
			fixbar.css('display', 'none');
		} else {
			topbar.css('opacity', '0');
			fixbar.css('display', 'flex');
		}
	});
</script>