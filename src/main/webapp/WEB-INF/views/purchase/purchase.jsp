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
	background: red;
	width: 90%;
	height: 90%;
}

.purchaseBox{
	background: gray;
	width: 80%;
	height: 80%;
}

</style>

</head>
<body>
	<div class="container purchaseContainer">
		<div class="purchaseBox">
		
			<form>
				<c:if test="${not empty product}" >
					<input  class="pdNum" value="${product.pdNum}" type="hidden">
				</c:if>
				<c:if test="${empty product}" >
					<input  class="pdNum" value="0" type="hidden">
				</c:if>
				<table>
					<thead>
						<tr>
							<td>
								상품명
							</td>
							<td>
								<c:if test="${not empty product}" >
									<input readonly="readonly" class="pdName" value="${product.pdName}" type="text">
								</c:if>
								<c:if test="${empty product}" >
									<input readonly="readonly" class="pdName" value="AniBucket 상품" type="text">
								</c:if>
							</td>
						</tr>
						<tr>
							<td>
								배송자 명
							</td>
							<td>
								<input class="memName" value="${member.memName}" type="text">
							</td>
						</tr>
						<tr>
							<td>
								배송지
							</td>
							<td>
								<input class="memAddr" value="${member.memAd}" type="text">
							</td>
						</tr>
						<tr>
							<td>
								이메일
							</td>
							<td>
								<input class="memEmail" value="${member.memEmail}" type="text">
							</td>
						</tr>
						<tr>
							<td>
								연락처
							</td>
							<td>
								<input class="memPh" value="${member.memPh}">
							</td>
						</tr>
						<tr>
							<td>
								닉네임
							</td>
							<td>
								<input readonly="readonly" value="${member.memNickname}">
							</td>
						</tr>
						<tr>
							<td>
								결제 금액
							</td>
							<td>
								<c:if test="${not empty product}" >
									<input readonly="readonly" value="${product.pdPrice}">
								</c:if>
								<c:if test="${empty product}" >
									<input readonly="readonly" value="${totalPrice}">
								</c:if>
							</td>
						</tr>
						
					</thead>
				</table>
			</form>
			
			<button type="button" onclick="fn_buy()">결제하기</button>
			<br><br>
			<a href="/">[처음으로]</a>
		</div>
	</div>
	
	
</body>

<script>
	function fn_buy() {
		var pdNum = 0;
		var price = 0;
		if($('.pdNum').val() != 0){
			pdNum = $('.pdNum').val();
			price = "<c:out value='${product.pdPrice}' />";
		}else{
			price = "<c:out value='${totalPrice}' />";
		}
		
		
		
		var IMP = window.IMP;
		IMP.init("imp80124684"); // Insert your Code 부분에 자신의 아임포트 "가맹점 식별코드" 입력 바랍니다.
		IMP.request_pay({
			pg : "html5_inicis",
			pay_method : "card",
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : $('.pdName').val(),
			amount : price,
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
</html>