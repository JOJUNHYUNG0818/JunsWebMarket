<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제페이지(boardList.jsp)</title>
<link rel="stylesheet" href="./css/bootstrap.min.css"/>
</head>
<body>
	<%
		String num = request.getParameter("num");
	
		Integer number_1 = Integer.valueOf(num); // 형변환 str->integer
		int number_2 = number_1.intValue();         // // 형변환 integer->int
	
		// 1.드라이버 연결하기
		Class.forName("com.mysql.jdbc.Driver");
	
		// 2. con 으로 연결하기
		String url="jdbc:mysql://localhost:3306/webMarket?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String userId="root";
		String userPwd="1234";
		Connection con =DriverManager.getConnection(url, userId, userPwd);
	
		// 3. sql문 작성하기
		String deleteSql = "delete from boardTbl where num=?";
	
		// 4. sql문 실행
		PreparedStatement pstmt= con.prepareStatement(deleteSql);
	
		// 5. ? 채우기
		pstmt.setInt(1, number_2);
	
		pstmt.executeUpdate(); // 쿼리문을 실행하는 메소드
	
		response.sendRedirect("/webMarket/board/boardList.jsp");
	%>
		<jsp:include page="../menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
		  <h1 class="display-3">게시글 삭제</h1>
	</div>
  </div>
   <div class="container">
   
   
 </div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>