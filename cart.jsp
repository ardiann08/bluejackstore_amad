<%@include file="master/header.jsp"%>


<div class="container">
	<div class="row">
		<span style="color: red">
			<%= request.getParameter("message") != null ? request.getParameter("message") : "" %>
		</span>
		<%
			String query="select * from cart a join product b on a.productid = b.productid where a.userid = " + session.getAttribute("userid");
			ResultSet rs = st.executeQuery(query);
		if(!rs.next()){
		%>
			<h3>No data in cart</h3>

		<%}else{
			rs.beforeFirst();
			
			while(rs.next()){
		%>
			<form>
				<div class="col-md-12 col-sm-6 col-xs-6 box">
					<div class="product-header col-md-12">
						<h3>Cart ID : <%=rs.getString("cartid")%> 
							<a href="doDeleteCart.jsp?id=<%= rs.getString("cartid")%>">
								<span class="pull-right glyphicon glyphicon-remove"></span>
							</a>
						</h3>
					</div>
					<div class="col-md-12">
						<div class="col-md-3">
							<img src="source/img/<%=rs.getString("image")%>" alt="" class="full-width">
						</div>
						<div class="col-md-5 product-detail">
							<div>
								<label for="">Name : <%=rs.getString("name")%></label>
							</div>
							<div>
								<label for="">Quantiy : <%=rs.getString("qty")%></label>
							</div>
							<div>
								<label for="">Sub-total price : <%=rs.getString("tprice")%></label>
							</div>										
						</div>				
					</div>	
				</div>
				<%}%>	
			<div class="form-group">
				<a href="doCompletePayment.jsp" class="form-control btn btn-default">Complete the Payment</a>
			</div>
			<%}%>
		</form>	
	</div>

</div>


<%@include file="master/footer.jsp"%>