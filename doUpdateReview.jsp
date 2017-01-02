<%@include file="../helper/connect.jsp"%>

<%
	String reviewid = request.getParameter("id");
	String content = request.getParameter("content");
	String rating = request.getParameter("rating");
	
	String query = "update review set content='"+ content +"', rating="+ rating +" where reviewid = " + reviewid;
	st.executeUpdate(query);
	String query2 = "select * from review where reviewid = "+reviewid;
	ResultSet rs =  st.executeQuery(query2);
	if(rs.next()){
		response.sendRedirect("review.jsp?id="+rs.getString("productid")+"&message=Success to update review");
	}
	
	
	
%>