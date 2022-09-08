<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var ="context"><%=request.getContextPath()%></c:set>

<%@include file="../header.jsp"%>
<style>
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
		
		.rvUploadResult {
		   width: 100%;
		   background-color: #F5F5F5;
		}
		
		.rvUploadResult ul {
		   display: flex;
		   flex-flow: row;
		   justify-content: center;
		   align-items: center;
		}
		
		.rvUploadResult ul li {
		   list-style: none;
		   padding: 10px;
		}
		
		.rvUploadResult ul li img.icon {
		   width: 100px;
		}
		
		.rvUploadResult ul li img.thumbnail {
		   width: 100px;
		}
		.rvUploadResult ul li img {
		   cursor: pointer;
		}
		
		.btn-icon {
			margin-left: 5%;
		}
		.reply-item {
			cursor: pointer;
		}
		.reply-item:hover, .reply-item:focus {
			background-color: #D9D9D9;
		}
		.reply-heading {
			font-size: 1rem;
			color: #6FEDD6 !important;
    		background-color: #FF4A4A !important;
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
			background: rgba(0,0,0,0.2);
			z-index: 9999;
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
<div class="container-fluid">
	<div class="row">
	  <div class="col-lg-12">
	    <h1 class="page-header">Product</h1>
	  </div>
	  <!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<div class="row">
	  <div class="col-lg-12">
	    <div class="panel panel-default">
	
	        <div class="form-group">
	          <label>상품번호</label> <input class="form-control" name='pdNum' value='<c:out value="${product.pdNum}" />' readonly="readonly">
	        </div>
	
	        <div class="form-group">
	          <label>상품명</label> <input class="form-control" name='pdName' value='<c:out value="${product.pdName}" />' readonly="readonly">
	        </div>
	
	        <div class="form-group">
	          <label>상품가격</label>
	          <input class="form-control" rows="3" name='pdPrice' type="number" readonly="readonly" value="${product.pdPrice}">
	        </div>
	
	        <div class="form-group">
	          <label>상품태그</label>
	          <input class="form-control" rows="3" name='pdKeyword' type="text" readonly="readonly" value="${product.pdKeyword}">
	        </div>
	        
	        <div class="form-group">
	          <label>수량</label> <input class="form-control" name='pdStock' value='<c:out value="${product.pdStock}" />' readonly="readonly">
	        </div>
	
	
			<button data-oper='modify' class="btn btn-default" onclick="location.href='/product/modify?pdNum=<c:out value="${product.pdNum}" />'">Modify</button>
			<button data-oper='list' class="btn btn-info" onclick="location.href='/product/list'">List</button>
			
			
			<form id='operForm' action="/product/modify" method="get">
				<input type='hidden' id='pdNum' name='pdNum' value='<c:out value="${product.pdNum}"/>'>
				<input type='hidden' id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type='hidden' id='amount' name='amount' value='<c:out value="${cri.amount}"/>'>
				<!-- 345 page code added -->
				<input type='hidden' id='type' name='type' value='<c:out value="${cri.type}"/>'>
				<input type='hidden' id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
			</form>
			<!-- 317 page -->
	
	    </div>
	    <!--  end panel -->
	  </div>
	  <!-- end panel -->
	</div>
	<!-- /.row -->
	<div class='bigPictureWrapper'>
		<div class='bigPicture'>
			
		</div>
	</div>
	
	<!-- page414 댓글 목록 box -->
	<div class='row'>
		<div class="col-lg-12">
			<div class="panel panel-default">
				<!-- Page 419 coding 시 주석처리됨 -->
				<!--
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i> Reply
				</div>
				-->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
					      	<div class="panel-heading">Files</div>
					      	<!-- /.panel-heading -->
					      	<div class="panel-body">
					        
					        	<div class='uploadResult'> 
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
				<!-- /.row -->
				
				<!-- new entry button added -->
				<div class="mb-4">
					<span class="badge text-bg-info reply-heading">Review</span>
					<button id="addReplyBtn" class="btn btn-secondary btn-sm float-end">New Review</button>
				</div>
				
				<!-- /.panel-heading -->
				<div class="panel-body">
					<ul class="chat list-group">
						<!-- reply entries -->
						
					</ul>
					<!-- /ul.chat -->
				</div>
				<!-- /.panel-body -->
				<!-- Page 439에서 추가한 source -->
				<div class="panel-footer">
				
				</div>
				<!-- /.panel-footer -->
			</div>
			<!-- /.panel -->
		</div>
	</div>
	<!-- /.row -->
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REVIEW</h4>
            </div>
            <div class="modal-body">
				<div class="form-group">
					<label>rvText</label> 
					<input class="form-control" name='rvText' value='rvText'>
				</div>
				<div class="form-group">
					<label>memNickname</label> 
					<input class="form-control" name='memNickname' value='memNickname'>
				</div>
				<!-- file -->
				<div class="form-group">
					<label for="formFile" class="form-label">업로드 하실 이미지를 선택해주세요</label>
					<input id="formFile" type="file" name='uploadFile' class="form-control" accept="image/*">
				</div>
				<div class='rvUploadResult'> 
					<ul>
					
					</ul>
				</div>
			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
			</div>
		</div>
        <!-- /.modal-content -->
	</div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
	// page 415 reply event handler
	$(document).ready(function() {
		var pdNumValue = '<c:out value="${product.pdNum}"/>';
		var replyUL = $(".chat");
		
		showList(1);
		// param : Page Number (defualt 1)
		
		function showList(page) {
			console.log("show list : " + page);
			// getList(param, callback, error). error function은 지정되지 않음
			replyService.getList({pdNum: pdNumValue, page: page || 1},
				function(replyCnt, list){
				// paging 처리를 위해 callback 함수에 parameter replyCnt 추가
					console.log("replyCnt : " + replyCnt);
					console.log("list: " + list);
					
					if (page == -1) {
						pageNum = Math.ceil(replyCnt / 10.0);
						showList(pageNum);
						return;
					}
					
					var str = "";
					
					if(list == null || list.length == 0){
						// replyUL.html("");
						// paging 처리를 위해 주석처리 됨
						return;
					}
					
					for(var i = 0, len = list.length || 0; i < len; i++){
						str += "<li class='list-group-item ps-3 reply-item' data-rvnum='" + list[i].rvNum + "'>";
						// str += "<div><div class='header'><strong class='primary-font'>" + list[i].memNickname + "</strong>";
						// str += "<small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
						str += "<p>" + list[i].rvText + "</p></li>";
					}
					replyUL.html(str);
					
					showReplyPage(replyCnt);
				});
			// getList(param, callback, error)
		}
		// showList(page) page : path variable
		
		// Page 440 : paging을 위한 method
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(replyCnt){
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt) {
				endNum = Math.ceil(replyCnt/10.0);
			}
			
			if(endNum * 10 < replyCnt) {
				next = true;
			}
			
			var str = "<ul class='pagination ms-5 mt-2'>";
			
			if(prev) {
				str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
			}
			
			for(var i = startNum; i <= endNum; i++) {
				var active = pageNum == i ? "active" : "";
				
				str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
			}
			
			if(next) {
				str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
			}
			
			str += "</ul></div>";
			
			console.log(str);
			replyPageFooter.html(str);
		}
		
		replyPageFooter.on("click", "li a", function(e){
			e.preventDefault();
			console.log("Page click");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum : " + targetPageNum);
			
			pageNum = targetPageNum;
			
			showList(pageNum);
		});
		
		// page 422 modal handler
		var modal = $(".modal");
		var modalInputRvText = modal.find("input[name='rvText']");
		var modalInputMemNickname = modal.find("input[name='memNickname']");
		// var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		/*
		var replyer = null;

		<sec:authorize access="isAuthenticated()">
			replyer = '<sec:authentication property="principal.username"/>';
		</sec:authorize>
		*/
		// added
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
				url: '/review/uploadAjaxAction',
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
	          
			var uploadUL = $(".rvUploadResult ul");
	         
			var str = "";
	        
			$(uploadResultArr).each(function(i, obj){
				var filePath = obj.rvFoler + "/sthmb_" + obj.rvUuid + "_" + obj.rvName;
	           	var fileLink = filePath.replace(new RegExp(/\\/g),"/");
				
				str += "<li data-rvfolder='" + obj.rvFolder + "' data-rvuuid='" + obj.rvUuid + "' data-rvName='" + obj.rvName + "' ><div>";
				str += "<span> "+ obj.rvName + "</span>";
				str += "<img class='thumbnail' src='/review/display?fileName=" + fileLink + "'>";
				str += "<button type='button' data-file=\'" + fileLink + "\' class='btn btn-secondary'><i class='bi bi-x-circle'></i></button><br>";
				str += "</div></li>";
			}); // uploadResultArr.each
			uploadUL.append(str);
		} // showUploadResult func
		
		// delete btn handle
		$(".rvUploadResult").on("click", "button", function(e){
		   
			console.log("delete file");
		   
			var targetFile = $(this).data("file");
			// var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");
		   
			$.ajax({
				url: '.review/deleteFile',
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
		// added
		
		$("#addReplyBtn").on("click", function(e){
			modal.find("input").val("");
			// modalInputReplyDate.closest("div").hide();
			modal.find("button[id !='modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		// page 423 modal registerbtn
		modalRegisterBtn.on("click", function(e){
			// added
			console.log("Submit Button Clicked");
			
			var uploadUL = $(".rvUploadResult ul");
			var str = "";
			   
			$(".rvUploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				
				console.dir(jobj);
				console.log("===========================");
				console.log(jobj.data("filename"));
				
				str += "<input type='hidden' name='attachList[" + i + "].rvName' value='" + jobj.data("rvname") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].rvUuid' value='" + jobj.data("rvuuid") + "'>";
				str += "<input type='hidden' name='attachList[" + i + "].rvFolder' value='" + jobj.data("rvfolder") + "'>";
			}); // uploadResult ul li.each func
			console.log(str);
			uploadUL.append(str);
			// added
			
			
			var reply = {
				rvText: modalInputRvText.val(),
				memNickname: modalInputMemNickname.val(),
				pdNum: pdNumValue
			};
			replyService.add(reply, function(result){
				alert(result);
				
				modal.find("input").val("");
				modal.modal("hide");
				
				// showList(1);
				// 댓글을 추가한 후 댓글 목록을 1 page로 갱신
				showList(-1);
				// showList method에 추가된 기능으로 마지막 페이지를 보여주게 됨
				// 서버에서 data를 여러번 호출하게 되긴 하지만 댓글의 등록이 조회, paging
				// 에 비해 빈도수가 적기 때문에 이러한 방식을 사용함
			});
		});
		
		// page 425 event handler (Shows modify, remove btn)
		$(".chat").on("click", "li", function(e){
			var rvNum = $(this).data("rvnum");
			
			replyService.get(rvNum, function(reply){
				modalInputRvText.val(reply.rvText);
				modalInputMemNickname.val(reply.memNickname);
				//modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
				modal.data("rvnum", reply.rvNum);
				
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
			});
		})
		
		// page 427
		modalModBtn.on("click", function(e){
			var reply = {rvNum:modal.data("rvnum"), rvText: modalInputRvText.val()};
			
			/*
			var originalReplyer = modalInputReplyer.val();
			
			// 검증을 위해 replyer data를 추가
			// var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
			var reply = {rno: modal.data("rno"),
					reply: modalInputReply.val(),
					replyer: originalReplyer};
			if(!replyer) {
				alert("You have to be logged in to modify");
				modal.modal("hide");
				return;
			}
			
			console.log("Original Replyer: " + originalReplyer);
			
			if(replyer != originalReplyer) {
				alert("You can only modify your replies");
				modal.modal("hide");
				return;
			}
			*/
			replyService.update(reply, function(result){
				alert(result);
				modal.modal("hide");
				// showList(1);
				showList(pageNum);
			});
		});
		
		modalRemoveBtn.on("click", function(e){
			var rvNum = modal.data("rvnum");
			var memNickname = modalInputMemNickname.val();
			
			/* after security
			if(!replyer){
	           alert("You have to be logged in to remove");
	           modal.modal("hide");
	           return;
	        }
	        
	        var originalReplyer = modalInputReplyer.val();
	        
	        console.log("Original Replyer: " + originalReplyer);
	        
	        if(replyer != originalReplyer){
	           
	           alert("You can only remove your replies");
	           modal.modal("hide");
	           return;
	           
	        }
	        */
			
			replyService.remove(rvNum, memNickname, function(result){
				alert(result);
				modal.modal("hide");
				// showList(1);
				showList(pageNum);
			});
		});
		
		$("#modalCloseBtn").on("click", function(){
			modal.modal("hide");
		});
		// why the heck book did not do this
		
	});
	// document.ready function
</script>

<script type="text/javascript">
	$(document).ready(function(e){
		
		$("#modalRegisterBtn").on("click", function(e){
			// e.preventDefault();
			
		}); // submit button on click
		
		
	      
		
	}); // documentready
</script>

<script type="text/javascript">
	$(document).ready(function(){
		var ctx = getContextPath();
		
		function getContextPath() {
			return sessionStorage.getItem("contextpath");
		};
		// header.jsp 최하단 (385행) 참고. JS에서 contextpath 사용하는 법
		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", ctx + "/product/modify").submit();
			// 수정 버튼 클릭 시 bno값을 같이 전달하고 form tag를 submit 처리
		});
		// button 클릭 시 #operForm form tag를 전송
		
		$("button[data-oper='list']").on("click", function(e) {
			// js에서 속성을 명시할 때 [] 사용
			operForm.find("#pdNum").remove();
			// list로 이동 시 form tag 내의 #bno 삭제?
			operForm.attr("action", ctx + "/product/list");
			operForm.submit();
		});
	});
	
</script>

<script type="text/javascript">
	$(document).ready(function(){
		(function(){
			var pdNum = '<c:out value="${product.pdNum}"/>';
			
		    $.getJSON("/product/getAttachList", {pdNum: pdNum}, function(arr){
				console.log(arr);
				
				var str = "";
			    
				$(arr).each(function(i, attach){
					var fileCallPath = encodeURIComponent(attach.pdFolder + "/sthmb_" + attach.pdUuid + "_" + attach.pdName);
					
					str += "<li data-pdfolder='" + attach.pdFolder + "' data-pduuid='" + attach.pdUuid + "' data-pdname='" + attach.pdName + "' ><div>";
					str += "<img src='/product/display?fileName=" + fileCallPath + "'>";
					str += "</div>";
					str += "</li>";
					
				});
				
				$(".uploadResult ul").html(str);
			    
			}); // getjson
			
		})(); // function
		
		$(".uploadResult").on("click","li", function(e){
			console.log("view image");
			
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("pdfolder") + "/" + liObj.data("pduuid") + "_" + liObj.data("pdname"));
			
			// if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));
			/*
			} else {
				//download 
				self.location ="/download?fileName="+path
			}
			*/
		});
		
		function showImage(fileCallPath){
			console.log(fileCallPath);
			
			$(".bigPictureWrapper").css("display","flex").show();
			
			$(".bigPicture")
			.html("<img src='/product/display?fileName=" + fileCallPath + "' >")
			.animate({width:'100%', height: '100%'}, 150);
		}
		
		$(".bigPictureWrapper").on("click", function(e){
			$(".bigPicture").animate({width:'0%', height: '0%'}, 150);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			}, 150);
		});
	}); // document ready
</script>

<%@include file="../footer.jsp"%>
