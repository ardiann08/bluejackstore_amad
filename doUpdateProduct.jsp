<%@include file="../helper/connect.jsp"%>
<%@page import="java.util.*" %>

<%
	Random rand = new Random();
	int n = rand.nextInt(2);
	String productid = request.getParameter("id");
	String name = request.getParameter("name");
	String price = request.getParameter("price");
	String weight = request.getParameter("weight");
	String stock = request.getParameter("stock");
	String photo = request.getParameter("fPhoto");
	String [] images = {"keyboard1.jpg", "keyboard2.jpg"};
	String message = "";

	if(!photo.endsWith(".jpg")&&!photo.endsWith(".png")){
		message +="not valid photo extension [.jpg | .png]";
	}
	
	if(!message.equals("")){
		response.sendRedirect("updateproduct.jsp?productid="+ productid +"&message=" +  message);
	}else{
		String query = "update product set name='"+ name +"', price="+ price +", weight=" + weight + ", stock = " + stock + ", image='"+ images[n] +"' where productid = " + productid;
		st.executeUpdate(query);
		response.sendRedirect("product.jsp?message=Success to update product");
	}
	
%>