<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지(boardDetail.jsp)</title>
<link rel="stylesheet" href="./css/bootstrap.min.css"/>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String num = request.getParameter("num");
		String title =request.getParameter("title");
		String content =request.getParameter("content");
		String writer = request.getParameter("writer");
		String regdate = request.getParameter("regdate");
		String count = request.getParameter("count");
		
		//?num=1&title=가입인사&content=잘부탁드립니다%20%20%20&writer=홍길동&regdate=2024-01-30%20%20%20&count=1
	%>


		<jsp:include page="../menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
		  <h1 class="display-3">상세페이지</h1>
	</div>
  </div>
   <div class="container">
  	<div style="padding-top: 50px">
  	
  		<table class ="table table-hover">
  		
  		<tr>
  			<th>글번호</th>
  			<th>제 목</th>
  			<th>글내용</th>
  			<th>작성자</th>
  			<th>작성일</th>
  			<th>조회수</th>
  		</tr>
  
  		<tr>
  	
  			<td><%=num %></td>
			<td><%=title %></td>
			<td><%=content %></td>
			<td><%=writer %></td>
			<td><%=regdate %></td>
			<td><%=count %></td>
  		</tr>
  	</table>
 
  </div>
  </div>
  <%	
  		Integer count1 = Integer.valueOf(count) +1 ;
  		int count2 = count1.intValue();
  				
  		Integer num1 = Integer.valueOf(num);
  		int num2 = num1.intValue();
  		
		//1.드라이버 연결하기
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2. con 으로 연결하기
		String url="jdbc:mysql://localhost:3306/webMarket?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String userId="root";
		String userPwd="1234";
		Connection con =DriverManager.getConnection(url, userId, userPwd);
		
		// 3. sql문 작성하기
		String updateSql = "update boardTbl set count=? where num=?";
		
		// 4. sql문 실행
		PreparedStatement pstmt= con.prepareStatement(updateSql);
		
		// 5. ? 채우기
		pstmt.setInt(1, count2);
		pstmt.setInt(2, num2);
		
		pstmt.executeUpdate(); // 쿼리문을 실행하는 메소드
  %>
  
  	<a href="boardList.jsp" class="btn btn-primary">돌아가기</a>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>