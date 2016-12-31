<%@include file="master/header.jsp"%>
<% 
	String email = "";
	String pass = "";
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0;i<cookies.length;i++){			
			if(cookies[i].getName().equals("email")){
				email = cookies[i].getValue();
			}else if(cookies[i].getName().equals("password")){
				pass = cookies[i].getValue();
			}
			
		}
	}
%>

<div class="container">
	<div class="row">
		<div class="panel panel-primary col-md-offset-2 col-md-8 down">
			<div class="panel-body">
				<form method="POST" action="doLogin.jsp" role="form">					
					<div class="form-group">
						<label class="control-label">Email</label>
						<input  type="text" maxlength="50" class="form-control" name="email" value=<%= email%>>
					</div>
					<div class="form-group">
						<label class="control-label">Password</label>
						<input  type="password" maxlength="50" class="form-control" name="password" value=<%= pass%>>
					</div>
					<div class="form-group">
						<label class="control-label"></label>
						<label><input  type="checkbox"  name="rememberme"> remember me</label>
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
						<button name="signupSubmit" type="submit" class="btn btn-info btn-block">Log in</button>
					</div>					
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="master/footer.jsp"%>