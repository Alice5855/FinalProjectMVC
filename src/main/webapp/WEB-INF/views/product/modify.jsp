<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- taglib for Security authentication -->
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="context"><%=request.getContextPath()%></c:set>

<%@include file="../includes/header.jsp"%>

<style>
.card-img, .card-img-bottom, .card-img-top {
	width: 30%;
	height: 30%;
}

.uploadResult {
	width: 100%;
	background-color: #F5F5F5;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img.icon {
	width: 100px;
}

.uploadResult ul li img.thumbnail {
	width: 100px;
}

.uploadResult ul li img {
	cursor: pointer;
}

.btn-icon {
	margin-left: 5%;
}

.form-group {
	margin-bottom: 1rem;
	margin-top: 1rem;
}
</style>
<style>
.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.2);
	z-index: 9999;
	margin: 0;
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	/*overflow: hidden;*/
}

.bigPicture img {
	width: 600px;
	/*object-fit: contain;*/
	cursor: pointer;
}
</style>




<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">상품 수정</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<section class="py-5">
		<form role="form" action="${context}/product/modify" method="post">
			<input type='hidden' id='pageNum' name='pageNum'
				value='<c:out value="${cri.pageNum}"/>'> <input
				type='hidden' id='amount' name='amount'
				value='<c:out value="${cri.amount}"/>'>
			<!-- 319 page modify code from get.jsp 49, 50 row -->
			<input type='hidden' id='type' name='type'
				value='<c:out value="${cri.type}"/>'> <input type='hidden'
				id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="col-md-6">
						<div class="container-fluid py-3">
							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading">수정할 상품 이미지 등록</div>
										<!-- /.panel-heading -->
										<div class="panel-body">
											<div class="form-group uploadDiv">
												<input type="file" name='uploadFile' multiple>
											</div>

											<div class='uploadResult pd-img-wrapper card'>
												<ul>

												</ul>
											</div>
										</div>
										<!--  end panel-body -->
									</div>
									<!--  end panel-body -->
								</div>
								<!-- end panel -->
							</div>
						</div>
						<!-- Carousel -->
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>상품 번호</label> <input class="form-control" name='pdNum'
								value='<c:out value="${product.pdNum}" />' readonly="readonly">
						</div>
						<div class="form-group">
							<label>상품명</label> <input class="form-control" name='pdName'
								value='<c:out value="${product.pdName}" />'>
						</div>
						<div class="form-group">
							<label>상품 가격</label> <input class="form-control"
								type="number" name='pdPrice' style="resize: none;"
								value="${product.pdPrice}">
						</div>
						<div class="form-group">
							<label>상품 수량</label> <input class="form-control" name='pdStock'
								value='<c:out value="${product.pdStock}" />'>
						</div>
						<div class="form-group">
							<label>상품 키워드</label> <input class="form-control"
								type="text" name='pdKeyword' style="resize: none;"
								value="${product.pdKeyword}">
						</div>
						<div class="form-group">
							<label>등록일</label> <input class="form-control" name='pdRegDate'
								value='<fmt:formatDate pattern="yyyy/MM/dd" value="${product.pdRegDate}"/>'
								readonly="readonly">
						</div>
						<div class="pd-img-wrapper form-group">
							기존 상품 이미지 <img class="card-img-top"
								src="/product/display?fileName=${product.pdPath}"
								alt="product image" />

						</div>
						<input class="form-control" name='pdPath' type="hidden"
							value='${product.pdPath}'>
					</div>
				</div>
			</div>
		</form>
	</section>
</div>







<button type="submit" data-oper='modify' class="btn btn-secondary OperationButton">수정</button>
<button type="submit" data-oper='remove' class="btn btn-secondary OperationButton">삭제</button>

<button type="submit" data-oper='list' class="btn btn-info OperationButton">리스트</button>


<div class='bigPictureWrapper'>
	<div class='bigPicture'></div>
</div>

<!-- /.row -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");
	
		$('.OperationButton').on("click", function(e){

			e.preventDefault(); 
			
			var operation = $(this).data("oper");
			
			console.log("오퍼레이션이 뭔데요 ㅋㅋ" + operation);
			
			
			if(operation === 'remove'){
				formObj.attr("action", "/product/remove");
			
			} else if(operation === 'list'){
				//move to list
				formObj.attr("action", "/product/page").attr("method","get");
			  
			} else if(operation === 'modify'){
				
			    
				console.log("submit clicked");
				
				var str = "";
				
 				 $(".uploadResult ul li").each(function(i, obj){
					
 					var jobj = $(obj);
					
 					console.dir(jobj);
					
 					str += "<input type='hidden' name='attachList[" + i + "].b_fileName' value='" + jobj.data("filename") + "'>";
 					str += "<input type='hidden' name='attachList[" + i + "].b_uuid' value='" + jobj.data("uuid") + "'>";
 					str += "<input type='hidden' name='attachList[" + i + "].b_uploadPath' value='" + jobj.data("path") + "'>";

				});
 				formObj.append(str).submit();
				formObj.submit();
			}
		
 		  formObj.submit();
		});

	}); 
</script>

<!-- 
<script type="text/javascript">
	$(document).ready(function() {
		(function(){
			var b_number = '<c:out value="${product.pdNum}"/>';
			
			$.getJSON("/product/getAttachList", {b_number: b_number}, function(arr){
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, attach){
				    
					var filePath = attach.b_uploadPath + "/sthmb_" + attach.b_uuid + "_" + attach.b_fileName;
					var fileLink = filePath.replace(new RegExp(/\\/g),"/");
					
					str += "<li data-path='" + attach.b_uploadPath + "' data-uuid='" + attach.b_uuid + "' data-filename='" + attach.b_fileName + "' ><div>";
					str += "<span>" + attach.b_fileName + "</span>";
					str += "<button type='button' data-file=\'" + fileLink + "\' class='btn btn-secondary'><i class='bi bi-x-circle'></i></button><br>";
					str += "<img src='/display?fileName=" + fileLink + "'>";
					str += "</div></li>";
				    
				}); // arr.each
			
			
			$(".uploadResult ul").html(str);
		    
			});//end getjson
		})();//end function
		
		
		$(".uploadResult").on("click", "button", function(e){
			console.log("delete file");
			
			if(confirm("Remove this file? ")){
			
				var targetLi = $(this).closest("li");
				targetLi.remove();
				
			}
		});  
		
		var regex = new RegExp("(.*?)\.(jpg|jpeg|gif|png|bmp|webp)$");
		var maxSize = 5242880; //5MB
		
		function checkExtension(fileName, fileSize) {
			if(fileSize >= (maxSize * 4)) { // Up to 20MB
			   alert("업로드 파일은 20MB를 초과할 수 없습니다");
			   return false;
			}
			if(!regex.test(fileName)){
			   // RegEx(정규표현식)으로 file의 이름을 검증
			   alert("올바르지 않은 유형의 파일입니다");
			   return false;
			}
			return true;
		};
		
		// Page 721 : CSRF token을 Header에 전달하기 위하여 변수선언. ajax
		// 에서 data 전달 시 token과 headername을 함께 전달하게 된다
		var csrfHeaderName ="${_csrf.headerName}"; 
		var csrfTokenValue="${_csrf.token}";
		
		$("input[type='file']").change(function(e){
		
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;
			
			for(var i = 0; i < files.length; i++){
			
				if(!checkExtension(files[i].name, files[i].size) ){
					return false;
				}
				
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: '/uploadAjaxAction',
				processData: false, 
				contentType: false,
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data: formData,
				type: 'POST',
				dataType:'json',
				success: function(result){
					console.log(result); 
					showUploadResult(result); //업로드 결과 처리 함수 
				}
			}); //$.ajax
		  
		});    
		
		function showUploadResult(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length == 0){ return; }
			
			var uploadUL = $(".uploadResult ul");
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
			  
				var filePath = obj.b_uploadPath + "/sthmb_" + obj.b_uuid + "_" + obj.b_fileName;
	           	var fileLink = filePath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-path='" + obj.b_uploadPath + "' data-uuid='" + obj.b_uuid + "' data-filename='" + obj.b_fileName + "' ><div>";
				str += "<span> "+ obj.b_fileName + "</span>";
				str += "<button type='button' data-file=\'" + fileLink + "\' class='btn btn-secondary'><i class='bi bi-x-circle'></i></button><br>";
				str += "<img class='thumbnail' src='/display?fileName=" + fileLink + "'>";
				str += "</div></li>";
				
			});
			
			uploadUL.append(str);
		}
	
	});
</script>  
 -->

<script type="text/javascript">
   // file upload handle
   $(document).ready(function(e){
      var formObj = $("form[role='form']");
      
      $("button[type='submit']").on("click", function(e){
         e.preventDefault();
         console.log("Submit Button Clicked");
         
         // Page564 
         var str = "";
            
         $(".uploadResult ul li").each(function(i, obj){
            var jobj = $(obj);
            
            console.dir(jobj);
            console.log("===========================");
            console.log(jobj.data("filename"));
            
            str += "<input type='hidden' name='attachList[" + i + "].pdName' value='" + jobj.data("filename") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].pdUuid' value='" + jobj.data("uuid") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].pdFolder' value='" + jobj.data("path") + "'>";
            str += "<input type='hidden' name='attachList[" + i + "].pdPath' value='" + jobj.data("link") + "'>";
         }); // uploadResult ul li.each func
         console.log(str);
         formObj.append(str).submit();
      }); // submit button on click
      
      var regex = new RegExp("(.*?)\.(jpg|jpeg|gif|png|bmp|webp)$");
      var maxSize = 5242880; // 5MB
      
      var formFile = $("input[type='file']");
      
	
      function checkExtension(fileName, fileSize) {
         if(fileSize >= (maxSize * 4)) { // Up to 20MB
            alert("업로드 파일은 20MB를 초과할 수 없습니다");
            return false;
         }
         if(!regex.test(fileName)){
            // RegEx(정규표현식)으로 file의 이름을 검증
            alert("올바르지 않은 유형의 파일입니다");
            return false;
         }
         return true;
      };
      
      // Page 721 : CSRF token을 Header에 전달하기 위하여 변수선언. ajax
      // 에서 data 전달 시 token과 headername을 함께 전달하게 된다
      var csrfHeaderName ="${_csrf.headerName}"; 
      var csrfTokenValue="${_csrf.token}";
      
      $("input[type='file']").change(function(e){
        
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		for(var i = 0; i < files.length; i++){
			
			console.log(files[i]);
			
			if(!checkExtension(files[i].name, files[i].size) ){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
			
		}
         
         $.ajax({
            url: '/product/uploadAjaxAction',
            processData: false, 
            contentType: false,
            /*
            beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            */
            // csrf token을 data 전송 전에 header로 전송
            data: formData,
            type: 'POST',
            dataType:'json',
            success: function(result){
               console.log(result);
               showUploadResult(result);
            }
         }); // ajax
       }); // input.change
       
      function showUploadResult(uploadResultArr){
         if(!uploadResultArr || uploadResultArr.length == 0){
            return;
         }
          
         var uploadUL = $(".uploadResult ul");
         
         var str = "";
         
         $(uploadResultArr).each(function(i, obj){
           	var filePath = obj.pdFolder + "/sthmb_" + obj.pdUuid + "_" + obj.pdName;
           	var fileLink = filePath.replace(new RegExp(/\\/g),"/");
			
			str += "<li data-path='" + obj.pdFolder + "' data-uuid='" + obj.pdUuid + "' data-filename='" + obj.pdName + "' ><div>";
			str += "<span> "+ obj.pdName + "</span>";
			str += "<img class='thumbnail' src='/product/display?fileName=" + fileLink + "'>";
			str += "<button type='button' data-file=\'" + fileLink + "\' class='btn-close'></button><br>";
			str += "</div></li>";
           }); // uploadResultArr.each
         uploadUL.append(str);
      } // showUploadResult func
      
      // delete btn handle
      $(".uploadResult").on("click", "button", function(e){
         
         console.log("delete file");
         
         var targetFile = $(this).data("file");
         // var type = $(this).data("type");
         
         var targetLi = $(this).closest("li");
         
         $.ajax({
            url: '/product/deleteFile',
            beforeSend: function(xhr){
               xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            // csrf token을 data 전송 전에 header로 전송
            data: {fileName: targetFile},
            dataType:'text',
            type: 'POST',
            success: function(result){
               alert(result);
               
               targetLi.remove();
               // ListItem을 삭제하여 업로드한 file이 보이지 않도록 함
            }
         }); //$.ajax
      }); // uploadResult.onclick func
      
   }); // document ready
</script>

<%@include file="../includes/footer.jsp"%>
