<%@include file="../helper/connect.jsp"%>

<%
	String productid = request.getParameter("productid");
	Integer qty = Integer.parseInt(request.getParameter("qty"));
	Integer price = 0;
	Integer tprice = 0;
	String query = "select price from product where productid = " + productid;
	ResultSet rs = st.executeQuery(query);
	if(rs.next()){
		price = Integer.parseInt(rs.getString("price"));
		tprice = price*qty;
	}

	query = "select cartid from cart where productid = " +productid;
	rs = st.executeQuery(query);
	if(rs.next()){
		query = "update cart set qty = qty + " + qty + ", tprice = tprice + "+ tprice +" where cartid = " + rs.getString("cartid");
		st.executeUpdate(query);
	}else{
		query = "insert into cart values(null, "+ session.getAttribute("userid") +", "+ productid +", "+ qty +", "+ tprice +")";
		st.executeUpdate(query);
	}	
	query = "update product set stock = stock - " + qty + " where productid = " + productid;
	st.executeUpdate(query);

	response.sendRedirect("product.jsp?message=success to product to cart");
%>