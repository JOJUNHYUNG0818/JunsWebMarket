<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
	<script type="text/javascript">
		window.onload=function(){
			alert("로그인 성공");
		}
	</script>
</head>
<body>
<h3>로그인성공</h3>
	<%
		response.sendRedirect("/webMarket/welcome.jsp");
		
	%>

	

</body>
</html>