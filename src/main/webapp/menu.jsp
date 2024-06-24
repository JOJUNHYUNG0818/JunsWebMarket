<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<nav class = "navbar navbar-expand navbar-dark bg-dark">
   <div class = "container">
    <div class="navbar-header">
     <a class="navbar-brand" href="/webMarket/welcome.jsp">Home</a>
    </div>
   </div>
      <div>
    	<ul class="navbar-nav mr-auto">
    		<li class="nav-item"><a class="nav-link" href="./products.jsp">상품목록</a></li>
    	</ul>
    </div>
          <div>
    	<ul class="navbar-nav mr-auto">
    		<li class="nav-item"><a class="nav-link" href="./addProduct.jsp">상품추가</a></li>
    	</ul>
    </div>
    
   <div class="navbar-header">
     <a class="navbar-brand" href="/webMarket/products.jsp">전체상품</a>
    </div>

       <div class="navbar-header">
     <a class="navbar-brand" href="/webMarket/board/boardList.jsp">게시판</a>
    </div>
   
    <div class="navbar-header">
     <a class="navbar-brand" href="/webMarket/member/memberInfo.jsp">회원정보(관리자)</a>
   </div>
   
   <%
		//session 가져오기
		String name = (String)session.getAttribute("name");
   		String id = (String)session.getAttribute("id");
   		String loginOK = "로그인";
   		
   		if(name != null){
   			loginOK = name + "님 "; 
   			
   	%>
   	     <div class="navbar-header">
     <%=loginOK %> &nbsp; &nbsp; <a class="navbar-brand" href="/webMarket/member/logOut.jsp">로그아웃</a>
   </div>
   	<% 		
   		}
   		else {
   			loginOK = "로그인";
   		
    %>
       <div class="navbar-header">
      <a class="navbar-brand" href="/webMarket/member/login.jsp"><%=loginOK %></a>
   </div>
    <%
    
   		}
    %>
    

  </nav>
	
</body>
</html>