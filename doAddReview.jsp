<%@include file="../helper/connect.jsp"%>
	
<%
	String productid = request.getParameter("productid");
	String content = request.getParameter("content");
	String rating = request.getParameter("rating");
	String message="";
	if(content.length()>255){
		message="Content max length is 255 character<br/>";
	}
	if(message.equals("")){
		String query = "insert into review values(null,"+session.getAttribute("userid")+","+productid+",'"+content+"',"+rating+")";
		st.executeUpdate(query);
		response.sendRedirect("review.jsp?id="+productid);
	}else{
		response.sendRedirect("review.jsp?id="+productid+"&message="+message);
	}
%>