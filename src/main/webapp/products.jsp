<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Product" %>
<%@ page import = "dao.ProductRepository" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삼풍목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	  <div class="jumbotron">
		<div class="container">
		  <h1 class="display-3">상품목록</h1>
	</div>
  </div>
  
  <jsp:useBean id="pr" class = "dao.ProductRepository"></jsp:useBean>
<%
	ProductRepository dao = ProductRepository.getInstance();
	ArrayList<Product> op =dao.getAllProducts();
%>
<div class="container">
	<div class="row" align= "center">
<%-- 		<%@ include file = "dbconn.jsp" %>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()){
		%>
		<div class = "col-md-4">
			<img src="${pageContext.request.contextPath}/images/<%=rs.getString("p_fileName") %>"
			style="width:100%">
			<h3><%=rs.getString("p_name")%></h3>
			<p><%=rs.getString("p_description") %>
			<p><%=rs.getString("p_UnitPrice") %>원
			<p><a href="./product.jsp?id=<%=rs.getString("p_id") %>"
			 class="btn btn-secondary" role="button">상세정보&raquo;</a>
		</div>
		<%
			}
		%>
		<% 
	if (rs !=null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	%> --%>
		<%
			for(int i=0; i<op.size(); i++){
				Product p= op.get(i); // 배열안에 주소를 가져온다.
		%>
		<div class = "col-md-4">
			<img src="${pageContext.request.contextPath}/images/<%=p.getFilename() %>" style="width:100%">
			${pageContext.request.contextPath} 서버에서 수행하는 경로 ~/webapp까지 
			<h3><%=p.getPname() %></h3>
			<h3><%=p.getDescription() %></h3>
			<h3><%=p.getUnitPrice() %></h3>
			<p>
			<a href="./product.jsp?id=<%=p.getProductId() %>" class="btn btn-secondary">상세정보&raquo;</a>
		</div>
		
		
		<%
		}
		%>
	</div>
	<hr>
</div>
<jsp:include page = "footer.jsp"/>
</body>
</html>