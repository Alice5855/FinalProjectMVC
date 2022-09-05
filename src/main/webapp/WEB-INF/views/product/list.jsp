<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>

<%@include file="../includes/header.jsp" %> 
<style>
	a {
		color: black;
	}
	a:hover {
		color: black;
	}
	#title {
		font-size: 2.5rem;
	}
	#date {
		font-size: 0.5rem;
	}
	.mImgWrapper{
		/*width: 40%;*/
		max-height: 40%;
	}
	.mImgWrapper img{
		width: 100%;
		object-fit: cover;
	}
	.modal-dialog{
		max-width: 70% !important;
	}
	.b_Modal_Content {
		padding: 3%;
	}
	#regBtn{
		margin-right: 5% !important;
	}
	.mNumber {
		font-size: 0.5rem;
	}
	.mEmail {
		
	}
	.mTitle {
		font-size: 2.5rem;
	}
	.mText {
		margin-left: 5%;
	}
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			
			<!-- Page250 위에 jsp 소스 코딩 시작 -->
			<div class="panel-heading">
				Board List Page
				<button id='regBtn' type="button" class="btn btn-xs pull-right">Register
					New Board</button>
			</div>
			<!-- Page250 위에 jsp 소스 코딩 끝 -->
			
			<!-- 목록 페이지 상단에 게시판 등록 작업 버튼 생성해 줌 -->
			<!-- /.panel-heading -->
			<div class="panel-body">
				<!-- Page 237 소스 코딩 시작 -->
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<!-- Model에 담긴 데이터 출력 : '/board/list'를
                                                                  실행했을 때 앞서 BoardController는 Model을 이용해서
                                                                  게시물의 목록을 'list'라는 이름으로 담아서 전달했으므로
			                              list.jsp에서는 이것을 출력합니다.
                                                                 출력은 JSTL을 이용해서 처리합니다.-->
					<c:forEach items="${list}" var="product">
						<!-- Page254 아래 ~ Page255 위까지 소스 수정 코딩 시작 -->
						<tr>
							<td><c:out value="${product.pdNum}" /></td>
							<!-- a 태그에 target="_blank" 속성을 적용하면 새창으로 글 상세 내용을 보여줌 -->	
							<!-- Page 314 중간 jsp 소스 코딩할 때 아래 소스 주석 처리함 -->
							<%-- <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td> --%>

							<!-- Page 314 아래 jsp 소스 코딩할 때 아래 소스 추가 코딩 시작 -->
							<td><a class='move' href='<c:out value="${product.pdNum}"/>'>
									<c:out value="${product.pdName}" />
									<!-- Page 486 소스 코딩 추가 -->
<%-- 									<b>[<c:out value="${board.replyCnt}" /> ]</b> --%>
							</a></td>
							<!-- Page 314 아래 jsp 소스 코딩할 때 아래 소스 추가 코딩 끝 -->

							<td><c:out value="${product.pdName}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${product.pdRegDate}" /></td>
<%-- 							<td><fmt:formatDate pattern="yyyy-MM-dd" --%>
<%-- 									value="${board.updateDate}" /></td> --%>
						</tr>
						<!-- Page254 아래 ~ Page255 위까지 소스 수정 코딩 끝 -->
					</c:forEach>
				</table>
				<!-- Page 237 소스 코딩 끝 -->
				
				<!-- Page 340 jsp 소스 코딩 시작, Page 343 jsp 소스 코딩 수정 시작 -->
				<!-- 화면에서 검색 기능 구현할 때 다음의 사항들을 주의해서 개발해 주시기 바랍니다.
				첫번째로 페이지 번호가 파라미터로 유지되었던 것처럼 검색 조건과 키워드 역시 항상 화면 이동 시 같이 전송되어야 합니다.
				두번째로 화면에서 검색 버튼을 클릭하면 새로 검색을 한다는 의미이므로
				1페이지로 이동합니다.
				세번째로 한글의 경우 GET방식으로 이동하는 경우 문제가 생길 수 있으므로
				주의해야 합니다. -->
				<div class="row">
					<div class="col-lg-12">
						<form id="searchForm" action="/board/list" method="get">
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
			<!-- Page 340 jsp 소스 코딩 끝, Page 343 jsp 소스 코딩 수정 끝 -->

				<!-- Page308 소스 코딩 시작 : Page310 진행할 때 주석 처리함 -->
				<!-- http://localhost:port번호/board/list?pageNum=5 : 하단 Next 버튼 확인 -->
				<!-- http://localhost:port번호/board/list?pageNum=5&amount=20 : 하단 페이지 전체 확인 -->
			    <%-- 
				<div class='pull-right'>
					<ul class="pagination">
						            <c:if test="${pageMaker.prev}">
              <li class="paginate_button previous"><a href="#">Previous</a>
              </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}"
              end="${pageMaker.endPage}">
              <li class="paginate_button"><a href="#">${num}</a></li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
              <li class="paginate_button next"><a href="#">Next</a></li>
            </c:if>
            --%>
            <!-- Page308 소스 코딩 끝 : Page310 진행할 때 주석 처리함 -->

				<!-- Page310 위에 소스 코딩 시작 -->
				<div class='pull-right'>
					<ul class="pagination">
					
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active" : ""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					<!-- Page310 위에 소스 코딩 끝 -->

					</ul>
				</div>
				<!--  end Pagination -->
			</div>

			<!-- Page 311 위에 소스 코딩 시작 -->
			<form id='actionForm' action="/product/list" method='get'>
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

			<!-- Page 248 소스 코딩 시작 -->
			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">Save
								changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- Page 248 소스 코딩 끝 -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
</div>
<!-- /.row -->


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


        

<%@include file="../includes/footer.jsp" %>