<%@page import="newpackage.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User user = (User) session.getAttribute("logUser");
    if(user==null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <style>
.button {
  /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  background-color: yellowgreen;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

body {
  background-image: url('img/5.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}

</style>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Join Us</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        


        
    
    </head>
    
    <body>
        <div class="container">
            <div class="regbox">
                <center>
        <h1>
 Welcome <%= user.getName() %></h1>
<h3>
Your Account ID: <%= user.getId() %> </h3>
<h3>
Your Email: <%= user.getEmail() %> </h3>
<h3>
Your Password: <%= user.getPassword() %></h3>
</center>
<p align="center">          
<button class="button button-primary button-sm button-dark"><a href="Logout">Log Out</a></button><br><br>
</p> 

    <center>
    
        <button class="button"><a href="addtask.jsp">Add </a></button><br><br>
        
     <button class="button"><a href="viewtasks.jsp">View</a></button>
    
     </center>
            </div>
        </div>
    </body>
</html>