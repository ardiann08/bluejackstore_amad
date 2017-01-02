<%@include file="../helper/connect.jsp"%>

<%
	String trid = request.getParameter("id");
	String query = "update transaction set status = 'approve' where trid = " + trid;
	st.executeUpdate(query);
	response.sendRedirect("transactionadmin.jsp?message=Success to approve the transaction");
%>