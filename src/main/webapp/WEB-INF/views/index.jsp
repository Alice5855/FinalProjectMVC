<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./includes/header.jsp" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>

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
				<img src="/resources/imgs/sample1.jpg" class="d-block w-100" alt="banner1">
				<div class="carousel-caption d-none d-md-block">
					<h5>First slide label</h5>
					<p>Some representative placeholder content for the first slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/imgs/sample2.jpg" class="d-block w-100" alt="banner2">
				<div class="carousel-caption d-none d-md-block">
					<h5>Second slide label</h5>
					<p>Some representative placeholder content for the second slide.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/imgs/sample3.jpg" class="d-block w-100" alt="banner3">
				<div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
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
	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		<c:forEach items="${list}" var="product">
			
				<div class="col mb-5 mx-4">
					<div class="card h-100">
					    <!-- Product image-->
					   
 					    <img class="card-img-top" src="/product/display?fileName=${product.pdPath}" alt="..." /> 
					    <!-- Product details-->
					    <div class="card-body p-4">
							<div class="text-center">
							    <!-- Product name-->
							    <h5 class="fw-bolder">
							    	<a class='move' href='<c:out value="${product.pdNum}"/>'>
										<c:out value="${product.pdName}" />
									</a>
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${product.pdRegDate}" />
							    </h5>
							    <!-- Product price-->
							    <c:out value="${product.pdPrice}원"/>
							</div>
					    </div>
					    <!-- Product actions-->
					    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
					        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
					    </div>
					</div>
				</div>
			
		
		</c:forEach>
	</div>

</section>


			<div class="row">
					<div class="col-lg-12">
						<form id="searchForm" action="/product/page" method="get">
						<select name="type">
							<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>--</option>
							<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>제목</option>
							<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>내용</option>
							<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }"/>>작성자</option>
							<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : '' }"/>>제목 or 내용</option>
							<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : '' }"/>>제목 or 작성자</option>
							<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : '' }"/>>제목 or 내용 or 작성</option>
						</select>
						<input type="text" name="keyword" value="<c:out value = "${pageMaker.cri.keyword}"/>" />						
						<input type="hidden" name="pageNum" value="<c:out value = "${pageMaker.cri.pageNum}"/>" />
						<input type="hidden" name="amount" value="<c:out value = "${pageMaker.cri.amount}"/>" />
						<button class="btn btn-default">Search Now!</button>						
					</form>
				</div>
			</div>




	
                      
		
		
		
				<div class='pull-right'>
					<ul class="pagination">
					
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active" : ""} ">
								<a class="page-link" href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1}">Next</a></li>
						</c:if>
					<!-- Page310 위에 소스 코딩 끝 -->

					</ul>
				</div>
				
			<form id='actionForm' action="/product/page" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<!-- form 종료 태그 : Page 311 위에 소스 코딩 끝 -->

			<!-- Page 344 중간 jsp 소스 코딩 추가 시작 : 소스 문제 없는데 붉은색 표시나면 구문 잘라내기 후에 다시 붙여넣기 저장해 보시기 바랍니다. -->
			<!-- 다음의 구문 코딩 후에 웹브라우저 실행해서, 검색 이후에 페이지를 이동해서 동일한
			     검색 조건과 키워드가 유지되는지 확인 바랍니다. -->
				<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
			<!-- Page 344 중간 jsp 소스 코딩 추가 끝 -->

			</form>
			


<script type="text/javascript">
	var myCarousel = document.querySelector('#carousel')
	var carousel = new bootstrap.Carousel(myCarousel.carousel('cycle')), {
	  interval: 3000,
	  wrap: false
	});
</script>

<script type="text/javascript">
	// Page 246 소스 코딩 시작
	// 새로운 게시물의 번호는 BoardController의 addFlashAttribute() 메서드로
	// 저장되었기 때문에 한 번도 사용된 적이 없다면 사용자가 "/board/list"를 호출하거나,
	// '새로고침'을 통해서 호출하는 경우 아무런 내용이 없게 됩니다.
	// 또한, addFlashAttribute() 메서드를 이용해서 일회성으로만 데이터를 사용할 수 
	// 있으므로 이를 이용하여 경고창이나 모달창 등을 보여주는 방식으로 처리할 수 있습니다.
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
	// }); Page 246 소스 코딩 끝 
	
						// Page 248 아래 자바스크립트 소스 코딩 시작
						// 모달창 관련 자바스크립트 소스 코딩(시작)	
						// checkModal() 함수는 파라미터에 따라서 모달창을 보여주거나 내용을 수정한 뒤
						// 보이도록 처리합니다. checkModal()에서는 새로운 게시글이 작성되는 경우
						// RedirectAttributes로 게시물의 번호가 전송되므로 이를 이용해서 모달창의 내용을
						// 수정 처리합니다. $("#modal").modal('show')를 호출하면 모달창이 보이게 됩니다.
						// 실행 확인은 웹 프로젝트 실행 후 '/board/register'를 이용해서 새로운 게시물을 작성하고
						// 나면 자동으로 '/board/list'로 이동하면서 모달창이 보이게 됩니다.
						checkModal(result);

						// Page257 중간 window.history 객체, replaceState() 메서드 소스 추가 코딩
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
							// 모달창 관련 자바스크립트 소스 코딩(종료)
						}
						
						
						// }); Page 248 아래 자바스크립트 소스 코딩 끝

						// Page 250 아래 자바스크립트 소스 코딩 시작
						// list.jsp에서  Register New Board 버튼 클릭하면
						// 게시물의 등록 웹페이지로 이동 처리 합니다.
						$("#regBtn").on("click", function() {
							self.location = "/product/register";
							
						});
						// Page 250 아래 자바스크립트 소스 코딩 끝

						// Page 312 위에 자바스크립트 소스 코딩 시작
						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');
									// }); Page 312 위에 자바스크립트 소스 코딩 끝
									
									// Page 312 아래 자바스크립트 소스 코딩 시작
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit(); // actionForm 자체를 submit() 처리 시켜줍니다.
								});
								// Page 312 아래 자바스크립트 소스 코딩 끝						

						// Page 315 자바스크립트 소스 코딩 시작
						$(".move").on("click",function(e) {
								e.preventDefault();
								actionForm.append("<input type='hidden' name='pdNum' value='"
															+ $(this).attr("href") + "'>");
								actionForm.attr("action","/product/get");
								actionForm.submit();
								});
						// Page 315 자바스크립트 소스 코딩 끝

						// Page 342 자바스크립트 소스 코딩 시작
						var searchForm = $("#searchForm");
						
						$("#searchForm button").on("click", function(e) {
							if(!searchForm.find("option:selected").val()){
								alert("검색 종류를 선택해 주시기 바랍니다!");
								return false;
							}
							
							if(!searchForm.find("input[name='keyword']").val()){
								alert("키워드를 입력해 주시기 바랍니다!");
								return false;
							}
							
							// 여러 문제들 중에서 검색 버튼을 클릭하면 검색은
							// 1페이지를 하도록 수정 처리합니다.
							searchForm.find("input[name='pageNum']").val("1");
							// 브라우저에서 검색 버튼을 클릭하면 form 태그의
							// 전송은 막고, 페이지의 번호는 1이 되도록 처리합니다.
							// 화면에서 키워드가 없다면 검색을 하지 않도록 제어합니다.
							e.preventDefault();
							searchForm.submit();			
						});
					});
						// Page 342 자바스크립트 소스 코딩 끝
</script>





<%@ include file="./includes/footer.jsp" %>