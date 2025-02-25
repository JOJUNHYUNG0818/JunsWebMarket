<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 페이지(boardList.jsp)</title>
<link rel="stylesheet" href="./css/bootstrap.min.css"/>
</head>
<body>
<%
		// 1.드라이버 연결하기
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2. con 으로 연결하기
		String url="jdbc:mysql://localhost:3306/webMarket?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String userId="root";
		String userPwd="1234";
		Connection con =DriverManager.getConnection(url, userId, userPwd);
		
		// 3.sql 작성하기 con 올리기
		String selectSql = "select * from boardTbl order by num desc";
		PreparedStatement pstmt=con.prepareStatement(selectSql);
		
		// 4. mysql으로 보내서 실행하기
		ResultSet rs = pstmt.executeQuery();
		
		// 5. rs변수에 담겨서 select문이 jsp로 들어온다.
      	%>
	<jsp:include page="../menu.jsp"></jsp:include>
	 <div class="jumbotron">
		<div class="container">
		  <h1 class="display-3">게시글 리스트</h1>
	</div>
  </div>
   <div class="container">
 </div>
 <div class = "container">
  	<div style="padding-top: 50px">
  		<table class ="table table-hover">
  		<tr>
  			<th>글번호</th>
  			<th>제 목</th>
  			<th>작성자</th>
  			<th>작성일</th>
  			<th>조회수</th>
  			<th>수 정</th>
  			<th>삭 제</th>
  		</tr>
  		<%
  			while(rs.next()){  // rs.next() 포인터 위치를 가르키는 명령어 (중요)
  							   // 한줄을 출력하더라도 반드시 rs.next() 해주어야한다.
  		%>
  		<tr>
  			<td><%=rs.getInt("num") %></td> <%-- mysql 컬럼명 --%>
  			<td><a href="boardDetail.jsp?num=<%=rs.getInt("num")%>&title=<%=rs.getString("title")%>&content=<%=rs.getString("content")%>
  			 								&writer=<%=rs.getString("writer")%>&regdate=<%=rs.getString("reg_date")%>
  			 								&count=<%=rs.getString("count")%>"> <%=rs.getString("title") %></a></td>
  			<td><%=rs.getString("writer") %></td>
  			<td><%=rs.getDate("reg_date") %></td>
  			<td><%=rs.getInt("count") %></td>
  			<td><a href="boardModify.jsp?num=<%=rs.getInt("num") %>&title=<%= rs.getString("title") %>&content=<%= rs.getString("content")%>&writer=<%= rs.getString("writer") %>&regdate=<%= rs.getDate("reg_date") %>&count=<%= rs.getInt("count") %>"  class="btn btn-primary"  >    
                      수정 </a> </td>
  			<td><a href="boardDelete.jsp?num=<%=rs.getInt("num") %>" class="btn btn-danger">삭제</a></td>
  		</tr>
  		<%
  			}
  		
  		%>
  	</table>
  	<a href="boardInsert.jsp" class="btn btn-success">글쓰기</a>
  </div>
  </div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>