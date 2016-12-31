<%@include file="../helper/connect.jsp"%>

<%
	String opassword = request.getParameter("opassword");
	String npassword = request.getParameter("npassword");
	String cnpassword = request.getParameter("cnpassword");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String photo = request.getParameter("fPhoto");

	String message = "";

	String query = "select * from user where userid = " + session.getAttribute("userid");
	ResultSet rs = st.executeQuery(query);
	if(rs.next()){
		if(!rs.getString("password").equals(opassword)){
			message += "Old password is not valid <br>";
		}
	}

	if(npassword.equals("") || cnpassword.equals("")){
		message += "password must be filled and must same with confirm password <br/>";
	}

	if(!npassword.equals(cnpassword)){
		message += "password and confirm password must be same <br/>";
	}

	if(address.equals("")){
		message += "address must be filled<br/>";
	}

	if(!photo.endsWith(".jpg")&&!photo.endsWith(".png")){
		message +="not valid photo extension [.jpg | .png]";
	}

	if(!message.equals("")){
		response.sendRedirect("updateprofile.jsp?message=" + message);
	}else{

		query = "update user set password = '" + npassword + "', phone='"+ phone +"', address='"+ address +"' ";
		st.executeUpdate(query);
		response.sendRedirect("profile.jsp?message=success to update profile");		
	}

%>