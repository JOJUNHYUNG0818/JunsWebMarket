<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
	
		// 1.드라이버 연결하기
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2. con 으로 연결하기
		String url="jdbc:mysql://localhost:3306/webMarket?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String userId="root";
		String userPwd="1234";
		Connection con =DriverManager.getConnection(url, userId, userPwd);
		
		// 3.sql 작성하기 con 올리기
		String selectSql = "select *from membertable where id=? and pwd=?";
		PreparedStatement pstmt=con.prepareStatement(selectSql);
		
		// 4. ? 채우기
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		
		// 5. mysql으로 보내서 실행하기
		ResultSet rs = pstmt.executeQuery();
		
		// 6. 받아온 rs를 포인터로 위치하고 필드(열)를 가져오기
		
		String dbId ="";
		String dbPwd ="";
		String dbName ="";
		
		if(rs.next()){
			dbId=rs.getString("id");
			dbPwd=rs.getString("pwd");
			dbName=rs.getString("name");
			
			//섹션 만들기
			session.setAttribute("name", dbName); // 섹션명,섹션값
			session.setAttribute("id", dbId);
			
			response.sendRedirect("loginSuccess.jsp");
			
		}
		else if(id.isBlank()|| pwd.isBlank()){
			response.sendRedirect("login.jsp");
		}
		else{
			response.sendRedirect("loginFail.jsp");
		}
		
		
	%>

</body>
</html>