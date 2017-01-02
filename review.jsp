<%@include file="master/header.jsp"%>

<%
String query="select * from product where productid = "+request.getParameter("id");
ResultSet rs = st.executeQuery(query);
if(rs.next()){
%>
<div class="container">
	<div class="row">
		<span style="color: red">
			<%= request.getParameter("message") != null ? request.getParameter("message") : "" %>
		</span>
		<div class="col-md-offset-3">
			<h2>Review <%=rs.getString("name")%></h2>
		</div>
		<div class="col-md-4 col-md-offset-4">
			<img src="source/img/<%=rs.getString("image")%>" alt="" class="full-width">
		</div>

		<%
		String query2 = "select * from review r , user u where productid = "+rs.getString("productid")+" and r.userid = u.userid";
		ResultSet rs2 = stmt.executeQuery(query2);
		while(rs2.next()){
		%>
		<div class="col-md-12 col-sm-6 col-xs-6 box" style="margin-top: 20px;">
			<div class="product-header col-md-12">
				<h3>ID : <%=rs2.getString("reviewid")%></h3>
			</div>
			<div class="col-md-12">
				<div class="col-md-2" style="margin:20px 0;">
					<img src="source/img/<%=rs2.getString("photo")%>" alt="" class="full-width">	
				</div>
				<div class="col-md-6 product-detail">
					<div>
						<label for="">Name : <%=rs2.getString("fullname")%></label>
					</div>	
					<div>
						<p><%=rs2.getString("content")%></p>
					</div>
					<div>
						<%for(int i=0;i<5;i++){
							if(i<Integer.parseInt(rs2.getString("rating"))){
								%> <span class="glyphicon glyphicon-star" style="color: gold"></span>
							<%}else{
								%> <span class="glyphicon glyphicon-star"></span>
							<%}
						}%>
					</div>
				</div>
				
				<%if(session.getAttribute("userid").equals(rs2.getString("userid"))){%>
				<div class="col-md-4">		
					<form action="doDeleteReview.jsp" method="POST" class="form-inline pull-right">
						<input type="hidden" name="reviewid" value="<%=rs2.getString("reviewid")%>">
						<input type="hidden" name="productid" value="<%=rs.getString("productid")%>">
						<button type="submit" class="btn btn-default" onclick="return confirm('Are you sure ?')">Delete</button>
					</form>
					<form action="updatereview.jsp" method="GET" class="form-inline pull-right">
						<input type="hidden" name="reviewid" value="<%=rs2.getString("reviewid")%>">
						<button type="submit" class="btn btn-default">Update</button>
					</form>
				</div>
				<%}%>
				
			</div>	
		</div>
		<%}%>
		<%if(session.getAttribute("role").equals("member")){%>
		<div class="col-md-6 col-md-offset-3" style="margin-bottom: 30px;">
			<h3 class="text-center">Add Review</h3>
			<hr>
			<form action="doAddReview.jsp" method="POST">
				<input type="hidden" name="productid" value="<%=rs.getString("productid")%>">
				<div class="form-group">
					<textarea name="content" id="content" rows="3" placeholder="Add Review..." class="form-control" required=""></textarea>
				</div>
				<div class="form-group">
					<label for="rating">Rating</label>
					<input type="number" min="1" value="1" max="5" name="rating" id="rating">
				</div>
				<button type="submit" class="btn btn-default pull-right">Add Review</button>
			</form>
		</div>
		<%}%>
	</div>

</div>

<%}%>
<%@include file="master/footer.jsp"%>