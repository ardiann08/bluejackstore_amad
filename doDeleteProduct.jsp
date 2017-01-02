<%@include file="../helper/connect.jsp"%>

<%
	String productid = request.getParameter("productid");
	String query = "delete from product where productid = " + productid;
	st.executeUpdate(query);
	response.sendRedirect("product.jsp?message=Success to delete the product");



%>