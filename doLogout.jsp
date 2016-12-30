<%
	// delete all session 
	session.removeAttribute("userid");
	session.removeAttribute("role");	

	// user online mines 1 for every logout
	// Integer userOn = (Integer)application.getAttribute("userOn");
	// if(userOn!= 0){
	// 	userOn -= 1;
	// 	application.setAttribute("userOn", userOn);
	// }
	response.sendRedirect("index.jsp");
%>