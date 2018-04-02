<%@ page import="java.sql.*" %>

<%!	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
%>
	
	<%
		session.setAttribute("UserName",request.getParameter("username"));
		String Username=(String)(session.getAttribute("UserName"));
		String password=request.getParameter("password");
		boolean valid=false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///login","root","root");
			ps=con.prepareStatement("select username,password from Usersignup");
			rs=ps.executeQuery();
			while(rs.next())
			{
				if((Username.equals(rs.getString("username") )) && (password.equals(rs.getString("password")) ))
				{
					valid=true;
					break;
				}
			}
			if(valid)
			{
	%>
				<jsp:forward page="inbox.jsp"/>
	        <%			
		}
			else
			{
			%>
			<html><font color=red><b>email or password entered wrong</b></font></html>
				
			<jsp:include page="userlogin.html"/>
			<%	
			}
			
		}
		catch(Exception e){
			out.print(e);
		}
		
	
%>