<%@include file="master/header.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-md-offset-5">
			<h2>All Transaction</h2>
		</div>
		<span style="color: red">
			<%= request.getParameter("message") != null ? request.getParameter("message") : "" %>
		</span>
		<%
		String query="SELECT * FROM transaction a join user b on a.userid = b.userid";
		ResultSet rs = st.executeQuery(query);
		while(rs.next()){
		%>
		<div class="col-md-12 col-sm-6 col-xs-6 box">
			<div class="product-header col-md-12">
				<h3>Transaction ID : <%=rs.getString("trid")%></h3>
			</div>
			<div class="col-md-12">
				<div class="product-detail">
					<label class="pull-right" style="color: blue">By : <%= rs.getString("fullname")%></label>
					<%
						query = "select * from transactiondetail a join product b on a.productid = b.productid where trid = " + rs.getString("trid");
						ResultSet rs2 = stmt.executeQuery(query);
						Integer count = 1;
						while(rs2.next()){
					%>
						<div>
							<label><%= count%>. <%=rs2.getString("name")%> - Rp. <%= rs2.getString("subtotalprice")%>,- (Rp. <%= rs2.getString("price")%> x <%= rs2.getString("qty")%> ) </label>
						</div>						
					<% count++; }%>	
					<p></p>
						<% if(session.getAttribute("role").equals("member")){ %>
							<label class="pull-right" style="color: blue">status : <%= rs.getString("status")%></label>
						<%} else{
							if(rs.getString("status").equals("waiting")){
						%>
							<label class="pull-right">
								<a href="doApprove.jsp?id=<%= rs.getString("trid")%>" class="btn btn-default">Approve</a>
							</label>
						<%} else {%>
							<label class="pull-right" style="color: blue">status : <%= rs.getString("status")%></label>
						<%}%>
					<%}%>
				</div>				
			</div>	
		</div>
		<%}%>
	</div>

</div>


<%@include file="master/footer.jsp"%>