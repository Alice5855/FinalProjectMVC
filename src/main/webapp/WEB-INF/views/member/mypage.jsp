<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="../includes/header.jsp" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<div id="div-main">
		<h1>마이페이지</h1>
		
		<form action = "/member/mypage" method = "post" enctype="multipart/form-data">
			<input type = hidden name = "memNum" value="${loginMember.memNum}" readonly="readonly"/><br>
			이메일 : <input type = "Email" name = "memEmail" value="${loginMember.memEmail}"/><br>
	     	비밀번호 : <input type = "password" name = "memPw" /><br>
	     	성함 : <input type = "text" name = "memName" value="${loginMember.memName}"/><br>
			닉네임 : <input type = "text" name = "memNickname" value="${loginMember.memNickname}"/><br>
			핸드폰 : <input type = "text"  name = "memPh" value="${loginMember.memPh}"/><br>
			성별 : <input type = "text" name="memGender" value="${loginMember.memGender}"><br>
			주소 : <br />
				  <input type="text" id="address_kakao" name="memAd" value="${loginMember.memAd}"/>
				  <input id="Address_box" name="memAddetail" placeholder="상세 주소" value="${loginMember.memAddetail}">
	     	사진 : <input type = "file" name = "MF" multiple="multiple" accept=".jpg, .png"/><br>
	       		  <img id="profileIm" src=""><br><hr>
	        	  <div id="div-preview">
	        	  		<img class="pf" src="/resources/upload/profile/${profile.changeName}" width="100" height="100">
	        	  </div>
	        <input type = "submit" value ="수정하기"/>
	    </form>
	</div>
</body>

    <%@ include file="../includes//footer.jsp" %>

	<script type="text/javascript">
	
	
		let fileTag = document.querySelector("input[name=MF]");
		let divPreview = document.querySelector("#div-preview");
		fileTag.onchange = function(){
				$('.pf').remove();
			
			//파일 올렸을 때 : fileTag.files.length > 0
			if(fileTag.files.length>0){
				//이미지 src에 들어갈 데이터 구하기
				for(let i=0; i<fileTag.files.length; i++){
					let reader = new FileReader();
					reader.onload = function(data){
						let src = data.target.result;
						//이미지 태그를 만들어서 넣어줄거임
						//1. 이미지 태그 만들기
						let imgTag = document.createElement('img');
						
						//2. 이미지 태그 속성들 세팅하기
						imgTag.setAttribute('src', src);
						imgTag.setAttribute('width', '100');
						imgTag.setAttribute('height', '100');
						
						//3. 이미지 태그 div안에 넣기
						divPreview.appendChild(imgTag);
					}
					reader.readAsDataURL(fileTag.files[i]);
					
				}//for end
				
			}else{
			//취소 버튼을 눌렀을 때
				//div 안에 싹 다 비우기
				divPreview.innerHTML = "";
			}
		}
		</script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=memAddetail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
    </script>