<%@include file="../helper/connect.jsp"%>

<%
	String reviewid = request.getParameter("reviewid");
	String productid= request.getParameter("productid");
	String query = "delete from review where reviewid = " + reviewid;
	st.executeUpdate(query);
	response.sendRedirect("review.jsp?id="+productid+"&message=success to delete cart");
%>