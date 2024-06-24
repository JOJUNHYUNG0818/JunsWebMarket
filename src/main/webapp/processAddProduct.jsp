<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String fileName = "";
		String realFolder = "D:\\ai\\study\\jsp_study\\webMarket\\src\\main\\webapp\\images";
		// 프로그램에서 윈도우 경로를 표시하려면 "\\" 두개를 해줘야함 또는 "/"
		int maxSize =5*1024*1024; // 파일의 크기 5MB
		String encType="utf-8";
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy() );
		
	
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String manufacturer = multi.getParameter("manufacturer");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String condition = multi.getParameter("condition");
		
		// 가격
		Integer price;
		
		if(unitPrice.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(unitPrice);
		
		// 재고수
		long stock;
		
		if(unitsInStock.isEmpty())
			stock = 0;
		else
			stock = Long.valueOf(unitsInStock);
		
		Enumeration<String> files = multi.getFileNames();
		String fname = (String)files.nextElement();
		String fileName1 =multi.getFilesystemName(fname);
		
		
		// 자바안에 자료넣기
		ProductRepository dao = ProductRepository.getInstance(); // ProductRepository 주소 가져옴
		
		Product newProduct = new Product();
		newProduct.setProductId(productId);
		newProduct.setPname(name);
		newProduct.setUnitPrice(price);
		newProduct.setDescription(description);
		newProduct.setManufacturer(manufacturer);
		newProduct.setCategory(category);
		newProduct.setUnitsInStock(stock);
		newProduct.setCondition(condition);
		newProduct.setFilename(fileName1);
		
		dao.addProduct(newProduct);
		
		response.sendRedirect("products.jsp");
		
		
	%>
</body>
</html>