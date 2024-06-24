<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폴더 ./member/login.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
		<jsp:include page="../menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
		  <h1 class="display-3">로그인</h1>
	</div>
  </div>
   <div class="container">
   
  	<form action="processLogin.jsp" name ="login" class = "form-horizontal" method="post">
  	 <div class="form-group row">
  	  <label class="col-sm-2">아이디</label>
  	   <div class="col-sm-3">
  	    <input type="text" name="id" id="id" placeholder="아이디입력" class="form-control">
  	  </div>
  	 </div>
  	<div class="form-group row">
  	  <label class="col-sm-2">비밀번호</label>
  	   <div class="col-sm-3">
  	    <input type="password" name="pwd" id="pwd" class="form-control">
  	  </div>
  	 </div>
  	 <div class= "form-group row">
 	 <div class="col-sm-offset-10  col-md-10">
 	  <input type="submit" class="btn btn-primary" value="로그인" >
 	  <input type="reset" class="btn btn-danger" value="취소">
 	  <a href="join.jsp" class="btn btn-success">회원가입하기</a>
 	 </div>
 	</div> 	  	 
 </form>
  	</div>
</body>
</html>