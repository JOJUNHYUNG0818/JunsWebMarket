<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정하기 DB연결(processModify.jsp)</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		//폼에 입력한 자료 받아오기
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		Integer number_1 = Integer.valueOf(number); // 형변환 str->integer
		int number_2 = number_1.intValue();         // // 형변환 integer->int
		
		// 1.드라이버 연결하기
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2. con 으로 연결하기
		String url="jdbc:mysql://localhost:3306/webMarket?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String userId="root";
		String userPwd="1234";
		Connection con =DriverManager.getConnection(url, userId, userPwd);
		
		// 3. sql문 작성하기
		String updateSql = "update membertable set id=? , pwd=? , name=? , email=? where number=? ";
		
		// 4. sql문 실행
		PreparedStatement pstmt= con.prepareStatement(updateSql);
		
		// 5. ? 채우기
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.setInt(5, number_2);
		pstmt.executeUpdate(); // 쿼리문을 실행하는 메소드
		
		response.sendRedirect("memberInfo.jsp");
		
	%>
	

</body>
</html>