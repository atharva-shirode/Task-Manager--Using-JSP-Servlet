
<%@page import="newpackage.*"%>
<%@page import="com.sun.org.glassfish.gmbal.Description"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%ConnectionPro con = new ConnectionPro(); %>

<%
    
try
{
	
	
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		int hide; 
		
		String activi_up, descri_up,date_up;
		
		hide=Integer.parseInt(request.getParameter("txt_hide")); //it is hidden id get for update record
		activi_up=request.getParameter("txt_activ"); 
		descri_up=request.getParameter("txt_descri"); 
                date_up=request.getParameter("txt_date");
		
                
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.getConnection().prepareStatement("update task set Activity=?, Description=? , Date=? where id=?"); //sql update query 
		pstmt.setString(1,activi_up);
		pstmt.setString(2,descri_up);
                pstmt.setString(3,date_up);
		pstmt.setInt(4,hide);
		pstmt.executeUpdate(); //execute query
		
		//con.close(); //connection close

		out.println("Update Successfully...! Click Back link."); //after update record successfully message
	}	
	
}
catch(Exception e)
{
	out.println(e);
}

%>

<html>

	<head>
	
		<title>JSP:Insert, Update, Delete using MySQL</title>
		
	<!--css for div main class and table-->
	<style type="text/css">
		
		.main
		{
			width:700px;;
			margin-left:250px;
			padding: 10px;
			border: 5px solid grey;
			
		}
		table
		{
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 600px;
		}
		td
		{
			border: 5px solid silver;
			text-align: left;
			padding: 8px;
		}
		</style>	
		
		<!-- javascript for form validation-->
		<script>
		
			
			function validate()
			{
				var activity= document.myform.txt_activ;
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

	<div class="main">

	<form method="post" name="myform"  onsubmit="return validate();">
	
		<center>
			<h1>Update Record</h1>
		</center>
		
		<table>	
		   <%
		try
		{
			//Class.forName("com.mysql.cj.jdbc.Driver"); //load driver  
		
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_db","root",""); // create connection  
	
			if(request.getParameter("edit")!=null) 
			{
				int id=Integer.parseInt(request.getParameter("edit"));
		
				String Activity,Description,Date;
                                
                  System.out.println(id);
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.getConnection().prepareStatement("select * from task where id=?"); // sql select query
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					id=rs.getInt(1);
					Activity=rs.getString(2);
					Description=rs.getString(3);
                                        Date=rs.getString(4);
			%>
			<tr>
				<td>Activity</td>
				<td><input type="text" name="txt_activ" value="<%=Activity%>"></td>
			</tr>
			
			<tr>
				<td>Description</td>
				<td><input type="text" name="txt_descri" value="<%=Description%>"></td>
			</tr>	
                        <tr>
				<td>Date</td>
				<td><input type="date" name="txt_date" value="<%=Date%>"></td>
			</tr>	
			
                        
			<tr>
				<td><input type="submit" name="btn_update" value="Update"></td>	
			</tr>
				
				<input type="hidden" name="txt_hide" value="<%=id%>">
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		
		<center>
				<h1><a href="Wlcm.jsp">Back</a></h1>
		</center>
		
	</form>

	</div>
	
		
</body>

</html>