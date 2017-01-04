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
		<%!
			String searchmember="";
			int offset=0;
			int current=1;
			int limit=3;
			int itemCount=0;
		%>


		<%
		String query="select * from user";
		if(request.getParameter("searchmember") != null){
			query += " where fullname like '%" +  request.getParameter("searchmember") + "%'";
		}

		if(request.getParameter("page")!=null){
			offset = (Integer.parseInt(request.getParameter("page"))-1) *limit  ;
			current=Integer.parseInt(request.getParameter("page"));
		}
		query+=" limit "+limit+" offset "+offset;
		itemCount=0;
		ResultSet counter = st.executeQuery("select * from user where fullname like '%"+searchmember+"%'");
		while(counter.next()){
			itemCount++;
		}
		System.out.println(query);

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
	<div class="col-md-offset-5 bottom">
			<%if(current!=1&&itemCount!=0){%>
			<a href="member.jsp?page=1<%if(!searchmember.equals("")){out.print("&&");out.print("searchmember="+searchmember);}%>" class="btn btn-default"><<</a>
			<a href="member.jsp?page=<%=current-1%><%if(!searchmember.equals("")){out.print("&&");out.print("searchmember="+searchmember);}%>" class="btn btn-default"><</a>
			<%}%>
			<%
				int totalpage = itemCount / limit;
				if(itemCount%limit!=0){
					totalpage++;
				}
				for(int i=1;i<totalpage+1;i++){
			%>
			<a href="member.jsp?page=<%=i%><%if(!searchmember.equals("")){out.print("&&");out.print("searchmember="+searchmember);}%>" class="btn btn-default"><%=i%></a>
			<%}%>
			<%if(current!=totalpage&&itemCount!=0){%>
			<a href="member.jsp?page=<%=current+1%><%if(!searchmember.equals("")){out.print("&&");out.print("searchmember="+searchmember);}%>" class="btn btn-default">></a>
			<a href="member.jsp?page=<%=totalpage%><%if(!searchmember.equals("")){out.print("&&");out.print("searchmember="+searchmember);}%>" class="btn btn-default">>></a>
			<%}%>
	</div>

</div>


<%@include file="master/footer.jsp"%>