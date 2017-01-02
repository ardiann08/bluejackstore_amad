<%@include file="../helper/connect.jsp"%>

<%
	String userid = (String)session.getAttribute("userid");
	Integer total = 0;
	String query = "select sum(tprice) as total from cart where userid = " + userid;
	Integer trid = 0;
	ResultSet rs = st.executeQuery(query);
	if(rs.next()){
		total = Integer.parseInt(rs.getString("total"));
	}
	query = "insert into transaction values(null, "+ userid +", "+ total +", 'waiting', null)";
	st.executeUpdate(query);

	query = "select trid from transaction order by trid desc";
	rs = st.executeQuery(query);
	if(rs.next()){
		trid = Integer.parseInt(rs.getString("trid"));
	}

	query = "select * from cart a join product b on a.productid = b.productid where userid = " + userid;
	rs = st.executeQuery(query);
	while(rs.next()){
		query = "insert into transactiondetail values(null, "+ trid +", "+ rs.getString("productid") +", "+ rs.getString("qty") +", "+ rs.getString("tprice") +")";
		stmt.executeUpdate(query);		
	}

	query = "delete from cart where userid = " + userid;
	st.executeUpdate(query);

	response.sendRedirect("transaction.jsp");

	

	//query = "select "


	//String query = "select * from cart where userid = " + userid;
	//ResultSet rs = st.executeQuery(query);
	//while(rs.next()){


	//}




%>