<%@ page import="java.sql.*" %>

<%
	//Class yang dipakai untuk mysql
	Class.forName("com.mysql.jdbc.Driver");

	/* jdbc:mysql://localhost:3306/nama_database, user_name, password  */
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectwebprog", "root", "");	
	Statement st = con.createStatement();
	Statement stmt = con.createStatement();

%>
