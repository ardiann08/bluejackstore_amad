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
         <form class="form-horizontal" action="doUpdateProfile.jsp" method="POST">
            <fieldset>
               <legend>User profile</legend>
               <div class="form-group">
                  <label class="col-md-4 control-label">Old Password</label>  
                  <div class="col-md-5">
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-key" aria-hidden="true"></i>
                        </div>
                        <input type="password" class="form-control input-md" name="opassword">
                     </div>
                  </div>
               </div>

               <div class="form-group">
                  <label class="col-md-4 control-label">New Password</label>  
                  <div class="col-md-5">
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-key" aria-hidden="true"></i>
                        </div>
                        <input type="password" class="form-control input-md" name="npassword">
                     </div>
                  </div>
               </div>

               <div class="form-group">
                  <label class="col-md-4 control-label">Confirm New Password</label>  
                  <div class="col-md-5">
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-key" aria-hidden="true"></i>
                        </div>
                        <input type="password" class="form-control input-md" name="cnpassword">
                     </div>
                  </div>
               </div>

               <div class="form-group">
                  <label class="col-md-4 control-label" >Phone number </label>  
                  <div class="col-md-5">
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-phone"></i>
                        </div>
                        <input type="text" name="phone" class="form-control input-md" value="<%= rs.getString("phone")%>">
                     </div>                     
                  </div>
               </div>
               <div class="form-group">
                  <label class="col-md-4 control-label">Address</label>
                  <div class="col-md-5">                     
                   <textarea class="form-control" rows="5" name="address"><%= rs.getString("address")%></textarea>
                </div>
             </div>
             <div class="form-group">
               <label class="col-md-4 control-label" for="Upload photo">Upload photo</label>
               <div class="col-md-5">
                  <input  name="fPhoto" class="input-file" type="file">
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
                  <button type="submit" class="btn btn-success form-control">Confirm</button>
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