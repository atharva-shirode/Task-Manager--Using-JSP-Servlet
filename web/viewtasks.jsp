<%@page import="java.sql.*" %>
<%@page import="newpackage.*"%>
<% User user = (User) session.getAttribute("logUser");%>

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_db","root","");  //create connection 

	if(request.getParameter("delete")!=null)
	{
		int id=Integer.parseInt(request.getParameter("delete"));
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("delete from task where id=? "); //sql delete query
		pstmt.setInt(1,id);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //close connection
                out.println("Deleted Successfully...! Click Back link.");
	}
}
catch(Exception e)
{
	out.println(e);
}
%>	
<html>

	<head>
            
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
		<title>JSP</title>
		
		<!--css for div main class and table -->
		<style type="text/css">
		
		.main
		{
			width:675px;;
			margin-left:400px;
			padding: 10px;
			border: 5px solid grey;
			
		}
		table
		{
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 675px;
		}
		td
		{
			border: 5px solid silver;
			text-align: center;
			padding: 8px;
		}
              
            body {
  background-image: url('img/4.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
     
		</style>
		
		
	</head>	
	
<body>
    
                <div class="main">
		
		
			<center>
				<h1>View Tasks</h1>	
		
		<table>
		
			<tr>
				<th>id</th>
				<th>Task</th>
				<th>Description</th>
                                <th>Date</th>
				<th>Delete</th>
			</tr>
                        			</center>

		<%
		
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");  //load driver 
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_db","root","");  //creat connection 

			PreparedStatement pstmt=null; //create statement
                        String s=  user.getName();
                        
                       
		
			pstmt=con.prepareStatement("select * from task where uname=?"); //sql select query  
                        pstmt.setString(1, s);
			
			ResultSet rs=pstmt.executeQuery(); //execute query and set in resultset object rs.  
		
			while(rs.next())
			{	
		%>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
                                        <td><%=rs.getDate(5)%></td>
                                       
					
					
					<td><a href="?delete=<%=rs.getInt(1)%> ">Delete</a></td>
					
				</tr>
		<%
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		
		</table>
		
		</div>
            </div>
                
                <button class="button"><a href="Welcm.jsp"> Back</a></button><br><br>
               <button class="button"><a href="addtask.jsp">Add</a></button>
		
			
		
</body>

</html>
        
   
