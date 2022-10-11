<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>

	<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top mx-4">
		<p class="col-md-4 mb-0 text-muted footercopy">&copy; 2022 Alternative Society, Inc</p>
		
		<a href="http://192.168.0.32:3000/" class="footerlogo col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
			<img class="img-fluid" alt="Logo" src="/resources/imgs/AniBucket-logos_transparent2.png" width="90px" height="90px">
		</a>
		
		<ul class="footerul nav col-md-4 justify-content-end">
			<li class="nav-item"><a href="http://192.168.0.32:3000/Notice" class="nav-link px-2 text-muted">Notice</a></li>
			<li class="nav-item"><a href="http://192.168.0.32:3000/Community" class="nav-link px-2 text-muted">Community</a></li>
			<li class="nav-item"><a href="http://192.168.0.32:3000/QnA" class="nav-link px-2 text-muted">Q&A</a></li>
			<li class="nav-item"><a href="http://192.168.0.32:3000/About" class="nav-link px-2 text-muted">About</a></li>
		</ul>
	</footer>
</body>
</html>