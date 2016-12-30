<%@include file="../helper/connect.jsp"%>

<%
	String fullname = request.getParameter("fullname");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String cpassword = request.getParameter("cpassword");
	String gender = request.getParameter("gender");
	String dob = request.getParameter("dob");
	String address = request.getParameter("address");
	String photo = request.getParameter("fPhoto");

	String message = "";


	if(fullname.equals("") ){
		message += "phone number must be filled <br/>";
	}
	if(!fullname.contains(" ")){
		message += "fullname must more than 1 words<br/>";
	}
	if(password.equals("") || cpassword.equals("")){
		message += "password must be filled and must same with confirm password <br/>";
	}
	if(email.equals("")){
		message += "Email must be filled<br/>";
	}
	if(address.equals("")){
		message += "address must be filled<br/>";
	}

	if(dob.equals("")){
		message += "dob must be filled <br/>";
	}
	if(!photo.endsWith(".jpg")&&!photo.endsWith(".png")){
		message +="not valid photo extension [.jpg | .png]";
	}


	if(!message.equals("")){
		response.sendRedirect("register.jsp?message=" + message);
	}else{
		String query = "insert into user values(null, '"+ fullname +"', '"+ phone +"', '"+ email +"', '"+ password +"', '"+ gender +"', '"+ dob +"', '"+ address +"', 'user.jpg', 'member')";
		st.executeUpdate(query);
		response.sendRedirect("register.jsp?message=success to register");
		//out.print(query);
	}






%>