<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<style>
	.pd-img-wrapper {
		width: 100%;
		height: 50%;
		overflow: hidden;
	}
	.pd-img-wrapper img {
		height: 100%;
		object-fit: cover;
	}
	
	.price{
		border: none;
		text-align:  center;
		width: 70%;
		font-size: 120%;
		background-color: #FFF !important;
	}
	.form-select{
		width: 15%;
	}
	.form-control{
		width: 25%;
	}
	.searchbtn {
	    vertical-align: unset;
	}
	@media (max-width:475px) {
		.row-cols-2>* {
		    flex: 0 0 auto;
		    width: 80% !important;
		}
		.form-select{
			width: 30%;
		}
			
		.form-control{
			width: 50%;
		}
	}
</style>
<div class="container">
	<!-- Carousel -->
	<div class="container py-3">
		<div id="carousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<!-- *BANNER IMAGE MUST BE 1270 x 570 SIZE* -->
					<img src="/resources/imgs/bannersample1.png" class="d-block w-100" alt="banner1">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/resources/imgs/bannersample2.png" class="d-block w-100" alt="banner2">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/resources/imgs/bannersample3.png" class="d-block w-100" alt="banner3">
					<div class="carousel-caption d-none d-md-block">
						<h5></h5>
						<p></p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<!-- Carousel -->
	
	
	<section class="py-5 border-top mt-5">
		<div class="container">
			<div class="text-center">
				<p class="fs-2 mb-5 kfont4 mcolor1" style="border-bottom: 2px solid; border-color: #4C51BD;">
					상품 리스트
				</p>
			</div>
			<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" style="border-bottom: 2px solid; border-color: #4C51BD;">
				<c:forEach items="${list}" var="product">
						<div class="col mb-5 mx-4">
							<div class="card h-100">
							    <!-- Product image-->
							    <div class="pd-img-wrapper">
							    	<a class='move' href='<c:out value="${product.pdNum}"/>'>
		 					    		<img class="card-img-top" src="/product/display?fileName=${product.pdPath}" alt="product image" />
		 					    	</a>
		 					    </div> 
							    <!-- Product details-->
							    <div class="card-body p-4">
									<div class="text-center">
									    <!-- Product name-->
									    <p class="fs-4 fw-bold my-4">
									    	<a class='move' href='<c:out value="${product.pdNum}"/>' style="text-decoration: none; color: #333;">
												<c:out value="${product.pdName}" />
											</a>
									    </p>
									    <fmt:formatDate pattern="yyyy/MM/dd"
												value="${product.pdRegDate}" />
									    <!-- Product price-->
									    <p class="fs-6 my-4">
										    <a href='page?type=T&keyword=${product.pdKeyword}&pageNum=1&amount=9' style="text-decoration: none;">
										    	#<c:out value="${product.pdKeyword}" />
										    </a>
									    </p>
									    <input class="price fs-5 my-4" id="" value="<c:out value="${product.pdPrice}원"/>" disabled="disabled">
									</div>
							    </div>
							</div>
						</div>
				</c:forEach>
			</div>
		</div>
	</section>
	
	<div class="row text-center">
	<div class="col-12">
		<form id="searchForm" action="/product/page" method="get">
			<select class="form-select d-inline" name="type">
				<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>--</option>
				<option value="N" <c:out value="${pageMaker.cri.type eq 'N' ? 'selected' : '' }"/>>상품명</option>
				<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>태그</option>
			</select>
			<input class="form-control d-inline" type="text" name="keyword" value="<c:out value = "${pageMaker.cri.keyword}"/>" />						
			<input type="hidden" name="pageNum" value="<c:out value = "${pageMaker.cri.pageNum}"/>" />
			<input type="hidden" name="amount" value="<c:out value = "${pageMaker.cri.amount}"/>" />
			<button class="btn btn-outline-secondary searchbtn">검색</button>						
		</form>
		</div>
	</div>
	
	<div class="text-center mt-3">
		<ul class="pagination" style="justify-content: center;">
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button page-item previous"><a
					href="${pageMaker.startPage -1}">Previous</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? "active" : ""} ">
					<a class="page-link" href="${num}">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button page-item next"><a
					href="${pageMaker.endPage +1}">Next</a></li>
			</c:if>
		</ul>
	</div>
	<form id='actionForm' action="/product/page" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
	</form>
</div>

<script type="text/javascript">
	var myCarousel = document.querySelector('#carousel');
	var carousel = new bootstrap.Carousel(myCarousel.carousel('cycle'), {
		interval: 3000,
		wrap: false
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {

			if (result === '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html(
						"게시글 " + parseInt(result)
								+ " 번이 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}
		
		
		
		$("#regBtn").on("click", function() {
			self.location = "/product/register";
			
		});

		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {

			e.preventDefault();

			console.log('click');
			
			actionForm.find("input[name='pageNum']")
					.val($(this).attr("href"));
			actionForm.submit();
		});

		$(".move").on("click",function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='pdNum' value='"
										+ $(this).attr("href") + "'>");
			actionForm.attr("action","/product/get");
			actionForm.submit();
			});

		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e) {
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택해 주시기 바랍니다");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력해 주시기 바랍니다");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			
			e.preventDefault();
			searchForm.submit();			
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function () {
	
		$(".price").each(function() {
			var changeNum = $(this).val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				console.log(changeNum);
			$(this).val(changeNum);
		});
	});
</script>
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "4916b26c-5334-4f28-bab8-781e855a1f4b"
  });
</script>
<%@ include file="../includes/footer.jsp" %>