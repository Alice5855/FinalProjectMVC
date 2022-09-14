<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../includes/header.jsp" %> 
<style>
	.bucketContainer{
		width: 90%;
		height: 100%;
		background: aqua;
		margin: 0 10px 10px 10px;
		justify-content: center;
		display: flex;
		overflow: auto;
		flex-direction: column-reverse;
	}
	
	.productInfo{
		width : 80%;
		height : 80px;
		margin-top: 10px;
		margin-bottom: 10px;
		display: inline !important;
		justify-content: center;
	}
	
	.productImg{
		width: 100px;
		height: 100px;
	
	}
	
	.productInfoDetail{
		display: flex !important;
		float: right;
	}
	
	.bucketTable{
		background: white;
		border-radius: 2px;
		margin: 10px 10px 0 10px;
		
		vertical-align: middle;
	}
	
	input{
		text-align: right;
		width:50%;
	}

</style>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header"><c:out value="${member.memName}" /> 님의 장바구니</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>

<div class="container">
	<div class="row bucketContainer container">

		<div class="bucketContainer">
			<table class="bucketTable table table-hover">
				<thead>
				<tr>
					<th>
						상품 이미지
					</th>
					<th>
						상품명
					</th>
					<th>
						재고
					</th>
					<th>
						가격
					</th>
					<th>
					</th>
				</tr>
				</thead>
				<c:if test="${empty productList}" >
					<tr>
						<td colspan="4" style="left: 50%">
							<img src="../../../resources/imgs/Bucket-icon.png" style="width: 50%; margin-left: 30%">
						</td>
						<td>
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
				</c:if>
				<c:if test="${not empty productList}" >
					<c:forEach items="${productList}" var="product">
						<tr data-pdNum='${product.pdNum}'>
							<td>
								<img class="productImg" src="../../../resources/imgs/AniBucket-1.png" class="card-img-top" alt="...">
							</td>
							<td class="product productName">
								${product.pdName}
							</td>
							<td class="product productStock">
								${product.pdStock}개
							</td>
							<td class="product productPrice">
								<input type="text" class="price" readonly="readonly" value="${product.pdPrice}">원
							</td>
							<td>
								<form name="productInfoDetail" action="/buy" class="productInfoDetail" method="post">
									<input type="hidden" name="pdNum" value="${product.pdNum}" >
									<button id="btnBuy" type="submit" class="btn btn-danger btnBuy" >구매</button>
									<button id="btnDel" onclick="delBucket('${product.pdNum}')" type="button" class="btn btn-warning btnDel">제거</button>
								</form>
							</td>
						</tr>
					</c:forEach>
					<br>
					<br>
					<form action="/buy" method="post">
						<div style="display: flex; justify-content: flex-end;">
								<input name="totalPrice" id="totalPrice" value="" readonly="readonly" style="width: 30%"> 원
								<button type="submit" class="btn btn-danger">일괄 구매</button>
						</div>
					</form>
				</c:if>
			</table>
		</div>
	</div>
</div>

<script>


$(document).ready(function () {
		

})
	
	function totalPriceInsert(){
		
		var totalPrice = 0;
		$(".price").each(function() {
			console.log($(this).val());
			totalPrice += Number($(this).val());
			console.log(totalPrice);
		})
		
		$("#totalPrice").val(totalPrice);
	}
	
	totalPriceInsert();
	
	
	var btnDel = $("#btnDel");
	var memNum = "<c:out value='${member.memNum}' />";

	function delBucket(pdNum) {
		
		console.log(memNum);
		console.log(pdNum);
		
		$.ajax({
			type : 'post',
			url : '/bucket/delete/',
			datatype : 'text',
			data : {
				memNum : memNum,
				pdNum : pdNum
			},
			success : function(deleteResult, status, xhr) {
				console.log(deleteResult);
				alert('선택한 상품이 장바구니에서 제거되었습니다');
				location.reload();
			},
			error : function(xhr, status, er) {
				if(error){
					error(er);
				}
			}
		});
	}
	

</script>

<%@include file="../includes/footer.jsp"%>  