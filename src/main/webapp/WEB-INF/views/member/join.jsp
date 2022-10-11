<style>
#preview img {
	overflow: hidden;
}

.h3mid{
	align-content: center;
}


.container{
	border: 2px solid black;
	border-radius: 1%;
	box-sizing: border-box;
	box-shadow: 15px 10px 0 0 rgba(0, 0, 0, .4);
}
</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<h3 class="mb-3 h3mid" >회원가입</h3>
			<form class="validation-form" novalidate action="/member/join"
				method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-6 mb-3">
						<div id="preview"></div>
						<label for="profile">프로필사진</label> 
						<input type="file" class="form-control" id="profile" name="MF" accept=".jpg, .png" required>
						<div class="invalid-feedback">사진은 150px로해주세요</div>
					</div>
					<div class="mb-3">
						<label for="name">이메일</label> 
						<input type="email" class="form-control" id="email" name="memEmail" placeholder="you@example.com" required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="nickname">패스워드</label> 
						<input type="password" class="form-control" id="password" name="memPw"  required>
						<div class="invalid-feedback">패스워드를 입력해주세요.</div>
					</div>
				</div>

				<div class="mb-3">
					<label for="nickname">닉네임</label> 
					<input type="text" class="form-control" id="nickname" name="memNickname" required>
					<div class="invalid-feedback">닉네임을 입력해주세요</div>
				</div>

				<div class="mb-3">
					<label for="name">성함</label> <input type="text"
						class="form-control" id="name" name="memName" placeholder="실명을 입력하세요" required>
					<div class="invalid-feedback">성함을 입력해주세요.</div>
				</div>

				<div class="mb-3">
					<label for="telephone">핸드폰</label> 
					<input type="text" name= "memPh" class="form-control" id="telephone"
						placeholder="-빼고 입력해주세요" required>
				</div>
				
				<div class="mb-3">
					<label for="Gender">성별</label> 
					<input type="text" name= "memGender" class="form-control" id="gender"
						placeholder="원하시는 성별을 입력해주세요" required>
				</div>
				
				<div class="mb-3">
					<label for="address">주소</label> 
					<input type="text" name= "memAd" class="form-control" id="address_kakao" required>
				</div>
				<div class="mb-3">
					<label for="address2">상세주소</label> 
					<input type="text" name= "memAddetail" class="form-control" id="Address_box" placeholder="상세주소 입력해주세요" required>
				</div>
				

				<div class="mb-4 justfy-content-end"></div>
				<button class="btn btn-success btn-lg btn-block " type="submit">가입
					완료</button>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	let fileTag = document.querySelector("input[name=MF]");
	let divPreview = document.querySelector("#preview");
	fileTag.onchange = function() {

		//파일 올렸을 때 : fileTag.files.length > 0
		if (fileTag.files.length > 0) {
			//이미지 src에 들어갈 데이터 구하기
			for (let i = 0; i < fileTag.files.length; i++) {
				let reader = new FileReader();
				reader.onload = function(data) {
					let src = data.target.result;
					//이미지 태그를 만들어서 넣어줄거임
					//1. 이미지 태그 만들기
					let imgTag = document.createElement('img');

					//2. 이미지 태그 속성들 세팅하기
					imgTag.setAttribute('src', src);
					imgTag.setAttribute('width', '150');
					imgTag.setAttribute('height', '150');
					imgTag.setAttribute('class', 'rounded-circle');

					//3. 이미지 태그 div안에 넣기
					divPreview.appendChild(imgTag);
				}
				reader.readAsDataURL(fileTag.files[i]);

			}//for end

		} else {
			//취소 버튼을 눌렀을 때
			//div 안에 싹 다 비우기
			divPreview.innerHTML = "";
		}
	}
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	window.onload = function() {
		document
				.getElementById("address_kakao")
				.addEventListener(
						"click",
						function() { //주소입력칸을 클릭하면
							//카카오 지도 발생
							new daum.Postcode(
									{
										oncomplete : function(data) { //선택시 입력값 세팅
											document
													.getElementById("address_kakao").value = data.address; // 주소 넣기
											document.querySelector(
													"input[name=memAddetail]")
													.focus(); //상세입력 포커싱
										}
									}).open();
						});
	}
</script>
<%@include file="../includes/footer.jsp"%>


<!-- <div class="container"> -->
<!-- 	<div class="input-form col-md-12 mx-auto"> -->
<!-- 		<div class="col-md-5 col-lg-4 order-md-last"> -->
<!-- 		<h2 class="mb-3">회원가입 페이지</h2> -->
<!-- 		<form action="/member/join" method="post" enctype="multipart/form-data" class="validation-form"> -->
<!-- 			<div id="preview"> -->
<!-- 			</div> -->
<!-- 			<div class="row"> -->
<!-- 				<ul class="list-group mb-3"> -->
<!-- 					<li class="list-group-item d-flex justify-content-between lh-sm"> -->
<!-- 						프로필사진  -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<input type="file" name="MF" accept=".jpg, .png" /><br> -->
<!-- 							<img id="profileImg"> -->
<!-- 					</li> -->
<!-- 					<li class=""> -->
<!-- 						이메일  -->
<!-- 					</li> -->
<!-- 					<li class="input-group-text"> -->
<!-- 						<input type="Email" name="memEmail" /> -->
<!-- 					</li> -->
<!-- 					<li class="list-group-item d-flex justify-content-between lh-sm"> -->
<!-- 						비밀번호  -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<input type="password" name="memPw" /> -->
<!-- 					</li> -->
<!-- 					<li class="list-group-item d-flex justify-content-between lh-sm"> -->
<!-- 						성함  -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<input type="text" name="memName" /> -->
<!-- 					</li> -->
<!-- 					<li class="list-group-item d-flex justify-content-between lh-sm"> -->
<!-- 						닉네임  -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<input type="text" name="memNickname" /> -->
<!-- 					</li> -->
<!-- 					<li class="list-group-item d-flex justify-content-between lh-sm"> -->
<!-- 						핸드폰  -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<input type="text" name="memPh" /> -->
<!-- 					</li> -->
<!-- 					<li class="list-group-item d-flex justify-content-between lh-sm"> -->
<!-- 						성별  -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<input type="text" name="memGender" /> -->
<!-- 					</li> -->
<!-- 					<li class="list-group-item d-flex justify-content-between lh-sm"> -->
<!-- 						주소  -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<input type="text" id="address_kakao" name="memAd" /> -->
<!-- 					</li> -->
<!-- 					<li class="list-group-item d-flex justify-content-between lh-sm"> -->
<!-- 						상세주소  -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<input id="Address_box" name="memAddetail" -->
<!-- 							placeholder="상세 주소"> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<button type="submit">회원가입</button> -->
<!-- 					</li>					 -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</form> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
