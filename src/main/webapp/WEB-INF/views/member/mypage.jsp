<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<div id="div-main">
		<h1>마이페이지</h1>
		
		<form action = "mypage" method = "post" enctype="multipart/form-data">
	        <input type = hidden name = "userNo" value="${loginMeber.memNum}"/><br>
			이메일 : <input type = "text" name = "memEmail" value="${loginMember.memEmail}"/><br>
	     	비밀번호 : <input type = "password" name = "memPw" value="${loginMember.memPw}"/><br>
			닉네임 : <input type = "text" name = "memNickname" value="${loginMember.memNickname}"/><br>
			핸드폰 : <input type = "text"  name = "memPh" value="${loginMember.memPh}"/><br>
			성별 : <input type = "text" name="memGender" value="${loginMember.memGender}"><br>
			주소 : <br />
				 <input type="text" id="address_kakao" name="memAd" value="${loginMember.memAd}"/>
				 <input id="Address_box" name="memAd" placeholder="상세 주소">
	        사진 : <input type = "file" name = "f" multiple="multiple" accept=".jpg, .png"/><br>
	        <img id="profileImg"><br><hr>
	        <div id="div-preview">
	        </div>
	        <input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />	
	        <input type = "submit" value ="수정하기"/>
	    </form>
	</div>
</body>