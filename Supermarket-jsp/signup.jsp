<%@ page import="java.sql.*" %>
	<%!
	ResultSet rs;
	Connection con;
	PreparedStatement ps;
	%>
	
	<%
	String name=request.getParameter("name");
	String Address =request.getParameter("address");
	String phone = request.getParameter("phone");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	boolean valid=false;
	try
	{
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql:///login","root","root");
						ps=con.prepareStatement("select username from usersignup");
						rs=ps.executeQuery();
						while(rs.next())
						{
							if(username.equals(rs.getString("username")))
							{
								valid=true;
								break;
							}
						}
						if(valid)
						{
							%>
							<html><font color=red><b>email already exist</b></font></html>
							<jsp:include page="login.html"/>
						<%	
						}
						else
						{
							ps=con.prepareStatement("insert into usersignup value(?,?,?,?,?)");
							ps.setString(1,name);
							ps.setString(2,Address);
							
							ps.setInt(3,Integer.parseInt(phone));
							ps.setString(4,username);
							ps.setString(5,password);
							ps.executeUpdate();
							response.sendRedirect("index.html");
						}
					}
					catch(Exception e)
					{
						out.print(e);
					}
		
%>