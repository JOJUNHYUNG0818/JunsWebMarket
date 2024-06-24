<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 입력처리 페이지(boardList.jsp)</title>
<link rel="stylesheet" href="./css/bootstrap.min.css"/>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		String regdate = request.getParameter("regdate");
		Date regdate1 = Date.valueOf(regdate);
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2. con 으로 연결하기
		String url="jdbc:mysql://localhost:3306/webMarket?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String userId="root";
		String userPwd="1234";
		Connection con =DriverManager.getConnection(url, userId, userPwd);
		
		// 3.sql 작성하기 con 올리기
		String insertSql = "insert into boardtbl(num,title,content,writer,reg_date,count) values(null,?,?,?,?,1)";
		PreparedStatement pstmt=con.prepareStatement(insertSql);
		
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, writer);
		pstmt.setDate(4, regdate1 );
		
		// 4. mysql으로 보내서 실행하기
		pstmt.executeUpdate();
		
		response.sendRedirect("/webMarket/board/boardList.jsp");
	
	
	%>
		<jsp:include page="../menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
		  <h1 class="display-3">게시글 입력처리</h1>
	</div>
  </div>
   <div class="container">
 </div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>