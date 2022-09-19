<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- taglib for Security authentication -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>

<%@include file="../includes/header.jsp"%>

<style>
      .uploadResult {
         width: 100%;
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
         width: 120px;
         height: 120px
      }
      .btn-icon {
         margin-left: 5%;
      }
      .form-group {
      	margin-bottom: 1rem;
      	margin-top: 1rem;
      }
      
      @media(max-width:475px)  {
      
	      .uploadResult ul li img.thumbnail {
	         width: 50px;
	         height: 50px
	      }
	      
	     
		
		}
</style>
<style>
      .bigPictureWrapper {
         position: absolute;
         display: none;
         justify-content: center;
         align-items: center;
         top:0%;
         left:0%;
         width:100%;
         height:100%;
         background-color: #F5F5F5; 
          background:rgba(255,255,255,0.5);
         z-index: 100;
         margin: 0;
      }
      
      .bigPicture {
         position: relative;
         display:flex;
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
	<section class="py-5">
		<form role="form" action="${context}/product/register" method="post">
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
			    	<div class="col-md-6">
			    
				    	<div class="container-fluid py-3">
							<div class="row">
							  	<div class="col-lg-12">
							    	<div class="panel panel-default">
							
								      	<div class="lead">상품 이미지 등록</div>
										<!-- /.panel-heading -->
										<div class="panel-body">
									        <div class="form-group uploadDiv">
									        	<input type="file" name='uploadFile' class="form-control" accept="image/*" multiple>
									        </div>
									        
									        <div class='uploadResult pd-img-wrapper'> 
									        	<ul>
									          
									        	</ul>
								        	</div>
										</div>
										<!--  end panel-body -->
									</div>
									<!--  end panel -->
								</div>
								<!-- /.col-lg-12 -->
							</div>
							<!-- /.row -->
						</div>
						<!-- /.container-fluid -->
					</div>
					<div class="col-md-6">
					    <div class="form-group">
					    	<div class="fs-5 mb-5">
					    		<label>물품명</label>
								<input class="form-control" name='pdName'>
					   		</div>
					    </div>
					    
					    <div class="form-group">
					    	<div class="fs-5 mb-5">
								<label>물품가격</label>
								<input class="form-control" rows="3" name='pdPrice' style="resize: none;" type="number">
							</div>
						</div>
						<div class="form-group">
							<div class="fs-5 mb-5">
								<label>태그</label>
								<input class="form-control" name='pdKeyword'>
							</div>
						</div>
    
						<div class="d-flex align-middle mt-2">
							<span class="lead me-3 pt-3">상품 수량</span>
							<div class="form-group">
								<input class="form-control text-center me-3" name='pdStock' id="inputQuantity" style="max-width: 3.4rem">
							</div>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-outline-success">등록</button>
							<button type="reset" class="btn btn-outline-dark" onclick="javascript:history.go(-1);">취소</button>
						</div>
					</div>
					<!-- /.col-md-6 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</form>
	</section>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
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
      
	
      function checkExtension(fileName, fileSize,) {
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
      
   
      var csrfHeaderName ="${_csrf.headerName}"; 
      var csrfTokenValue="${_csrf.token}";
      
      $("input[type='file']").change(function(e){
        
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		for(var i = 0; i < files.length; i++){
			if(i >= 3){
				alert("상품 이미지 업로드는 3개 까지만 가능 합니다.");
				return false;
			}
			
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
			str += "<img class='thumbnail rounded' src='/product/display?fileName=" + fileLink + "'>";
			str += "<button type='button' data-file=\'" + fileLink + "\' class='btn btn-close'></button><br>";
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
            /*
            beforeSend: function(xhr){
               xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            */
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