<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
</head>
<body>
	<h3>로그인 실패</h3>
	<%
		response.sendRedirect("/webMarket/member/login.jsp");
		
	%>


	<script type="text/javascript">
		window.onload=function(){
			alert("로그인 실패");
		}
	</script>
	

</body>
</html>