<%@include file="master/header.jsp"%>

<style>
   .container{margin-top:10px;}
</style>

<%
    String query = "select * from user where userid = " + session.getAttribute("userid");
    ResultSet rs = st.executeQuery(query);
    if(rs.next()){
%>

<div class="container">
   <div class="row">
      <div class="col-md-10">
         <form class="form-horizontal">
            <fieldset>
               <legend>User profile</legend>
               <div class="form-group">
                  <label class="col-md-4 control-label" for="Name (Full name)">Name (Full name)</label>  
                  <div class="col-md-5">
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-user">
                           </i>
                        </div>
                        <input type="text" class="form-control input-md" value="<%= rs.getString("fullname")%>" disabled="true">
                     </div>
                  </div>
               </div>

               <div class="form-group">
                  <label class="col-md-4 control-label" for="Phone number ">Phone number </label>  
                  <div class="col-md-5">
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-phone"></i>
                        </div>
                        <input type="text" class="form-control input-md" value="<%= rs.getString("phone")%>" disabled="true">
                     </div>                     
                  </div>
               </div>

               <div class="form-group">
                  <label class="col-md-4 control-label" for="Email Address">Email Address</label>  
                  <div class="col-md-5">
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-envelope-o"></i>
                        </div>
                        <input type="text" class="form-control input-md" value="<%= rs.getString("email")%>" disabled="true">
                     </div>
                  </div>
               </div>

               <div class="form-group">
                  <label class="col-md-4 control-label" for="Gender">Gender</label>
                  <div class="col-md-5"> 
                      <% if(rs.getString("gender").equals("male")){ %>
                          <label class="radio-inline">
                             <input type="radio" value="male" name="gender"  checked="checked" disabled="true" />
                             Male
                          </label>
                          <label class="radio-inline">
                             <input type="radio" value="female" name="gender" disabled="true" />Female
                           </label> 
                      <%}else{ %>
                          <label class="radio-inline">
                             <input type="radio" name="gender"  value="male" disabled="true" />
                             Male
                          </label>
                          <label class="radio-inline">
                             <input type="radio" name="gender"  checked="checked" value="female" disabled="true"/>Female
                           </label> 
                      <%}%>                                          
                  </div>
               </div>

               <div class="form-group">
                  <label class="col-md-4 control-label" for="Date Of Birth">Date Of Birth</label>  
                  <div class="col-md-5">
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-birthday-cake"></i>
                        </div>
                        <input type="text" class="form-control input-md" value="<%= rs.getString("dob")%>" disabled="true">
                     </div>
                  </div>
               </div>

               <div class="form-group">
                  <label class="col-md-4 control-label">Address</label>
                  <div class="col-md-5">                     
                     <textarea class="form-control" rows="5" disabled="true"><%= rs.getString("address")%></textarea>
                  </div>
               </div>

              <div class="form-group">
                  <label class="col-md-4 control-label"></label>
                  <div class="col-md-5">
                     <span style="color: red">
                        <%= request.getParameter("message") != null ? request.getParameter("message") : "" %>
                     </span>
                  </div>
               </div>
               
               <div class="form-group">
                  <label class="col-md-4 control-label" ></label>  
                  <div class="col-md-5">
                     <a href="updateprofile.jsp" class="btn btn-success form-control">Update Profile</a>
                  </div>
               </div>
            </fieldset>
         </form>
      </div>
      <div class="col-md-2 hidden-xs">
       <img src="source/img/<%= rs.getString("photo")%>" class="img-responsive img-thumbnail ">
      </div>
   </div>
</div>


<%}%>

<%@include file="master/footer.jsp"%>