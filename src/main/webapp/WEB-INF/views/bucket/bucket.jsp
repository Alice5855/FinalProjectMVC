<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../includes/header.jsp"%>
<style>
/* .bucketContainer { */
/* 	width: 90%; */
/* 	height: 100%; */
/* 	background: aqua; */
/* 	justify-content: center; */
/* 	display: flex; */
/* 	overflow: auto; */
/* 	flex-direction: column-reverse; */
/* 	overflow-x: hidden; */
/* 	align-content: center; */
/* } */

body{
	overflow-x: hidden;
}

.bucketContainer {
	display: flex;
	flex-direction: column-reverse;
	border-radius: 50px;
}

.productInfo {
	width: 80%;
	height: 80px;
	margin-top: 10px;
	margin-bottom: 10px;
	display: inline !important;
	justify-content: center;
}

.productImg {
	width: 100px;
	height: 100px;
}

.productInfoDetail {
	display: flex !important;
	float: right;
}

.bucketTable {
	background: white;
	border-radius: 5px;
	margin: 10px 10px 0 10px;
	vertical-align: middle;
	text-align: center;
	
	border-collapse: collapse;
	border-style: hidden;
}

td>img {
	width: 100px !important;
	height: 100px;
}

th {
	display: inline-blcok;
	margin: auto;
}

.price{
	text-align: center;
	width: 35%;
	border: none;
}

#totalPrice{
	border: none;
	text-align: right;
	font-weight: 700;
}

.w-btn-neon2 {
    position: relative;
    border: none;
    min-width: 200px;
    min-height: 50px;
	background: linear-gradient( 169deg, rgba(74, 117, 217, 0.7) 0%, rgba(3, 57, 223, 1) 100% );	
    border-radius: 1000px; 
    color: white;
    cursor: pointer;
    font-weight: 700;
    transition: 0.3s;
}

.w-btn-neon2:hover {
    transform: scale(1.2);
}

.w-btn-neon2:hover::after {
    content: "";
    width: 30px;
    height: 30px;
    border-radius: 100%;
    border: 6px solid #4a75d4;
    position: absolute;
    z-index: -1;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation: ring 1.5s infinite;
}

@keyframes ring {
    0% {
        width: 30px;
        height: 30px;
        opacity: 1;
    }
    100% {
        width: 300px;
        height: 300px;
        opacity: 0;
    }
}

th{
	background-color: #4a75d4 !important;
	color: white;
}

h3{
	text-align: center;
}

#totalPrice{
	width: 25%;
}

.col-lg-12{
    width: fit-content;
    margin: 0 auto 0 auto;
    font-weight: 800;
}

.page-header{
	font-weight: 800;
}

.btn{
	border-radius: 0px !important;
}

#btnBuy{
	background-color: #4A75D4;
	color: white;
}

#btnDel{
	border: 2px solid black;
	font-size: 0.9rem;
}

.mobileTextChange:after {
		content: "상품 이미지";
	}

@media (max-width: 425px) {
	
	.container{
		padding-right:0px;
	}
	
	.w-btn-neon2{
		width: 150px;
	}


	.mobileHidden{
	   display: none;
 	   visibility: hidden;
	   width: 0%;
	}
	
	.container-fluid{
		padding-right: 0px;
		padding-left: 0px;
		overflow: hidden;
	}
	
	.productInfoDetail{
	    flex-direction: column;
	}
	
	.btnTD{
		width:21%;
	}
	
	.price{
		width: 65%;
	}
	
	td> img{
		width: 40px !important;
		height: 40px;
	}
	
	.mobileTextChange:after {
		text-indent: 0px;
		content: "상품";
	}
	
	.bucketContainer{
		padding-right: 5px;
		padding-left: 5px;
		margin-left: 0px;
	}
	
	.bucketTable{
		margin: 0px;
	}
	
	.container{
		padding-left: 0px;
	}
	
	#totalPrice{
		width: 70%;
	}
	
	.productPrice{
		width: 34%;
	}

}

</style>

<div class="container-fluid">
<div class="row">
	<div class="col-lg-12" style="text-align: center; color: rgb(74, 117, 212); font-weight: 700;">
		<h1 class="page-header">
			<c:out value="${member.memName}" />
			님의 장바구니
		</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>

<div class="container">
	<div class="row bucketContainer container">

		<div class="bucketContainer">
			<table class="bucketTable table table-hover">
				<thead>
					<tr>
						<th class="mobileTextChange"></th>
						<th>상품명</th>
						<th class="mobileHidden">재고</th>
						<th>가격</th>
						<th></th>
					</tr>
				</thead>
				<c:if test="${empty productList}">
					<tr>
						<td colspan="4" ><img
							src="../../../resources/imgs/Bucket-icon.png"
							style="width: 30% !important; height: 50% !important;"></td>
					</tr>
				</c:if>
				<c:if test="${not empty productList}">
					<c:forEach items="${productList}" var="product">
						<tr data-pdNum='${product.pdNum}'>
							<td><img class="card-img-top"
								src="/product/display?fileName=${product.pdPath}"
								alt="product image" /></td>
							<td class="product productName">${product.pdName}</td>
							<td class="product productStock mobileHidden">${product.pdStock}개</td>
							<td class="product productPrice">
							<input type="text" class="price" readonly="readonly" value="${product.pdPrice}">원
							</td>
							<td class="btnTD">
								<form name="productInfoDetail" action="/buy"
									class="productInfoDetail" method="post">
									<input type="hidden" name="pdNum" value="${product.pdNum}">
									<button id="btnBuy" type="submit" class="btn btnBuy">구매</button>
									<button id="btnDel" onclick="delBucket('${product.pdNum}')"
										type="button" class="btn btnDel">제거</button>
								</form>
							</td>
						</tr>
					</c:forEach>
					<br>
					<br>
					<form action="/buy" method="post">
						<div style="display: flex; justify-content: flex-end; align-items: center; margin-top: 20px; text-align: center">
							<h3>총 결제 금액 : <input name="totalPrice" id="totalPrice" value=""
								readonly="readonly" > 원 </h3>
							<button type="submit" class="w-btn-neon2">일괄 구매</button>
						</div>
					</form>
				</c:if>
			</table>
		</div>
	</div>
</div>
</div>

<script>

	
	function totalPriceInsert(){
		
		var totalPrice = 0;
		$(".price").each(function() {
			console.log($(this).val());
			totalPrice += Number($(this).val());
			console.log(totalPrice);
		})
		var changeNum = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#totalPrice").val(changeNum);
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
	
	function comma() {
		$(".price").each(function() {
			var changeNum = $(this).val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(this).val(changeNum);
		})
	}
	
	comma();	
	
</script>

<%@include file="../includes/footer.jsp"%>