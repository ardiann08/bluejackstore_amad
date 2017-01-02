<%@include file="master/header.jsp"%>


<%
String reviewid = request.getParameter("reviewid");
String query = "select * from review where reviewid = " + reviewid;
ResultSet rs = st.executeQuery(query);
if(rs.next()){
%>

<div class="container">
	<div class="row">
		<div class="panel panel-primary col-md-offset-1 col-md-10">
			<div class="panel-body">
				<form method="POST" action="doUpdateReview.jsp" role="form">
					<input type="hidden" name="id" value="<%= rs.getString("reviewid")%>" />
					<div class="form-group">
						<h2>Update Review</h2>
					</div>
					<div class="form-group">
						<label class="control-label">Content</label>
						<textarea name="content" id="content" rows="5" maxlength="255" required="true"  class="form-control"><%=rs.getString("content")%></textarea>		
					</div>
					<div class="form-group">
						<label class="control-label">Rating</label>
						<input  type="number" min="1" max="5" class="form-control" name="rating" required="true"  value="<%= rs.getString("rating")%>">
					</div>
										
					<div class="form-group">
						<label class="control-label"></label>
						<div class="col-sm-5">
							<span style="color: red">
								<%= request.getParameter("message") != null ? request.getParameter("message") : "" %>
							</span>
						</div>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-info btn-block">Update</button>
					</div>					
				</form>
			</div>
		</div>
	</div>
</div>
<%}%>
<%@include file="master/footer.jsp"%>