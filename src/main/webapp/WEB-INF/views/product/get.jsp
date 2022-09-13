<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<link href="/resources/css/get.css" rel="stylesheet" />

<%@include file="../header.jsp"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<style>
		
		
		.uploadResult ul li {
		   list-style: none;
		
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



   
        
        
        
        
          <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6 uploadResult">
                    	<ul>
		          		</ul>
                    </div>
                    <div class="col-md-6">
                        <div class="small mb-1" style="display: none;">
                        	<c:out value="${product.pdNum}" />
                        </div>
                        <h1 class="display-5 fw-bolder"><c:out value="${product.pdName}" /></h1>
                        <div class="fs-5 mb-5">
                            <span><c:out value="${product.pdPrice}원" /></span>
                            
                        </div>
                        <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="<c:out value="${product.pdStock}" />" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

<button data-oper='modify' class="btn btn-default" onclick="location.href='/product/modify?pdNum=<c:out value="${product.pdNum}" />'">Modify</button>





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
	
			
			<!-- new entry button added -->
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id="addReplyBtn" class="btn btn-default btn-xs pull-right">New Reply</button>
			</div>
			
			<!-- /.panel-heading -->
			<div class="panel-body">        
				<ul class="chat">
					<!-- reply entries -->
					
					<!-- 댓글 출력 부분 js에서 html출력으로 대체하기 때문에 주석처리됨 -->
					<!-- 댓글 번호를 받기 위한 data-rno attribute -->
					<!--
					<li class="left clearfix" data-rno='12'>
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2022-08-04 14:56</small>
							</div>
							<p>yeah baby that's what i'm talkin about</p>
						</div>
					</li>
					-->
					<!-- /reply entries -->
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


	









<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
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
				<!--
				<div class="form-group">
					<label>Reply Date</label> 
					<input class="form-control" name='replyDate' value='2018-01-01 13:13'>
				</div>
				-->      
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript" src="/resources/js/get_script.js"></script>

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
						str += "<li class='left clearfix' data-rvNum='" + list[i].rvNum + "'>";
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
			
			var str = "<ul class='pagination pull-right'>";
			
			if(prev) {
				str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
			}
			
			for(var i = startNum; i <= endNum; i++) {
				var active = pageNum == i ? "active" : "";
				
				str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
			}
			
			if(next) {
				str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
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
		
		$("#addReplyBtn").on("click", function(e){
			modal.find("input").val("");
			// modalInputReplyDate.closest("div").hide();
			modal.find("button[id !='modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		// page 423 modal registerbtn
		modalRegisterBtn.on("click", function(e){
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
			var rvNum = $(this).data("rvNum");
			
			replyService.get(rvNum, function(reply){
				modalInputRvText.val(reply.rvText);
				modalInputMemNickname.val(reply.memNickname);
				//modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
				modal.data("rvNum", reply.rvNum);
				
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
			});
		})
		
		// page 427
		modalModBtn.on("click", function(e){
			var reply = {rno:modal.data("rvNum"), rvText: modalInputRvText.val()};
			replyService.update(reply, function(result){
				alert(result);
				modal.modal("hide");
				// showList(1);
				showList(pageNum);
			});
		});
		
		modalRemoveBtn.on("click", function(e){
			var rvNum = modal.data("rvNum");
			
			replyService.remove(rvNum, function(result){
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
// 					var fileCallPath = encodeURIComponent(attach.pdFolder + "/sthmb_" + attach.pdUuid + "_" + attach.pdName);
					var fileCallPath = encodeURIComponent(attach.pdFolder + "/sthmb_" + attach.pdUuid + "_" + attach.pdName);
					
					str += "<li data-pdFolder='" + attach.pdFolder + "' data-pdUuid='" + attach.pdUuid + "' data-pdName='" + attach.pdName + "' ><div>";
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
			
			var path = encodeURIComponent(liObj.data("pdFolder") + "/" + liObj.data("pdUuid") + "_" + liObj.data("pdName"));
			
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
			.html("<img src='/display?fileName=" + fileCallPath + "' >")
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
