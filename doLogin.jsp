<%@include file="../helper/connect.jsp"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	String query = "select * from user where email='" + email + "' and password='" + password + "'";
	ResultSet rs = st.executeQuery(query);

	if(rs.next()){
		session.setAttribute("userid", rs.getString("userid"));
		session.setAttribute("role", rs.getString("role"));

		if(request.getParameter("rememberme")!=null){
			Cookie cemail = new Cookie("email",email);
			Cookie cpass = new Cookie("password",password);

			// set cookie expired for 1 hours
			cemail.setMaxAge(60*60*24);
			cpass.setMaxAge(60*60*24);

			cemail.setPath("/");
			cpass.setPath("/");

			response.addCookie(cemail);
			response.addCookie(cpass);
		}
		
		response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("login.jsp?message=Invalid username or password");
	}







%>