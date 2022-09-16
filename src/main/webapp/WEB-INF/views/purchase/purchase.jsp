<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- iamport.payment.js -->
<script type="text/javascript"
src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<%@include file="../includes/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.purchaseContainer{
	width: 90%;
	height: 90%;
}

.purchaseBox{
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

.customInput{
    border: 1px solid #4a75d4;
    padding-left: 1rem;
}

.unClickAble{
	background-color: #4a75d4;	
	color: white;
}

.purchaseTable{
	margin-left: auto;
	margin-right: auto;
	margin-top: 1rem;
	border-spacing: 5px;
}

.purchaseForm{
	padding-top: 1rem;
}

td:first-child {
	padding-right: 2rem;
	text-align: right;
	padding-top: 4%;
/* 	border-right: 2px solid #4A75D4; */
}
th, td{
	vertical-align: text-bottom;
}

.btnBuy{
	margin-right: auto;
	margin-left: auto;
}

.btnBuyContainer{
	margin-right: auto;
	margin-left: auto;
	width: fit-content;
	margin-top:3rem;
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

.purchaseTitle{
	width: fit-content;
	margin-left: auto;
	margin-right: auto;
	font-weight: 700;
	color: #4A75D4;

}

.borderBottom{
    border-bottom: 2px solid #4A75D4;
    padding-bottom: 1rem;
}

@media (max-width: 500px) {

	.purchaseContainer{
	    padding-left: 0px;
   		padding-right: 0px;
   		margin-left: 0px;
   		margin-right: 0px;
   		width: 100%;
	}
	
	.container-fluid{
	    padding-left: 0px !important;
   		padding-right: 0px !important;
	}
	
	.purchaseBox{
		width: 100%;
	}
	
	td:first-child {
		padding-right: 0rem;
	}
	
	td:last-child {
		width:fit-content;
		padding-left: 0.5rem;
	}
	
	input{
		width:100%;
	}
	
	.purchaseForm{
		padding-right: 0.5rem;
	}

}


</style>

</head>
<body>
	<div class="container purchaseContainer">
		<div class="purchaseBox">
			<div class="borderBottom">
				<h1 class="purchaseTitle pt-2">
					결 제
				</h1>
			</div>
			<form class="purchaseForm">
				<c:if test="${not empty product}" >
					<input  class="pdNum" value="${product.pdNum}" type="hidden">
				</c:if>
				<c:if test="${empty product}" >
					<input  class="pdNum" value="0" type="hidden">
				</c:if>
				<table class="purchaseTable">
					<thead>
						<tr>
							<td>
								상품명
							</td>
							<td>
								<c:if test="${not empty product}" >
									<input readonly="readonly" class="pdName unClickAble customInput" value="${product.pdName}" type="text">
								</c:if>
								<c:if test="${empty product}" >
									<input readonly="readonly" class="pdName unClickAble customInput" value="AniBucket 상품" type="text">
								</c:if>
							</td>
						</tr>
						<tr>
							<td>
								구매자
							</td>
							<td>
								<input class="memName customInput" value="${member.memName}" type="text">
							</td>
						</tr>
						<tr>
							<td>
								배송지
							</td>
							<td>
								<input class="memAddr customInput" value="${member.memAd}" type="text">
							</td>
						</tr>
						<tr>
							<td>
								이메일
							</td>
							<td>
								<input class="memEmail customInput" value="${member.memEmail}" type="text">
							</td>
						</tr>
						<tr>
							<td>
								연락처
							</td>
							<td>
								<input class="memPh customInput" value="${member.memPh}">
							</td>
						</tr>
						<tr>
							<td>
								닉네임
							</td>
							<td>
								<input readonly="readonly" class="unClickAble customInput" value="${member.memNickname}">
							</td>
						</tr>
						<tr>
							<td>
								금액
							</td>
							<td>
								<c:if test="${not empty product}" >
									<input class="price unClickAble customInput" readonly="readonly" value="${product.pdPrice}">
								</c:if>
								<c:if test="${empty product}" >
									<input readonly="readonly" class="unClickAble customInput" value="${totalPrice}">
								</c:if>
							</td>
						</tr>
						
					</thead>
				</table>
			</form>
			<div class="btnBuyContainer">
				<button class="w-btn-neon2" type="button" onclick="fn_buy()">결제하기</button>
			</div>
			<br><br>
			<a href="/">[처음으로]</a>
		</div>
	</div>
	
	
</body>

<script>

	function comma() {
		$(".price").each(function() {
			var changeNum = $(this).val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(this).val(changeNum);
		})
	}
	
	comma();	

	function fn_buy() {

		var pdNum = 0;
		var price = 0;
		if($('.pdNum').val() != 0){
			pdNum = $('.pdNum').val();
			price = "<c:out value='${product.pdPrice}' />";
		}else{
			price = "<c:out value='${totalPrice}' />";
		}
		changePrice = price.replace(/[^\d]+/g, '');
		
		
		var IMP = window.IMP;
		IMP.init("imp80124684"); // Insert your Code 부분에 자신의 아임포트 "가맹점 식별코드" 입력 바랍니다.
		IMP.request_pay({
			pg : "html5_inicis",
			pay_method : "card",
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : $('.pdName').val(),
			amount : changePrice,
			buyer_email : $('.memEmail').val(),  // buyer_email도 수정하기 바랍니다.
			buyer_name : $('.memName').val(),
			buyer_tel : $('.memPh').val(),
			buyer_addr : $('.memAddr').val(),
			buyer_postcode : "0000",
			m_redirect_url : "/"
		}, function(rsp) {
			if (rsp.success) {
				var paymentInfo = {
						imp_uid : rsp.imp_uid,
						merchant_uid : rsp.merchant_uid,
						paid_amount : rsp.paid_amount,
						apply_num : rsp.apply_num,
						paid_at : new Date(),
						paid_email : $('.memEmail').val(),
						pdNum : pdNum,
						pcAddress : $('.memAddr').val(),
						pcTel : $('.memPh').val()
					};
				$.ajax({
					url : "/paymentProcess.do",
					method : "POST",
					contentType : "application/json",
					data : JSON.stringify(paymentInfo), 
					success:function (data,textStatus){
				    	 console.log(paymentInfo);	
				    	 alert("결제가 완료되었습니다.");
				    	 location.href = "/";
				     },
					error : function(e) {
						console.log(e);
					}
				})
			} else {
				alert("결제 실패 : " + rsp.error_msg);
			}
		});
	}
</script>
<%@include file="../includes/footer.jsp" %>
</html>