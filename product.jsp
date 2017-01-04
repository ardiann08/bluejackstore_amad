<%@include file="master/header.jsp"%>


<div class="container">
	<div class="row">
		<span style="color: red">
			<%= request.getParameter("message") != null ? request.getParameter("message") : "" %>
		</span>
		<div class="col-md-offset-5">
			<h2>All Product</h2>
		</div>
		<div class="pull-right">
			<form class="form-inline bottom">
				<div class="form-group">
					<input type="text" class="form-control" name="searchproduct">
					<button type="submit"  class="btn btn-primary form-control" >Search</button>
				</div>
			</form>
		</div>
		<%!
			String searchproduct="";
			int offset=0;
			int current=1;
			int limit=3;
			int itemCount=0;
		%>

		<%			

			String query="select * , fullname as postedby from product p , user u where p.insertby = u.userid";
			if(request.getParameter("searchproduct") != null){
				 query += " and name like '%" +  request.getParameter("searchproduct") + "%'";
			}
			if(request.getParameter("page")!=null){
				offset = (Integer.parseInt(request.getParameter("page"))-1) *limit  ;
				current=Integer.parseInt(request.getParameter("page"));
			}
			query+=" limit "+limit+" offset "+offset;
			itemCount=0;
			ResultSet counter = st.executeQuery("select * from product where name like '%"+searchproduct+"%'");
			while(counter.next()){
				itemCount++;
			}
			System.out.println(query);

			ResultSet rs = st.executeQuery(query);
			while(rs.next()){
		%>
		<div class="col-md-12 col-sm-6 col-xs-6 box">
			<div class="product-header col-md-12">
				<h3>ID : <%=rs.getString("productid")%></h3>
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
						<label for="">Price : <%=rs.getString("price")%></label>
					</div>
					<div>
						<label for="">Weight : <%=rs.getString("weight")%></label>
					</div>
					<div>
						<label for="">Stock : <%=rs.getString("stock")%></label>
					</div>
					<div>
						<em>Inserted by <%=rs.getString("postedby")%></em>
					</div>
					<div>
						<a href="review.jsp?id=<%=rs.getString("productid")%>">View Product Review</a>
					</div>	
				</div>
				<%if(session.getAttribute("role").equals("member")){%>
				<div class="col-md-4 cart-bottom">
					<form class="form-inline pull-right" method="POST" action="doAddCart.jsp">
						<div class="form-group">
							<input type="number" class="form-control" name="qty" value="1" min="1">
							<input type="hidden" name="productid" value="<%= rs.getString("productid")%>" />
						</div>
						<button type="submit" class="btn btn-default">Add To Cart</button>
					</form>
				</div>
				<%}%>
				<%if(session.getAttribute("role").equals("administrator")){%>
				<div class="col-md-4">		
					<form action="doDeleteProduct.jsp" method="POST" class="form-inline pull-right">
						<input type="hidden" name="productid" value="<%=rs.getString("productid")%>">
						<button type="submit" class="btn btn-default" onclick="return confirm('Are you sure ?')">Delete</button>
					</form>
					<form action="updateproduct.jsp" method="GET" class="form-inline pull-right">
						<input type="hidden" name="productid" value="<%=rs.getString("productid")%>">
						<button type="submit" class="btn btn-default">Update</button>
					</form>
				</div>
				<%}%>
			</div>	
		</div>
		<%}%>
		
	</div>
	<div class="col-md-offset-5 bottom">
			<%if(current!=1&&itemCount!=0){%>
			<a href="product.jsp?page=1<%if(!searchproduct.equals("")){out.print("&&");out.print("searchproduct="+searchproduct);}%>" class="btn btn-default"><<</a>
			<a href="product.jsp?page=<%=current-1%><%if(!searchproduct.equals("")){out.print("&&");out.print("searchproduct="+searchproduct);}%>" class="btn btn-default"><</a>
			<%}%>
			<%
				int totalpage = itemCount / limit;
				if(itemCount%limit!=0){
					totalpage++;
				}
				for(int i=1;i<totalpage+1;i++){
			%>
			<a href="product.jsp?page=<%=i%><%if(!searchproduct.equals("")){out.print("&&");out.print("searchproduct="+searchproduct);}%>" class="btn btn-default"><%=i%></a>
			<%}%>
			<%if(current!=totalpage&&itemCount!=0){%>
			<a href="product.jsp?page=<%=current+1%><%if(!searchproduct.equals("")){out.print("&&");out.print("searchproduct="+searchproduct);}%>" class="btn btn-default">></a>
			<a href="product.jsp?page=<%=totalpage%><%if(!searchproduct.equals("")){out.print("&&");out.print("searchproduct="+searchproduct);}%>" class="btn btn-default">>></a>
			<%}%>
	</div>

</div>


<%@include file="master/footer.jsp"%>