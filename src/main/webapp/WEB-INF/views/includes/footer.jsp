<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
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
	<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top mx-4">
		<p class="col-md-4 mb-0 text-muted">&copy; 2022 Alternative Society, Inc</p>
		
		<a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
			<img class="img-fluid" alt="Logo" src="/resources/imgs/AniBucket-logos_transparent.png" width="90px" height="90px">
		</a>
		
		<ul class="nav col-md-4 justify-content-end">
			<li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Notice</a></li>
			<li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Community</a></li>
			<li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
			<li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
		</ul>
	  </footer>
</body>
</html>