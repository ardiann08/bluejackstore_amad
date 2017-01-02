<%@include file="master/header.jsp"%>



<div class="container">
	<div class="row">
		<div class="panel panel-primary col-md-offset-1 col-md-10">
			<div class="panel-body">
				<form method="POST" action="doInsertProduct.jsp" role="form">
					<div class="form-group">
						<h2>Insert Product</h2>
					</div>
					<div class="form-group">
						<label class="control-label">Name</label>
						<input  type="text" maxlength="50" class="form-control" name="name" required="true" />						
					</div>
					<div class="form-group">
						<label class="control-label">Price</label>
						<input  type="number" min="1" class="form-control" name="price" required="true" />
					</div>
					<div class="form-group">
						<label class="control-label">Weight</label>
						<input  type="number" min="1" class="form-control" name="weight" required="true" />
					</div>
					<div class="form-group">
						<label class="control-label">Stock</label>
						<input  type="number" min="1" class="form-control" name="stock" required="true" />
					</div>
					<div class="form-group">
						<label class="control-label">Photo</label>
						<input  type="file" name="fPhoto" required />					
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
						<button type="submit" class="btn btn-info btn-block">Insert</button>
					</div>					
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="master/footer.jsp"%>