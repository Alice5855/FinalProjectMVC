<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="../includes/header.jsp" %> 

	<h1>에러페이지~~</h1>
	<h2 id="msg">${msg}</h2>
	
	<script type="text/javascript">
		alert(document.getElementById('msg').innerText);	//메세지 띄우기
		wiwdow.location.href = "${root}";	//홈화면으로 보내기
	</script>
</body>
<%@include file="../includes/footer.jsp" %> 