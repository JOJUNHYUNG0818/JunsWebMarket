<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
  	<%@ include file = "menu.jsp" %>
	<%!String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
	   String tagline = "Welcome to Wep Market!"; 
	  %>
	<div class="jumbotron">
	<div class="container">
	 <h1 class="display-3"><%=greeting%></h1>
 </div>	
</div>
<main role="main">
 <div class="container">
  <div class="text-center">
   <h3><%=tagline%></h3>
 
  <%  Date day= new Date(); 
  	  String am_pm;
  	  int year = day.getYear()-100;
  	  int mon = day.getMonth()+1;
  	  int dy = day.getDay();
  	  int hour = day.getHours();
  	  int minute = day.getMinutes();
  	  int second = day.getSeconds();
  	  if(hour/12 ==0)am_pm = "AM";
  	  else am_pm="PM";
  	  String ct = hour + ":" + minute + ":" + second + "" + am_pm;
  	  String dt = year + "-" + mon + "-" + dy;
  	  
  	  %>
  	  <br>
  	  <h5><%out.println("방문 날짜 : "+dt); %></h5>
  	  <h5><%out.println("방문 시간 : "+ct); %></h5>
  	  </div>
 </div>
</main>
<%@ include file = "footer.jsp" %>
</body>
</html>