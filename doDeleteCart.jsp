<%@include file="../helper/connect.jsp"%>

<%
	String cartid = request.getParameter("id");
	String query = "select qty, productid from cart where cartid = " + cartid;
	Integer qty = 0;
	String productid = "";
	ResultSet rs = st.executeQuery(query);
	if(rs.next()){
		qty = Integer.parseInt(rs.getString("qty"));
		productid = rs.getString("productid");
	}
	query = "update product set stock = stock + " + qty + " where productid = " + productid;
	st.executeUpdate(query);
	query = "delete from cart where cartid = " + cartid;
	st.executeUpdate(query);
	response.sendRedirect("cart.jsp?message=success to delete cart");
%>