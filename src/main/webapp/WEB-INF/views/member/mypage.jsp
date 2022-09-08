<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<div id="div-main">
		<h1>마이페이지</h1>
		
		<form action = "/member/mypage" method = "post" enctype="multipart/form-data">
	        <input type = hidden name = "userNo" value="${loginMember.memNum}" readonly="readonly"/><br>
			이메일 : <input type = "Email" name = "memEmail" value="${loginMember.memEmail}"/><br>
	     	비밀번호 : <input type = "password" name = "memPw" value="${loginMember.memPw}"/><br>
			닉네임 : <input type = "text" name = "memNickname" value="${loginMember.memNickname}"/><br>
			핸드폰 : <input type = "text"  name = "memPh" value="${loginMember.memPh}"/><br>
			성별 : <input type = "text" name="memGender" value="${loginMember.memGender}"><br>
			주소 : <br />
				 <input type="text" id="address_kakao" name="memAd" value="${loginMember.memAd}"/>
				 <input id="Address_box" name="memAd" placeholder="상세 주소" value="${loginMember.memAddetail}">
	        사진 : <input type = "file" name = "MF" multiple="multiple" accept=".jpg, .png"/><br>
	        <img id="profileImg"><br><hr>
	        <div id="div-preview">
	        </div>
	        <input type = "submit" value ="수정하기"/>
	    </form>
	</div>
</body>