<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정하기 페이지(modify.jsp)</title>
<link rel="stylesheet" href="./css/bootstrap.min.css"/>
</head>
<body>
	<%
	String n1 = request.getParameter("number");
	Integer n2 = Integer.valueOf(n1);
	int n3 = n2.intValue();
	
	
	// 1.드라이버 연결하기
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2. con 으로 연결하기
	String url="jdbc:mysql://localhost:3306/webMarket?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	String userId="root";
	String userPwd="1234";
	Connection con =DriverManager.getConnection(url, userId, userPwd);
	
	// 3.sql 작성하기 con 올리기
	String selectSql = "select * from memberTable where number=? ";
	PreparedStatement pstmt=con.prepareStatement(selectSql);
	
	pstmt.setInt(1, n3);
	
	// 4. mysql으로 보내서 실행하기
	ResultSet rs = pstmt.executeQuery();
	
	// 5. rs변수에 담겨서 select문이 jsp로 들어온다.
	while(rs.next()){
		
	%>

	<jsp:include page="../menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
		  <h1 class="display-3">회원 정보 수정</h1>
	</div>
  </div>
   <div class="container">
  	<form action="processModify.jsp?number=<%=rs.getInt("number") %>" name ="login"  class = "form-horizontal" method="post">
  	 <div class="form-group row">
  	  <label class="col-sm-2">아이디</label>
  	   <div class="col-sm-3">
  	    <input type="text" name="id" id="id" value="<%=rs.getString("id")%>" placeholder="아이디입력" class="form-control">
  	  </div>
  	 </div>
  	<div class="form-group row">
  	  <label class="col-sm-2">비밀번호</label>
  	   <div class="col-sm-3">
  	    <input type="password" name="pwd" id="pwd" value="<%=rs.getString("pwd")%>" class="form-control" placeholder="비밀번호입력">
  	  </div>
  	 </div>
  	   	<div class="form-group row">
  	  <label class="col-sm-2">이름</label>
  	   <div class="col-sm-3">
  	    <input type="text" name="name" id="name" value="<%=rs.getString("name")%>" class="form-control" placeholder="이름 입력" >
  	  </div>
  	 </div>
  	   	<div class="form-group row">
  	  <label class="col-sm-2">이메일</label>
  	   <div class="col-sm-3">
  	    <input type="text" name="email" id="email"  value="<%=rs.getString("email")%>" class="form-control" placeholder="이메일 입력">
  	  </div>
  	 </div>
  	 
  	 <div class= "form-group row">
 	 <div class="col-sm-offset-10  col-md-10">
 	  <input type="submit" class="btn btn-primary" value="수정" onclick="CheckAddProduct()">
 	  <input type="reset" class="btn btn-danger" value="취소">
 	 </div>
 	</div> 	  	 
 </form>
  	</div>
  		<%
	}
	
	%>
	 <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>