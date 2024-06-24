<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼 자료 DB입력하기</title>
</head>
<body>
	<%
		// 1) mysql 드라이버를 jvm에 올려주기
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2) connection 맺기
	      // mysql 연결 주소
		String url="jdbc:mysql://localhost:3306/webMarket?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false"; 
		//jdbc:mysql://localhost:3306/DB명?useUnicode=true&characterEncoding=utf8
		String userid="root";   // mysql 사용자 아이디
		String passwd="1234";   // mysql 사용자 비밀번호
		Connection con=DriverManager.getConnection(url, userid, passwd);
		
		// 3) SQL문 작성하기
		String insertSql = "insert into memberTable(number,id,pwd,name,email) values(null,?,?,?,?)";
		
		// 4) ?안에다가 폼에 입력 받은 실제 내용을 넣는다.
		// 폼에 입력 받은 자료를 가져오기
		request.setCharacterEncoding("utf-8"); // 한글 처리
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		// 5) ?안에 실제 내용 넣기
		PreparedStatement pstmt =con.prepareStatement(insertSql); // 연결된 상태위에 sql문 올리기
		pstmt.setString(1, id); // 1번 물음표에 id갑을 넣기
		pstmt.setString(2, pwd); 
		pstmt.setString(3, name); 
		pstmt.setString(4, email);
		
		pstmt.executeUpdate(); // 6) 보내서 mysql에서 실행시키기 
		response.sendRedirect("/webMarket/welcome.jsp");
	%>

</body>
</html>