<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap.min.css"/>
</head>
<body>

		<jsp:include page="../menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
		  <h1 class="display-3">회원가입</h1>
	</div>
  </div>
   <div class="container">
  	<form action="processJoin.jsp" name ="login" class = "form-horizontal" method="post">
  	 <div class="form-group row">
  	  <label class="col-sm-2">아이디</label>
  	   <div class="col-sm-3">
  	    <input type="text" name="id" id="id" placeholder="아이디입력" class="form-control">
  	  </div>
  	 </div>
  	<div class="form-group row">
  	  <label class="col-sm-2">비밀번호</label>
  	   <div class="col-sm-3">
  	    <input type="password" name="pwd" id="pwd" class="form-control" placeholder="비밀번호 입력">
  	  </div>
  	 </div>
  	   	<div class="form-group row">
  	  <label class="col-sm-2">이름</label>
  	   <div class="col-sm-3">
  	    <input type="text" name="name" id="name" class="form-control" placeholder="이름 입력">
  	  </div>
  	 </div>
  	   	<div class="form-group row">
  	  <label class="col-sm-2">이메일</label>
  	   <div class="col-sm-3">
  	    <input type="text" name="email" id="email" class="form-control" placeholder="이메일 입력">
  	  </div>
  	 </div>
  	 
  	 <div class= "form-group row">
 	 <div class="col-sm-offset-10  col-md-10">
 	  <input type="submit" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
 	  <input type="reset" class="btn btn-danger" value="취소">
 	 </div>
 	</div> 	  	 
 </form>
  	</div>

</body>
</html>