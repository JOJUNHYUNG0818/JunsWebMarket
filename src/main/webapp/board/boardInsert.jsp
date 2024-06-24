<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글입력 페이지(boardInsert.jsp)</title>
<link rel="stylesheet" href="./css/bootstrap.min.css"/>
</head>
<body>
	<%	
		LocalDate now = LocalDate.now();
		String writer = (String)session.getAttribute("name");
	%>
		<jsp:include page="../menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
		  <h1 class="display-3">게시글 입력</h1>
	</div>
  </div>
   <div class="container">
  	<form action="processBoardInsert.jsp" name ="login" class = "form-horizontal" method="post">
  	
  	 <div class="form-group row">
  	  <label class="col-sm-2">제 목</label>
  	   <div class="col-sm-3">
  	    <input type="text" name="title" id="tltie" placeholder="제목 입력" class="form-control">
  	  </div>
  	 </div>
  	<div class="form-group row">
  	  <label class="col-sm-2">글내용</label>
  	   <div class="col-sm-3">
  	   <textarea rows="10" cols="50" name = "content" placeholder="글 입력" class="form-control"></textarea>
  	  </div>
  	 </div>
  	 <div class="form-group row">
  	  <label class="col-sm-2">작성자</label>
  	   <div class="col-sm-3">
  	    <input type="text" name="writer" id="writer"  value="<%=writer %>" class="form-control">
  	  </div>
  	 </div>
  	 	 <div class="form-group row">
  	  <label class="col-sm-2">작성일</label>
  	   <div class="col-sm-3">
  	    <input type="text" name="regdate" id="regdate"  value="<%=now %>" class="form-control">
  	  </div>
  	  </div>
  	 <div class= "form-group row">
 	 <div class="col-sm-offset-10  col-md-10">
 	  <input type="submit" class="btn btn-primary" value=저장 >
 	  <a href="boardList.jsp" class="btn btn-danger">뒤로가기</a>
 	 </div>
 	</div> 	  	 
 </form>
  	</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>