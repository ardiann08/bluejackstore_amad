<%@include file="master/header.jsp"%>


<div class="container">
	<div class="row">
		<div class="panel panel-primary col-md-offset-1 col-md-10">
			<div class="panel-body">
				<form method="POST" action="doRegister.jsp" role="form">
					<div class="form-group">
						<h2>Create account</h2>
					</div>
					<div class="form-group">
						<label class="control-label">Fullname</label>
						<input  type="text" maxlength="50" class="form-control" name="fullname">
					</div>
					<div class="form-group">
						<label class="control-label">Phone</label>
						<input  type="text" maxlength="50" class="form-control" name="phone">
					</div>
					<div class="form-group">
						<label class="control-label">Email</label>
						<input  type="text" maxlength="50" class="form-control" name="email">
					</div>
					<div class="form-group">
						<label class="control-label">Password</label>
						<input  type="password" maxlength="50" class="form-control" name="password">
					</div>
					<div class="form-group">
						<label class="control-label">Confirm Password</label>
						<input  type="password" maxlength="50" class="form-control" name="cpassword">
					</div>
					<div class="form-group">
						<label class="control-label">Gender</label> <br>
						<label><input type="radio" name="gender" value="male">Male</label>
						<label><input type="radio" name="gender" value="female">Female</label>
					</div>
					<div class="form-group">
						<label class="control-label">Date of Birth</label> <br>
						<input  type="date" class="form-control" name="dob">
					</div>
					<div class="form-group">
						<label class="control-label">Address</label>
						<textarea rows="5" class="form-control" name="address"></textarea>
					</div>
					<div class="form-group">
						<label class="control-label">Photo</label>
						<input type="file" name="fPhoto" />
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
						<button name="signupSubmit" type="submit" class="btn btn-info btn-block">Create your account</button>
					</div>
					<p class="form-group">By creating an account, you agree to our Terms of Use and our Privacy Policy. </p>
					<hr>
					<p></p>Already have an account? <a href="login.jsp">Sign in</a></p>
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="master/footer.jsp"%>