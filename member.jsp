<%@include file="master/header.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-md-offset-5">
			<h2>All Member</h2>
		</div>
		<div class="pull-right">
			<form class="form-inline bottom">
				<div class="form-group">
					<input type="text" class="form-control" name="searchmember">
					<button type="submit"  class="btn btn-primary form-control" >Search</button>
				</div>
			</form>
		</div>
		<span style="color: red">
			<%= request.getParameter("message") != null ? request.getParameter("message") : "" %>
		</span>
		<%
		String query="select * from user";
		if(request.getParameter("searchmember") != null){
			query += " where fullname like '%" +  request.getParameter("searchmember") + "%'";
		}
		ResultSet rs = st.executeQuery(query);
		while(rs.next()){
		%>
		<div class="col-md-12 col-sm-6 col-xs-6 box">
			<div class="col-md-12">
				<div class="col-md-3">
					<p></p>
					<img src="source/img/<%=rs.getString("photo")%>" alt="" width="120" height="120">
					<p></p>
				</div>
				<div class="col-md-5 product-detail">
					<div>
						<label for="">Name : <%=rs.getString("fullname")%></label>
					</div>
					<div>
						<label for="">Phone number : <%=rs.getString("phone")%></label>
					</div>
					<div>
						<label for="">Email : <%=rs.getString("email")%></label>
					</div>
					<div>
						<label for="">Address : <%=rs.getString("address")%></label>
					</div>									
				</div>				
			</div>	
		</div>
		<%}%>
	</div>

</div>


<%@include file="master/footer.jsp"%>