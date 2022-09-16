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
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				
				<!-- Page250 위에 jsp 소스 코딩 시작 -->
				<div class="panel-heading mb-3">
					상품 리스트
					<sec:authorize access="hasRole('ROLE_ADMIN')"> 
						<button id='regBtn' type="button" class="btn btn-sm btn-outline-info float-end">Register</button>
					</sec:authorize>
				</div>
				<!-- Page250 위에 jsp 소스 코딩 끝 -->
				
				<!-- 목록 페이지 상단에 게시판 등록 작업 버튼 생성해 줌 -->
				<!-- /.panel-heading -->
				<div class="panel-body">
					<!-- Page 237 소스 코딩 시작 -->
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>상품번호</th>
								<th>상품명</th>
								<th>가격</th>
								<th>재고</th>
								<th>조회수</th>
								<th>태그</th>
								<th>작성일</th>
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
								<td><c:out value="${product.pdPrice}" /></td>
								<td><c:out value="${product.pdStock}" /></td>
								<td><c:out value="${product.pdHit}" /></td>
								<td>#<c:out value="${product.pdKeyword}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.pdRegDate}" /></td>
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
					<div class="row text-center">
						<div class="col-12">
							<form id="searchForm" action="/product/page" method="get">
								<select class="form-select d-inline" name="type" style="width: 15% !important;">
									<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>--</option>
									<option value="N" <c:out value="${pageMaker.cri.type eq 'N' ? 'selected' : '' }"/>>상품명</option>
									<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>태그</option>
								</select>
								<input class="form-control d-inline" type="text" name="keyword" value="<c:out value = "${pageMaker.cri.keyword}"/>" style="width: 25% !important;" />						
								<input type="hidden" name="pageNum" value="<c:out value = "${pageMaker.cri.pageNum}"/>" />
								<input type="hidden" name="amount" value="<c:out value = "${pageMaker.cri.amount}"/>" />
								<button class="btn btn-outline-secondary">검색</button>						
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
									<button type="button" class="btn-close" data-dismiss="modal" aria-hidden="true"></button>
									<h4 class="modal-title" id="myModalLabel">Modal</h4>
								</div>
								<div class="modal-body">처리가 완료되었습니다.</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</div>
<!-- /.container-fluid -->


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
						"상품 " + parseInt(result)
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
				alert("검색 종류를 선택해 주시기 바랍니다!");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력해 주시기 바랍니다!");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();			
		});
	});
</script>

<%@include file="../includes/footer.jsp" %>