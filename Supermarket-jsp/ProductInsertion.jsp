<%@ page import="java.sql.*" %>

<%!
    ResultSet rs;
	Connection con;
	PreparedStatement ps;
 %>
 
 <%
  String P_Type=request.getParameter("P_TYPE");
  String P_Name=request.getParameter("P_NAME");
  String P_Units=request.getParameter("P_UNITS");
  String DOM=request.getParameter("P_MANFCT");
  String DOE=request.getParameter("P_EXP");
  try
	{
	
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql:///insertion","root","root");
					ps=con.prepareStatement("insert into insertmod value(?,?,?,?,?)");
					ps.setString(1,P_Type);	
					ps.setString(2,P_Name);
					ps.setInt(3,Integer.parseInt(P_Units));
					ps.setString(4,DOM);
					ps.setString(5,DOE);
					ps.executeUpdate();
					response.sendRedirect("adminproductinsertion.html");
	}
					
					catch(Exception e)
					{
						out.print(e);
					}
		
%>