<%-- 
    Document   : addtask
    Created on : 2 Feb, 2021, 10:37:34 PM
    Author     : ADS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@page import="newpackage.*"%>
<% User user = (User) session.getAttribute("logUser");%>

<%
try
{	
	Class.forName("com.mysql.cj.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_db","root",""); //create connection 

	if(request.getParameter("btn_add")!=null) //check button click event not null
	{
		String Activity,Description,Date,Type;
		
		Activity=request.getParameter("txt_activi"); 
		Description=request.getParameter("txt_descri");
                Date=request.getParameter("txt_date");
		
          
                        String s=  user.getName();
		PreparedStatement pstmt=null; //create statement 
		
		pstmt=con.prepareStatement("insert into task(uname,Activity,Description,Date)values(?,?,?,?)"); //sql insert query 
				
                pstmt.setString(1,s); 
                pstmt.setString(2,Activity); 
		pstmt.setString(3,Description);	
                pstmt.setString(4,Date);
		pstmt.executeUpdate(); //execute query
		
		con.close();  //close connection 
		
		out.println("Insert Successfully...! Click Back link.");// after insert record successfully message
		
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>
<!DOCTYPE html>
<html>
    <head>
        
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <style>
            body {
  background-image: url('img/7.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
          }
        </style>
        <title>JSP Page</title>
        <script>
		
			function validate()
			{
				var activity= document.myform.txt_activi;
				var description = document.myform.txt_descri;
                                var date= document.myform.txt_date;
				
				if (activity.value == "")
				{
					window.alert("please enter activity ?");
					name.focus();
					return false;
				}
				if (date.value == "")
				{
					window.alert("please enter  date?");
					owner.focus();
					return false;
				}
			}
			
		</script>
    </head>
    <body>
         <div class="container">
            <div class="regbox box">
        

		<form method="post" name="myform"  onsubmit="return validate();">
	
			<center>
				<h1>Insert Tasks</h1>
			</center>
		
			<center>
			<table>	
		
				<tr>
					<td>Task</td>
					<td><input type="text" name="txt_activi"></td>
                                </tr>
				
				<tr>
					<td>Faculty</td>
					<td><input type="text" name="txt_descri"></td>
                                </tr>	
                                
                                <tr>
					<td>Date</td>
					<td><input type="date" name="txt_date"></td>
                                </tr>
                             	
				
				<tr>
					<td><input type="submit" name="btn_add" value="Insert"></td>	
				</tr>
				
			</table>
                           
			
				
				
		</form>
                <button class="button"><a href="viewtasks.jsp">View</a></button><br><br>
                 
                 
		</div>
            </div>
       
   <button class="btn btn-primary btn-sm btn-dark"><a href="Welcm.jsp">Back</a></button>
         </center>
    </body>
</html>

